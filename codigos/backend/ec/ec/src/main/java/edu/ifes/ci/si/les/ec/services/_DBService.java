package edu.ifes.ci.si.les.ec.services;

import java.io.IOException;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.Assinatura;
import edu.ifes.ci.si.les.ec.model.Avaliacao;
import edu.ifes.ci.si.les.ec.model.Bairro;
import edu.ifes.ci.si.les.ec.model.Capitulo;
import edu.ifes.ci.si.les.ec.model.Cidade;
import edu.ifes.ci.si.les.ec.model.Escritor;
import edu.ifes.ci.si.les.ec.model.Favorito;
import edu.ifes.ci.si.les.ec.model.ItemDeVenda;
import edu.ifes.ci.si.les.ec.model.Livro;
import edu.ifes.ci.si.les.ec.model.LivroUsuario;
import edu.ifes.ci.si.les.ec.model.Post;
import edu.ifes.ci.si.les.ec.model.TipoDeAssinatura;
import edu.ifes.ci.si.les.ec.model.TipoDeLivro;
import edu.ifes.ci.si.les.ec.model.UF;
import edu.ifes.ci.si.les.ec.model.Usuario;
import edu.ifes.ci.si.les.ec.model.Compra;
import edu.ifes.ci.si.les.ec.repositories.AssinaturaRepository;
import edu.ifes.ci.si.les.ec.repositories.AvaliacaoRepository;
import edu.ifes.ci.si.les.ec.repositories.BairroRepository;
import edu.ifes.ci.si.les.ec.repositories.CapituloRepository;
import edu.ifes.ci.si.les.ec.repositories.CidadeRepository;
import edu.ifes.ci.si.les.ec.repositories.CompraRepository;
import edu.ifes.ci.si.les.ec.repositories.EscritorRepository;
import edu.ifes.ci.si.les.ec.repositories.FavoritoRepository;
import edu.ifes.ci.si.les.ec.repositories.LivroRepository;
import edu.ifes.ci.si.les.ec.repositories.LivroUsuarioRepository;
import edu.ifes.ci.si.les.ec.repositories.PostRepository;
import edu.ifes.ci.si.les.ec.repositories.TipoDeAssinaturaRepository;
import edu.ifes.ci.si.les.ec.repositories.TipoDeLivroRepository;
import edu.ifes.ci.si.les.ec.repositories.UFRepository;
import edu.ifes.ci.si.les.ec.repositories.UsuarioRepository;

