package edu.ifes.ci.si.les.ec.services;

import java.util.Collection;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.Usuario;
import edu.ifes.ci.si.les.ec.repositories.UsuarioRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.*;

@Service
public class UsuarioService {
  
  @Autowired
  private UsuarioRepository repository;

  public Usuario insert(Usuario obj) {
    obj.setId(null);
      try {
        return repository.save(obj);
      } catch (DataIntegrityViolationException e) {
          throw new DataIntegrityException("Campo(s) obrigatório(s) do Usuário não foi(foram) preenchido(s): Bairro");
      }
  }

  public Usuario findById(Integer id) {
    try {
        Usuario obj = repository.findById(id).get();
        return obj;
      } catch (NoSuchElementException e) {
        throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Usuario.class.getName());
      }
  }

  public Collection<Usuario> findAll() {
    return repository.findAll();
  } 

  public Usuario update(Usuario obj) {
    findById(obj.getId());
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
        throw new DataIntegrityException("Campo(s) obrigatório(s) do Usuário não foi(foram) preenchido(s): Bairro");
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

  public Usuario findByEmailAndSenha(String email, String senha) {
    return repository.findByEmailAndSenha(email, senha);
  }  
}
