package edu.ifes.ci.si.les.ec.services;

import java.util.Collection;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.TipoDeLivro;
import edu.ifes.ci.si.les.ec.repositories.TipoDeLivroRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.DataIntegrityException;
import edu.ifes.ci.si.les.ec.services.exceptions.ObjectNotFoundException;

@Service
public class TipoDeLivroService {
  @Autowired
  private TipoDeLivroRepository repository;

  public TipoDeLivro insert(TipoDeLivro obj) {
    obj.setId(null);
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
      throw new DataIntegrityException("Campo(s) obrigatório(s) do Tipo de Livro não foi(foram) preenchido(s): Bairro");
    }
  }

  public TipoDeLivro findById(Integer id) {
    try {
      TipoDeLivro obj = repository.findById(id).get();
      return obj;
    } catch (NoSuchElementException e) {
      throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + TipoDeLivro.class.getName());
    }
  }

  public Collection<TipoDeLivro> findAll() {
    return repository.findAll();
  } 

  public TipoDeLivro update(TipoDeLivro obj) {
    findById(obj.getId());
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
      throw new DataIntegrityException("Campo(s) obrigatório(s) do Tipo de Livro não foi(foram) preenchido(s): ");
    }
  }

  public void delete(Integer id) {
    findById(id);
    try {
        repository.deleteById(id);
    } catch (DataIntegrityViolationException e) {
        throw new DataIntegrityException("Não é possível excluir este Tipo de Livro!");
    }
  }
}