//TODO alterar as variáveis com nome de venda para compra
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
  private CompraRepository compraRepository;

  @Autowired
  private AssinaturaRepository assinaturaRepository;
  
  @Autowired
  private AvaliacaoRepository avaliacaoRepository;

  @Autowired
  private CapituloRepository capituloRepository;

  @Autowired
  private EscritorRepository escritorRepository;

  @Autowired
  private FavoritoRepository favoritoRepository;

  @Autowired
  private LivroRepository livroRepository;

  @Autowired
  private LivroUsuarioRepository livroUsuarioRepository;

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

    Usuario usuario1 = new Usuario(null, "Matheus", "111.111.111-11", "Rua do João", "10", new Date(), "abc@email.com", "123456", bairro8);
    Usuario usuario2 = new Usuario(null, "Nicollas", "321.123.321-12", "Rua da Silva", "30", new Date(), "abcd@email.com", "123456", bairro8);

    Escritor escritor1 = new Escritor(null, "Rodolfo da Costa", "135.521.130-10", "Rua dos anjos", "14", new Date(2000,11,4), "arthur@gmail.com", "123456", bairro1, "Arthur Christie", "arthur@gmail.com", "+5528999112234" );
    Escritor escritor2 = new Escritor(null, "Douglas Jr Abreu", "277.645.460-03", "Rua Arthur da Costa", "2", new Date(2002,5,4), "douglas@gmail.com", "123456", bairro2, "Douglinhas Teste", "douglas@gmail.com", "+5528999335574", "imagem" );

    Post post1 = new Post(null, "Essa semana lançaremos mais um capítulo do livro 'A história'", escritor1);
    Post post2 = new Post(null, "Hoje teremos Live no site roxo, participe conosco do nosso novo lançamento.", escritor1);

    TipoDeAssinatura tipoDeAssinatura1 = new TipoDeAssinatura(null, "Premium", 20.0);
    TipoDeAssinatura tipoDeAssinatura2 = new TipoDeAssinatura(null, "Supremo", 20.0);

    Assinatura assinatura1 = new Assinatura(null, new Date(), new Date(), 100, usuario1, tipoDeAssinatura1);
    Assinatura assinatura2 = new Assinatura(null, new Date(), new Date(), 200, usuario2, tipoDeAssinatura2);

    TipoDeLivro tipoDeLivro1 = new TipoDeLivro(null, "Romance", "Comédia");
    TipoDeLivro tipoDeLivro2 = new TipoDeLivro(null, "Ação", "Aventura");   

    Livro livro1 = new Livro(null, "As aventuras de douglas","imagem", "A sociedade do colar", "Um livro muito bom a respeito do douglas e seus colares",2,10,escritor1, tipoDeLivro1);
    Livro livro2 = new Livro(null, "O Homem que cumprimentava", "imagem", "O inicio", "Um livro sobre um homem que gostava de cumprimentar",2,12,escritor2, tipoDeLivro2);

    LivroUsuario livroUsuario1 = new LivroUsuario(null,livro1, usuario1);
    LivroUsuario livroUsuario2 = new LivroUsuario(null,livro2, usuario2);

    Compra venda1 = new Compra(null, 12.0, "Cartão de Crédito", usuario1);
    Compra venda2 = new Compra(null, 25.0, "Boleto", usuario2);

    ItemDeVenda itemDeVenda1 = new ItemDeVenda(venda1, livro1, 1, "Assinar", 20.0);
    ItemDeVenda itemDeVenda2 = new ItemDeVenda(venda2, livro1, 2, "Enviar amassado", 40.0);


    venda1.setItemDeVenda(Arrays.asList(itemDeVenda1));
    venda2.setItemDeVenda(Arrays.asList(itemDeVenda2));

    Avaliacao avaliacao1 = new Avaliacao(null, 10, "Comentario1", livro1, usuario1);
    Avaliacao avaliacao2 = new Avaliacao(null, 9, "Comentario2", livro2, usuario2);

    Capitulo capitulo1 = new Capitulo(null, "O inicio", "Subtítulo", "Tudo está bem até não estar mais bem", livro1);
    Capitulo capitulo2 = new Capitulo(null, "O Fim", "Subtítulo", "Tudo está mal até não estar mais mal", livro1);
    Capitulo capitulo3 = new Capitulo(null, "Bom dia", "Subtítulo", "O homem entrou na casa e deu boa tarde", livro2);
    Capitulo capitulo4 = new Capitulo(null, "Boa tarde", "Subtítulo", "O homem saiu da casa e deu boa noite", livro2);

    Favorito favorito1 = new Favorito(null, usuario1, livro1, null);
    Favorito favorito2 = new Favorito(null, usuario2, livro2, null);
    
    ufRepository.saveAll(Arrays.asList(uf1, uf2));
    cidadeRepository.saveAll(Arrays.asList(cidade1, cidade2, cidade3, cidade4));
    bairroRepository.saveAll(Arrays.asList(bairro1, bairro2, bairro3, bairro4, bairro5, bairro6, bairro7, bairro8));
    usuarioRepository.saveAll(Arrays.asList(usuario1, usuario2));
    escritorRepository.saveAll(Arrays.asList(escritor1, escritor2));
    postRepository.saveAll(Arrays.asList(post1, post2));

    tipoDeAssinaturaRepository.saveAll(Arrays.asList(tipoDeAssinatura1, tipoDeAssinatura2));
    assinaturaRepository.saveAll(Arrays.asList(assinatura1, assinatura2));
    tipoDeLivroRepository.saveAll(Arrays.asList(tipoDeLivro1, tipoDeLivro2));
    livroRepository.saveAll(Arrays.asList(livro1, livro2));
    capituloRepository.saveAll(Arrays.asList(capitulo1, capitulo2, capitulo3, capitulo4));
    compraRepository.saveAll(Arrays.asList(venda1, venda2));
    // itemDeVendaRepository.saveAll(Arrays.asList(itemDeVenda1, itemDeVenda2));

    avaliacaoRepository.saveAll(Arrays.asList(avaliacao1, avaliacao2));
    favoritoRepository.saveAll(Arrays.asList(favorito1, favorito2));

    livroUsuarioRepository.saveAll(Arrays.asList(livroUsuario1, livroUsuario2));
  }
}
