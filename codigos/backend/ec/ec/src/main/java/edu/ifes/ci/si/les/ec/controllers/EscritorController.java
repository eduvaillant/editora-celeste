package edu.ifes.ci.si.les.ec.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.ifes.ci.si.les.ec.model.Escritor;
import edu.ifes.ci.si.les.ec.services.EscritorService;
import edu.ifes.ci.si.les.ec.services.exceptions.ConstraintException;

@RestController
@RequestMapping(value = "/escritores")
public class EscritorController {
  @Autowired
  private EscritorService service;

  @RequestMapping(method = RequestMethod.POST)
  public ResponseEntity<Escritor> insert(@Valid @RequestBody Escritor obj, BindingResult br) {
    if(br.hasErrors())
      throw new ConstraintException(br.getAllErrors().get(0).getDefaultMessage());
    obj = service.insert(obj);
    return ResponseEntity.ok().body(obj);
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.GET)
  public ResponseEntity<Escritor> find(@PathVariable Integer id) {
    Escritor obj = service.findById(id);
    return ResponseEntity.ok().body(obj);
  }
}
