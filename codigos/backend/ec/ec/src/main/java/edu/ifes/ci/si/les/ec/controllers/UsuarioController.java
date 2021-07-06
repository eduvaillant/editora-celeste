package edu.ifes.ci.si.les.ec.controllers;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.ifes.ci.si.les.ec.model.Usuario;
import edu.ifes.ci.si.les.ec.services.UsuarioService;
import edu.ifes.ci.si.les.ec.services.exceptions.ConstraintException;

@RestController()
@RequestMapping(value = "/usuarios")
public class UsuarioController {

  @Autowired
  private UsuarioService service;
  
  @RequestMapping(method = RequestMethod.POST)
  public ResponseEntity<Usuario> insert(@Valid @RequestBody Usuario obj, BindingResult br) {
      if (br.hasErrors())
        throw new ConstraintException(br.getAllErrors().get(0).getDefaultMessage());
      obj = service.insert(obj);
      return ResponseEntity.ok().body(obj);
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.GET)
  public ResponseEntity<Usuario> find(@PathVariable Integer id) {
    Usuario obj = service.findById(id);
    return ResponseEntity.ok().body(obj);
  }

  @RequestMapping(method = RequestMethod.GET)
  public ResponseEntity<Collection<Usuario>> findAll() {
    Collection<Usuario> collection = service.findAll();
    return ResponseEntity.ok().body(collection);
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
  public ResponseEntity<Usuario> update(@Valid @RequestBody Usuario obj, BindingResult br) {
    if (br.hasErrors())
      throw new ConstraintException(br.getAllErrors().get(0).getDefaultMessage());
    obj = service.update(obj);
    return ResponseEntity.ok().body(obj);
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
  public ResponseEntity<Void> delete(@PathVariable Integer id) {
    service.delete(id);
    return ResponseEntity.noContent().build();
  }

  @RequestMapping(value = "/{email}/{senha}", method = RequestMethod.GET)
  public ResponseEntity<Usuario> findByEmailAndSenha(@PathVariable String email, @PathVariable String senha) {
      Usuario obj = service.findByEmailAndSenha(email, senha);
      return ResponseEntity.ok().body(obj);
  }
}