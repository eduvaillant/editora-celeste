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
public class CompraService {
    @Autowired
    private LivroUsuarioRepository livroUsuarioRepository;

    @Autowired
    private CompraRepository compraRepository;

    @Autowired
    private LivroRepository livroRepository;

    public Compra insert(Compra obj) {
        try {
        	if(verificarRegrasDeNegocio(obj)) {
	        	obj.setId(null);
	        	return compraRepository.save(obj);
        	}
        } catch (DataIntegrityViolationException e) {
            throw new DataIntegrityException("Campo(s) obrigatório(s) da Avaliação não foi(foram) preenchido(s).");
        }
        return null;
    }

    // Implementando as regras de negócio relacionadas ao processo de negócio da Compra
 	// Regra de Negócio 1: O Usuário só pode comprar livros previamente cadastrados e disponibilizados pelos escritores
 	public boolean verificarRegrasDeNegocio(Compra obj) { 		
        // Regra de Negócio 1: O Usuário só pode comprar livros cadastrados
        for (ItemDeVenda item : obj.itemDeVenda) {
            Livro livro = livroRepository.find(item.id); // TODO: Verificar (ou: find(item.id.livro))
            if (!livro) {
                return false;
            }
        }
        return true;
    }

    public Compra findById(Integer id) {
        try {
            Compra obj = compraRepository.findById(id).get();
            return obj;
        } catch (NoSuchElementException e) {
            throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Compra.class.getName());
        }
    }

    public Compra findByUsuarioId(Integer id) {
        try {
            Collection<Compra> obj = compraRepository.findByUsuarioId(id);
            return obj;
        } catch (NoSuchElementException e) {
            throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Compra.class.getName());
        }
    }

    public Compra update(Compra obj) {
        findById(obj.getId());
        try {
            return compraRepository.save(obj);
        } catch (DataIntegrityViolationException e) {
            throw new DataIntegrityException("Campo(s) obrigatório(s) da Compra não foi(foram) preenchido(s): ");
        }
    }

    public void delete(Integer id) {
        findById(id);
        try {
            compraRepository.deleteById(id);
        } catch (DataIntegrityViolationException e) {
            throw new DataIntegrityException("Não é possível excluir esta Compra!");
        }
    }

    public Collection<Compra> findAll() { // TODO: Função não necessária
        return compraRepository.findAll();
    } 
}
