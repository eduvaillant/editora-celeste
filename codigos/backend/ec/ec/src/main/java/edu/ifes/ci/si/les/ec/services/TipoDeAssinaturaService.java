package edu.ifes.ci.si.les.ec.services;

import java.util.Collection;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.TipoDeAssinatura;
import edu.ifes.ci.si.les.ec.repositories.TipoDeAssinaturaRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.DataIntegrityException;
import edu.ifes.ci.si.les.ec.services.exceptions.ObjectNotFoundException;

@Service
public class TipoDeAssinaturaService {
  @Autowired
  private TipoDeAssinaturaRepository repository;

  public TipoDeAssinatura insert(TipoDeAssinatura obj) {
    obj.setId(null);
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
      throw new DataIntegrityException("Campo(s) obrigatório(s) do Tipo de Assinatura não foi(foram) preenchido(s): ");
    }
  }

  public TipoDeAssinatura findById(Integer id) {
    try {
      TipoDeAssinatura obj = repository.findById(id).get();
      return obj;
    } catch (NoSuchElementException e) {
      throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + TipoDeAssinatura.class.getName());
    }
  }

  public Collection<TipoDeAssinatura> findAll() {
    return repository.findAll();
  } 

  public TipoDeAssinatura update(TipoDeAssinatura obj) {
    findById(obj.getId());
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
      throw new DataIntegrityException("Campo(s) obrigatório(s) do Tipo de Assinatura não foi(foram) preenchido(s): ");
    }
  }

  public void delete(Integer id) {
    findById(id);
    try {
        repository.deleteById(id);
    } catch (DataIntegrityViolationException e) {
        throw new DataIntegrityException("Não é possível excluir este Tipo de Assinatura!");
    }
  }
}
