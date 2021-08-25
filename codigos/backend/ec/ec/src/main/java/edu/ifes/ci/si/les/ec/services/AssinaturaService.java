package edu.ifes.ci.si.les.ec.services;

import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.Assinatura;
import edu.ifes.ci.si.les.ec.repositories.AssinaturaRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.*;

@Service
public class AssinaturaService {
  @Autowired
  private AssinaturaRepository repository;

  public Assinatura insert(Assinatura obj) {
    obj.setId(null);
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
        throw new DataIntegrityException("Campo(s) obrigatório(s) do Assinatura não foi(foram) preenchido(s): ");
    }
  }

	public Assinatura findById(Integer id) {
		try {
			Assinatura obj = repository.findById(id).get();
			return obj;
		} catch (NoSuchElementException e) {
			throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Assinatura.class.getName());
		}
	}

  public Assinatura update(Assinatura obj) {
    findById(obj.getId());
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
        throw new DataIntegrityException("Campo(s) obrigatório(s) do Assinatura não foi(foram) preenchido(s).");
    }
  }

  public void cancel(Integer id) {
    findById(id);
    try {
        repository.deleteById(id);
    } catch (DataIntegrityViolationException e) {
        throw new DataIntegrityException("Não é possível excluir este Capítulo!");
    }
  }
}