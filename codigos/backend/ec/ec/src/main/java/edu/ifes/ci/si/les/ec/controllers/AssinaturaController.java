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

import edu.ifes.ci.si.les.ec.model.Assinatura;
import edu.ifes.ci.si.les.ec.services.AssinaturaService;
import edu.ifes.ci.si.les.ec.services.exceptions.ConstraintException;

@RestController()
@CrossOrigin
@RequestMapping(value = "/assinatura")
public class AssinaturaController {
  @Autowired
  private AssinaturaService service;

  @RequestMapping(method = RequestMethod.POST)
  public ResponseEntity<Assinatura> insert(@Valid @RequestBody Assinatura obj, BindingResult br) {
    if (br.hasErrors())
      throw new ConstraintException(br.getAllErrors().get(0).getDefaultMessage());
    obj = service.insert(obj);
    return ResponseEntity.ok().body(obj);
  }

	@RequestMapping(value ="/usuario/{id}", method = RequestMethod.GET)
  public ResponseEntity<Collection<Assinatura>> findByUsuario(@PathVariable Integer id) {
    Collection<Assinatura> collection = service.findByUsuario(id);
    return ResponseEntity.ok().body(collection);
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
  public ResponseEntity<Assinatura> update(@Valid @RequestBody Assinatura obj, BindingResult br) {
    if (br.hasErrors())
      throw new ConstraintException(br.getAllErrors().get(0).getDefaultMessage());
    obj = service.update(obj);
    return ResponseEntity.ok().body(obj);
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.POST)
  public ResponseEntity<Void> cancel(@PathVariable Integer id) {
    service.cancel(id);
    return ResponseEntity.noContent().build();
  }
}