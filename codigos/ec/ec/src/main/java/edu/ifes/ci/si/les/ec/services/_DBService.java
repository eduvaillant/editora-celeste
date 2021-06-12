package edu.ifes.ci.si.les.ec.services;

import java.io.IOException;
import java.text.ParseException;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.Bairro;
import edu.ifes.ci.si.les.ec.model.Cidade;
import edu.ifes.ci.si.les.ec.model.UF;
import edu.ifes.ci.si.les.ec.repositories.BairroRepository;
import edu.ifes.ci.si.les.ec.repositories.CidadeRepository;
import edu.ifes.ci.si.les.ec.repositories.UFRepository;

@Service
public class _DBService {  
  @Autowired
  private UFRepository ufRepository;

  @Autowired
  private BairroRepository bairroRepository;

  @Autowired
  private CidadeRepository cidadeRepository;

  public void instantiateTestDatabase() throws ParseException, IOException {    

    // Instanciando os objetos de modelo
    UF uf1 = new UF(null, "ES", "Espírito Santo");
    UF uf2 = new UF(null, "MG", "Minas Gerais");

    Cidade cidade1 = new Cidade(null, "Alegre", uf1);
    Cidade cidade2 = new Cidade(null, "Cachoeiro de Itapemirim", uf1);
    Cidade cidade3 = new Cidade(null, "Belo Horizonte", uf2);
    Cidade cidade4 = new Cidade(null, "Lavras", uf2);
    
    Bairro bairro1 = new Bairro(null, "Vila do Sul", cidade1);
    Bairro bairro2 = new Bairro(null, "Guararema", cidade1);
    Bairro bairro3 = new Bairro(null, "Maria Ortiz", cidade2);
    Bairro bairro4 = new Bairro(null, "Centro", cidade2);
    Bairro bairro5 = new Bairro(null, "Barro Preto", cidade3);
    Bairro bairro6 = new Bairro(null, "Cidade Jardim", cidade3);
    Bairro bairro7 = new Bairro(null, "Vale do Sol", cidade4);
    Bairro bairro8 = new Bairro(null, "Nova Lavras", cidade4);
    
    ufRepository.saveAll(Arrays.asList(uf1, uf2));
    cidadeRepository.saveAll(Arrays.asList(cidade1, cidade2, cidade3, cidade4));
    bairroRepository.saveAll(Arrays.asList(bairro1, bairro2, bairro3, bairro4, bairro5, bairro6, bairro7, bairro8));
  }
}
