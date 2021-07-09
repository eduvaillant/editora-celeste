package edu.ifes.ci.si.les.ec.services;

import java.util.Collection;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.Capitulo;
import edu.ifes.ci.si.les.ec.model.Capitulo;
import edu.ifes.ci.si.les.ec.repositories.CapituloRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.*;


@Service
public class CapituloService {
  @Autowired
  private CapituloRepository repository;

  public Capitulo insert(Usuario obj) {
    obj.setId(null);
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
        // TODO corrigir mensagem
        throw new DataIntegrityException("Campo(s) obrigatório(s) do Capitulo não foi(foram) preenchido(s): Bairro");
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

  public Collection<Capitulo> findByBook(Integer id) {
    try {
      Capitulo obj = repository.findByBook(id);
      return obj;
    } catch (NoSuchElementException e) {
      throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Usuario.class.getName());
    }
  }

  public Collection<Capitulo> findAll() {
    return repository.findAll();
  } 

  public Capitulo update(Usuario obj) {
    findById(obj.getId());
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
        throw new DataIntegrityException("Campo(s) obrigatório(s) do Capitulo não foi(foram) preenchido(s): Bairro");
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