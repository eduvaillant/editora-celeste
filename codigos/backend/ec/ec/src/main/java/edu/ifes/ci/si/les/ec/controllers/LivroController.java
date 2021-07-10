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

import edu.ifes.ci.si.les.ec.model.Livro;
import edu.ifes.ci.si.les.ec.services.LivroService;
import edu.ifes.ci.si.les.ec.services.exceptions.ConstraintException;

@RestController()
@RequestMapping(value = "/livros")
public class LivroController {
  @Autowired
  private LivroService service;

  @RequestMapping(method = RequestMethod.POST)
  public ResponseEntity<Livro> insert(@Valid @RequestBody Livro obj, BindingResult br) {
      if (br.hasErrors())
        throw new ConstraintException(br.getAllErrors().get(0).getDefaultMessage());
      obj = service.insert(obj);
      return ResponseEntity.ok().body(obj);
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.GET)
  public ResponseEntity<Livro> find(@PathVariable Integer id) {
    Livro obj = service.findById(id);
    return ResponseEntity.ok().body(obj);
  }

  // Listar todos livros
  @RequestMapping(method = RequestMethod.GET)
  public ResponseEntity<Collection<Livro>> findAll() {
    Collection<Livro> collection = service.findAll();
    return ResponseEntity.ok().body(collection);
  }

  // Listar todos livros por autor
  @RequestMapping(value = "/escritor/{id}", method = RequestMethod.GET)
  public ResponseEntity<Collection<Livro>> findByAuthor(@PathVariable Integer id) {
    Collection<Livro> collection = service.findByEscritorId(id);
    return ResponseEntity.ok().body(collection);
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
  public ResponseEntity<Livro> update(@Valid @RequestBody Livro obj, BindingResult br) {
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
