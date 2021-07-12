package edu.ifes.ci.si.les.ec.services;

import java.util.Collection;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.UF;
import edu.ifes.ci.si.les.ec.repositories.UFRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.*;

@Service
public class UFService {
  @Autowired
  private UFRepository repository;

  public UF insert(UF obj) {
    obj.setId(null);
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
      throw new DataIntegrityException("Campo(s) obrigatório(s) do UF não foi(foram) preenchido(s)");
    }
  }

  public UF findById(Integer id) {
    try {
      UF obj = repository.findById(id).get();
      return obj;
    } catch (NoSuchElementException e) {
      throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + UF.class.getName());
    }
  }

  public Collection<UF> findAll() {
    return repository.findAll();
  }

  public UF update(UF obj) {
    findById(obj.getId());
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
      throw new DataIntegrityException("Campo(s) obrigatório(s) do UF não foi(foram) preenchido(s)");
    }
  }

  public void delete(Integer id) {
    findById(id);
    try {
      repository.deleteById(id);
    } catch (DataIntegrityViolationException e) {
      throw new DataIntegrityException("Não é possível excluir este UF!");
    }
  }
}