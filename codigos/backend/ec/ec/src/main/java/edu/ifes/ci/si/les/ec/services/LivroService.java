package edu.ifes.ci.si.les.ec.services;

import java.util.Collection;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.Livro;
import edu.ifes.ci.si.les.ec.model.Usuario;
import edu.ifes.ci.si.les.ec.repositories.LivroRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.*;

@Service
public class LivroService {
  @Autowired
  private LivroRepository repository;

  public Livro insert(Usuario obj) {
    obj.setId(null);
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
        // TODO corrigir mensagem
        throw new DataIntegrityException("Campo(s) obrigatório(s) do Livro não foi(foram) preenchido(s): Bairro");
    }
  }

  public Livro findById(Integer id) {
    try {
      Livro obj = repository.findById(id).get();
      return obj;
    } catch (NoSuchElementException e) {
      throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Livro.class.getName());
    }
  }

  public Collection<Livro> findByAuthor(Integer id) {
    try {
      Collection<Livro> obj = repository.findByAuthor(id);
      return obj;
    } catch (NoSuchElementException e) {
      throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Usuario.class.getName());
    }
  }

  public Collection<Livro> findAll() {
    return repository.findAll();
  } 

  public Livro update(Usuario obj) {
    findById(obj.getId());
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
        throw new DataIntegrityException("Campo(s) obrigatório(s) do Livro não foi(foram) preenchido(s): Bairro");
    }
  }

  public void delete(Integer id) {
    findById(id);
    try {
        repository.deleteById(id);
    } catch (DataIntegrityViolationException e) {
        throw new DataIntegrityException("Não é possível excluir este Usuário!");
    }
  }
}