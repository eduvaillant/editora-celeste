package edu.ifes.ci.si.les.ec.controllers;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.ifes.ci.si.les.ec.model.TipoDeLivro;
import edu.ifes.ci.si.les.ec.services.TipoDeLivroService;
import edu.ifes.ci.si.les.ec.services.exceptions.ConstraintException;

@RestController()
@CrossOrigin
@RequestMapping(value = "/tipo-de-livro")
public class TipoDeLivroController {
  @Autowired
  private TipoDeLivroService service;

  @RequestMapping(method = RequestMethod.POST)
  public ResponseEntity<TipoDeLivro> insert(@Valid @RequestBody TipoDeLivro obj, BindingResult br) {
    if (br.hasErrors())
      throw new ConstraintException(br.getAllErrors().get(0).getDefaultMessage());
    obj = service.insert(obj);
    return ResponseEntity.ok().body(obj);
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.GET)
  public ResponseEntity<TipoDeLivro> find(@PathVariable Integer id) {
    TipoDeLivro obj = service.findById(id);
    return ResponseEntity.ok().body(obj);
  }

  @RequestMapping(method = RequestMethod.GET)
  public ResponseEntity<Collection<TipoDeLivro>> findAll() {
    Collection<TipoDeLivro> collection = service.findAll();
    return ResponseEntity.ok().body(collection);
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
  public ResponseEntity<TipoDeLivro> update(@Valid @RequestBody TipoDeLivro obj, BindingResult br) {
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
}
