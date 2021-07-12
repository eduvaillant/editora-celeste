package edu.ifes.ci.si.les.ec.services;

import java.util.Collection;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;

import edu.ifes.ci.si.les.ec.model.Bairro;
import edu.ifes.ci.si.les.ec.repositories.BairroRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.DataIntegrityException;
import edu.ifes.ci.si.les.ec.services.exceptions.ObjectNotFoundException;

public class BairroService {
  @Autowired
  private BairroRepository repository;

  public Bairro insert(Bairro obj) {
    obj.setId(null);
    try {
      return repository.save(obj);
    } catch (DataIntegrityException e) {
      throw new DataIntegrityException("Campo(s) obrigatório(s) do Bairro não foi(foram) preenchido(s)");
    }
  }

  public Bairro findById(Integer id) {
    try {
      Bairro obj = repository.findById(id).get();
      return obj;
    } catch (NoSuchElementException e) {
      throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo " + Bairro.class.getName());
    }
  }

  public Collection<Bairro> findAll() {
    return repository.findAll();
  }

  public Bairro update(Bairro obj) {
    findById(obj.getId());
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
      throw new DataIntegrityException("Campo(s) obrigatório(s) do Bairro não foi(foram) preenchido(s)");
    }
  }

  public void delete(Integer id) {
    findById(id);
    try {
      repository.deleteById(id);
    } catch (DataIntegrityViolationException e) {
      throw new DataIntegrityException("Não é possível excluir esta Cidade!");
    }
  }
}
