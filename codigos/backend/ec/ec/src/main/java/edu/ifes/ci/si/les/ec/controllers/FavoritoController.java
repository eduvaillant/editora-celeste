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

import edu.ifes.ci.si.les.ec.model.Favorito;
import edu.ifes.ci.si.les.ec.services.FavoritoService;
import edu.ifes.ci.si.les.ec.services.exceptions.ConstraintException;

@RestController()
@RequestMapping(value = "/favorito")
public class FavoritoController {
  @Autowired
  private FavoritoService service;

  @RequestMapping(method = RequestMethod.POST)
  public ResponseEntity<Favorito> insert(@Valid @RequestBody Favorito obj, BindingResult br) {
    if (br.hasErrors())
      throw new ConstraintException(br.getAllErrors().get(0).getDefaultMessage());
    obj = service.insert(obj);
    return ResponseEntity.ok().body(obj);
  }

  @RequestMapping(value = "/usuario/{id}", method = RequestMethod.GET)
  public ResponseEntity<Collection<Favorito>> findByUsuario(@PathVariable Integer id) {
    Collection<Favorito> collection = service.findByUsuario(id);
    return ResponseEntity.ok().body(collection);
  }

  @RequestMapping(value="/{id}", method = RequestMethod.DELETE)
  public ResponseEntity<Void> delete(@PathVariable Integer id) {
    service.delete(id);
    return ResponseEntity.noContent().build();
  }
}
