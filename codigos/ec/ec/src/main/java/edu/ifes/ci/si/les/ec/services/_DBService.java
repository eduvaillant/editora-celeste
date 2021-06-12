package edu.ifes.ci.si.les.ec.services;

import java.io.IOException;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.Bairro;
import edu.ifes.ci.si.les.ec.model.Cidade;
import edu.ifes.ci.si.les.ec.model.Escritor;
import edu.ifes.ci.si.les.ec.model.Post;
import edu.ifes.ci.si.les.ec.model.TipoDeAssinatura;
import edu.ifes.ci.si.les.ec.model.TipoDeLivro;
import edu.ifes.ci.si.les.ec.model.UF;
import edu.ifes.ci.si.les.ec.model.Usuario;
import edu.ifes.ci.si.les.ec.model.Venda;
import edu.ifes.ci.si.les.ec.repositories.BairroRepository;
import edu.ifes.ci.si.les.ec.repositories.CidadeRepository;
import edu.ifes.ci.si.les.ec.repositories.PostRepository;
import edu.ifes.ci.si.les.ec.repositories.TipoDeAssinaturaRepository;
import edu.ifes.ci.si.les.ec.repositories.TipoDeLivroRepository;
import edu.ifes.ci.si.les.ec.repositories.UFRepository;
import edu.ifes.ci.si.les.ec.repositories.UsuarioRepository;
import edu.ifes.ci.si.les.ec.repositories.VendaRepository;

@Service
public class _DBService {  
  @Autowired
  private UFRepository ufRepository;

  @Autowired
  private BairroRepository bairroRepository;

  @Autowired
  private CidadeRepository cidadeRepository;
  
  @Autowired
  private PostRepository postRepository;

  @Autowired
  private TipoDeAssinaturaRepository tipoDeAssinaturaRepository;

  @Autowired
  private TipoDeLivroRepository tipoDeLivroRepository;

  @Autowired
  private UsuarioRepository usuarioRepository;

  @Autowired
  private VendaRepository vendaRepository;

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

    Escritor escritor1 = new Escritor(null, null, null, null, null, null, null, null, bairro8, null, null, null);

    Post post1 = new Post("Essa semana lançaremos mais um capítulo do livro 'A história'", escritor1);
    Post post2 = new Post("Hoje teremos Live no site roxo, participe conosco do nosso novo lançamento.", escritor1);

    TipoDeAssinatura tipoDeAssinatura1 = new TipoDeAssinatura("Premium", 20.0, []);
    TipoDeAssinatura tipoDeAssinatura2 = new TipoDeAssinatura("Supremo", 20.0, []);

    TipoDeLivro tipoDeLivro1 = new TipoDeLivro("Romance", "Comédia");
    TipoDeLivro tipoDeLivro2 = new TipoDeLivro("Ação", "Aventura");

    Usuario usuario1 = new Usuario("Matheus", "111.111.111-11", "Rua do João", 10, new Date(), "abc@email.com", "123456", bairro8);
    Usuario usuario2 = new Usuario("Nicollas", "321.123.321-12", "Rua da Silva", 30, new Date(), "abc@email.com", "123456", bairro8);

    Venda venda1 = new Venda(12.0, "Cartão de Crédito", usuario1, []);
    Venda venda2 = new Venda(25.0, "Boleto", usuario2, []);
    
    ufRepository.saveAll(Arrays.asList(uf1, uf2));
    cidadeRepository.saveAll(Arrays.asList(cidade1, cidade2, cidade3, cidade4));
    bairroRepository.saveAll(Arrays.asList(bairro1, bairro2, bairro3, bairro4, bairro5, bairro6, bairro7, bairro8));
    postRepository.saveAll(Arrays.asList(post1, post2));
    tipoDeAssinaturaRepository.saveAll(Arrays.asList(tipoDeAssinatura1, tipoDeAssinatura2));
    tipoDeLivroRepository.saveAll(Arrays.asList(tipoDeLivro1, tipoDeLivro2));
    usuarioRepository.saveAll(Arrays.asList(usuario1, usuario2));
    vendaRepository.saveAll(Arrays.asList(venda1, venda2));
  }
}
