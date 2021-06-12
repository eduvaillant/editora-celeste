package edu.ifes.ci.si.les.ec.services;

import java.io.IOException;
import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.repositories.LivroRepository;

@Service
public class _DBService {  
  @Autowired
  private LivroRepository LivroRepository;

  public void instantiateTestDatabase() throws ParseException, IOException {     
    // Instanciando os objetos de modelo
    Livro livro1 = new Livro();
    Livro livro2 = new Livro();
  }
}
