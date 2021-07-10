package edu.ifes.ci.si.les.ec.services;

import java.util.Collections;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

@Service
public class UFService {
  @Autowired
  private UFRepository repository;

  public UF insert(UF obj) {
    obj.setId(null);
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
      // TODO corrigir mensagem
      throw new DataIntegrityException("Campo(s) obrigatório(s) do Livro não foi(foram) preenchido(s): Bairro")
    }
  }

  public UF findById(Integer id) {
    try {
      UF obj = repository.findById(id).get();
      return obj;
    } catch (NoSuchException e) {
      throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Livro.class.getName());
    }
  }

  public Collection<UF> findAll() {
    return repository.findAll()
  }

  public UF update(UF obj) {
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