package edu.ifes.ci.si.les.ec.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.Escritor;
import edu.ifes.ci.si.les.ec.repositories.EscritorRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.DataIntegrityException;

@Service
public class EscritorService {
  @Autowired
  private EscritorRepository repository;

  public Escritor insert(Escritor obj) {
    obj.setId(null);
    try {
      return repository.save(obj);
    } catch(DataIntegrityException e) {
      throw new DataIntegrityException("Campo(s) obrigatório(s) do Escritor não foi(foram) preenchido(s).");
    }
  }
}
