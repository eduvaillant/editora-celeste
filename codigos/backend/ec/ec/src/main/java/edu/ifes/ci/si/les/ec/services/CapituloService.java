package edu.ifes.ci.si.les.ec.services;

import java.util.Collection;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.Capitulo;
import edu.ifes.ci.si.les.ec.repositories.CapituloRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.*;


@Service
public class CapituloService {
  @Autowired
  private CapituloRepository repository;

  public Capitulo insert(Capitulo obj) {
    obj.setId(null);
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
        throw new DataIntegrityException("Campo(s) obrigatório(s) do Capitulo não foi(foram) preenchido(s): ");
    }
  }

  public Capitulo findById(Integer id) {
    try {
    Capitulo obj = repository.findById(id).get();
      return obj;
    } catch (NoSuchElementException e) {
      throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Capitulo.class.getName());
    }
  }

  public Collection<Capitulo> findByBook(Integer livro_id) {
    try {
      Collection<Capitulo> obj = repository.findByLivroId(livro_id);
      return obj;
    } catch (NoSuchElementException e) {
      throw new ObjectNotFoundException("Objeto não encontrado! Id: " + livro_id + ", Tipo: " + Capitulo.class.getName());
    }
  }

  public Collection<Capitulo> findAll() {
    return repository.findAll();
  } 

  public Capitulo update(Capitulo obj) {
    findById(obj.getId());
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
        throw new DataIntegrityException("Campo(s) obrigatório(s) do Capitulo não foi(foram) preenchido(s).");
    }
  }

  public void delete(Integer id) {
    findById(id);
    try {
        repository.deleteById(id);
    } catch (DataIntegrityViolationException e) {
        throw new DataIntegrityException("Não é possível excluir este Capítulo!");
    }
  }
}