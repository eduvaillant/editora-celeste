package edu.ifes.ci.si.les.ec.services;

import java.io.IOException;
import java.text.ParseException;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.Bairro;
import edu.ifes.ci.si.les.ec.model.Cidade;
import edu.ifes.ci.si.les.ec.model.UF;

import edu.ifes.ci.si.les.ec.model.Assinatura;
import edu.ifes.ci.si.les.ec.model.Avaliacao;
import edu.ifes.ci.si.les.ec.model.Capitulo;
import edu.ifes.ci.si.les.ec.model.Escritor;
import edu.ifes.ci.si.les.ec.model.Favorito;
import edu.ifes.ci.si.les.ec.model.ItemDeVenda;
import edu.ifes.ci.si.les.ec.model.Livro;

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
    

    Assinatura assinatura1 = new Assinatura(null, new Date(), new Date(), 100, usuario1);
    Assinatura assinatura2 = new Assinatura(null, new Date(), new Date(), 200, usuario2);

    Avaliacao avaliacao1 = new Avaliacao(null, 10, "Comentario1", livro1, usuario1);
    Avaliacao avaliacao2 = new Avaliacao(null, 9, "Comentario2", livro2, usuario2);

    Escritor escritor1 = new Escritor(null, "Rodolfo da Costa", "135.521.130-10", "Rua dos anjos", 14, new Date(2000,11,4), "arthur@gmail.com", "senha", bairro1, "Arthur Christie", "arthur@gmail.com", "+5528999112234" );
    Escritor escritor2 = new Escritor(null, "Douglas Jr Abreu", "277.645.460-03", "Rua Arthur da Costa", 2, new Date(2002,5,4), "douglas@gmail.com", "senha", bairro2, "Douglinhas ", "douglas@gmail.com", "+5528999335574" );

    Livro livro1 = new Livro(null, "As aventuras de douglas", "A sociedade do colar", "Um livro muito bom a respeito do douglas e seus colares",2,10,escritor1, tipoDeLivro1);
    Livro livro2 = new Livro(null, "O Homem que cumprimentava", "O inicio", "Um livro sobre um homem que gostava de cumprimentar",2,12,escritor2, tipoDeLivro2);

    Capitulo capitulo1 = new Capitulo(null, "O inicio", null, "Tudo está bem até não estar mais bem", livro1);
    Capitulo capitulo2 = new Capitulo(null, "O Fim", null, "Tudo está mal até não estar mais mal", livro1);
    Capitulo capitulo3 = new Capitulo(null, "Bom dia", null, "O homem entrou na casa e deu boa tarde", livro2);
    Capitulo capitulo4 = new Capitulo(null, "Boa tarde", null, "O homem saiu da casa e deu boa noite", livro2);

    Favorito favorito1 = new Favorito(null, usuario1, livro1, null);
    Favorito favorito2 = new Favorito(null, usuario2, livro2, null);

    ItemDeVenda itemDeVenda1 = new ItemDeVenda(null, 2, "Assinar", 20.0);
    ItemDeVenda itemDeVenda2 = new ItemDeVenda(null, 1, "Enviar amassado", 40.0);
    
    ufRepository.saveAll(Arrays.asList(uf1, uf2));
    cidadeRepository.saveAll(Arrays.asList(cidade1, cidade2, cidade3, cidade4));
    bairroRepository.saveAll(Arrays.asList(bairro1, bairro2, bairro3, bairro4, bairro5, bairro6, bairro7, bairro8));
  }
}
