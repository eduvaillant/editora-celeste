package edu.ifes.ci.si.les.ec.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.Avaliacao;
import edu.ifes.ci.si.les.ec.repositories.AvaliacaoRepository;
import edu.ifes.ci.si.les.ec.repositories.LivroUsuarioRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.BusinessRuleException;
import edu.ifes.ci.si.les.ec.services.exceptions.DataIntegrityException;

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
}
