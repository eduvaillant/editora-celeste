package edu.ifes.ci.si.les.ec.services;

import java.util.Collection;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.Post;
import edu.ifes.ci.si.les.ec.model.Usuario;
import edu.ifes.ci.si.les.ec.repositories.PostRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.*;

@Service
public class PostService {
  @Autowired
  private PostRepository repository;
  
  public Post insert(Post obj) {
    obj.setId(null);
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
        throw new DataIntegrityException("Campo(s) obrigatório(s) do Post não foi(foram) preenchido(s): ");
    }
  }

  public Post findById(Integer id) {
    try {
      Post obj = repository.findById(id).get();
      return obj;
    } catch (NoSuchElementException e) {
      throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Post.class.getName());
    }
  }

  public Collection<Post> findByEscritorId(Integer id) {
    try {
      Collection<Post> obj = repository.findByEscritorId(id);
      return obj;
    } catch (NoSuchElementException e) {
      throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Usuario.class.getName());
    }
  }

  public Collection<Post> findAll() {
    return repository.findAll();
  } 

  public Post update(Post obj) {
    findById(obj.getId());
    try {
      return repository.save(obj);
    } catch (DataIntegrityViolationException e) {
        throw new DataIntegrityException("Campo(s) obrigatório(s) do Post não foi(foram) preenchido(s): ");
    }
  }

  public void delete(Integer id) {
    findById(id);
    try {
        repository.deleteById(id);
    } catch (DataIntegrityViolationException e) {
        throw new DataIntegrityException("Não é possível excluir este Post!");
    }
  }
}