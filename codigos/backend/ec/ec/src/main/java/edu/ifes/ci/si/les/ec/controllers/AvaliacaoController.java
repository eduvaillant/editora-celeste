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

import edu.ifes.ci.si.les.ec.model.Avaliacao;
import edu.ifes.ci.si.les.ec.services.AvaliacaoService;
import edu.ifes.ci.si.les.ec.services.exceptions.ConstraintException;

@RestController()
@RequestMapping(value = "/avaliacao")
public class AvaliacaoController {
    @Autowired
    private AvaliacaoService service;

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Avaliacao> insert(@Valid @RequestBody Avaliacao obj, BindingResult br) {
        if (br.hasErrors())
            throw new ConstraintException(br.getAllErrors().get(0).getDefaultMessage());
        obj = service.insert(obj);
        return ResponseEntity.ok().body(obj);
    }

    @RequestMapping(value = "/livro/{id}", method = RequestMethod.GET)
    public ResponseEntity<Collection<Avaliacao>> findByLivro(@PathVariable Integer id) {
        Collection<Avaliacao> collection = service.findByLivro(id);
        return ResponseEntity.ok().body(collection);
    }
}
