package edu.ifes.ci.si.les.ec.services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.Usuario;
import edu.ifes.ci.si.les.ec.repositories.UsuarioRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.DataIntegrityException;

@Service
public class UsuarioService {
  
  @Autowired
  private UsuarioRepository repository;

  public Usuario insert(Usuario obj) {
    obj.setId(null);
      try {
        return repository.save(obj);
      } catch (DataIntegrityViolationException e) {
          throw new DataIntegrityException("Campo(s) obrigatório(s) do Funcionário não foi(foram) preenchido(s): Bairro");
      }
  }

  public Collection<Usuario> findAll() {
    return repository.findAll();
  }
}
