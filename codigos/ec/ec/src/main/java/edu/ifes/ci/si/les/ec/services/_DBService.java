package edu.ifes.ci.si.les.ec.services;

import java.io.IOException;
import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.UF;

@Service
public class _DBService {  
  @Autowired

  public void instantiateTestDatabase() throws ParseException, IOException {    

    // Instanciando os objetos de modelo
    UF uf1 = new UF(null, "ES", "Espírito Santo");
    UF uf2 = new UF(null, "MG", "Minas Gerais");

  }
}
