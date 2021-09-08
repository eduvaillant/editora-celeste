package edu.ifes.ci.si.les.ec.services;

import java.util.Collection;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.Avaliacao;
import edu.ifes.ci.si.les.ec.repositories.AvaliacaoRepository;
import edu.ifes.ci.si.les.ec.repositories.LivroUsuarioRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.BusinessRuleException;
import edu.ifes.ci.si.les.ec.services.exceptions.DataIntegrityException;
import edu.ifes.ci.si.les.ec.services.exceptions.ObjectNotFoundException;

@Service
public class AvaliacaoService {
    @Autowired
    private LivroUsuarioRepository livroUsuarioRepository;

    @Autowired
    private AvaliacaoRepository avaliacaoRepository;

    public Avaliacao insert(Avaliacao obj) {
        try {
        	if(verificarRegrasDeNegocio(obj)) {
	        	obj.setId(null);
	        	return avaliacaoRepository.save(obj);
        	}
        } catch (DataIntegrityViolationException e) {
            throw new DataIntegrityException("Campo(s) obrigatório(s) da Avaliação não foi(foram) preenchido(s).");
        }
        return null;
    }    

    // Implementando as regras de negócio relacionadas ao processo de negócio da Avaliação
 	  // Regra de Negócio 1: O Usuário só pode avaliar um livro que ele possui
 	  public boolean verificarRegrasDeNegocio(Avaliacao obj) { 		
        // Regra de Negócio 1: O Usuário só pode avaliar um livro que ele possui
        boolean hasBook = livroUsuarioRepository.userHasBook(obj.getLivro().getId(), obj.getUsuario().getId());
        if (!hasBook) {
            throw new BusinessRuleException("Este usuário não possui o livro!");
        }
        return true;
    }

    public Collection<Avaliacao> findByLivro(Integer id) {
        try {
          Collection<Avaliacao> obj = avaliacaoRepository.findByLivroId(id);
          return obj;
        } catch (NoSuchElementException e) {
          throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Avaliacao.class.getName());
        }
    }

    public Collection<Avaliacao> melhoresByLivro(Integer id) {
        try {
          Collection<Avaliacao> obj = avaliacaoRepository.melhoresByLivroId(id);
          return obj;
        } catch (NoSuchElementException e) {
          throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Avaliacao.class.getName());
        }
    }

    public Collection<Avaliacao> pioresByLivro(Integer id) {
        try {
          Collection<Avaliacao> obj = avaliacaoRepository.pioresByLivroId(id);
          return obj;
        } catch (NoSuchElementException e) {
          throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Avaliacao.class.getName());
        }
    }

    public Collection<Avaliacao> findByUsuario(Integer id) {
        try {
          Collection<Avaliacao> obj = avaliacaoRepository.findByUsuarioId(id);
          return obj;
        } catch (NoSuchElementException e) {
          throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Avaliacao.class.getName());
        }
    }

    public Avaliacao findById(Integer id) {
      try {
        Avaliacao obj = avaliacaoRepository.findById(id).get();
        return obj;
      } catch (NoSuchElementException e) {
        throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Avaliacao.class.getName());
      }
    }
    

    public void delete(Integer id) {
      findById(id);
      try {
          avaliacaoRepository.deleteById(id);
      } catch (DataIntegrityViolationException e) {
          throw new DataIntegrityException("Não é possível excluir esta!");
      }
    }
}
