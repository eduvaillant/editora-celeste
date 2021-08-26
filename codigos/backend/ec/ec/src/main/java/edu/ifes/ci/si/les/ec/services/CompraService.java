package edu.ifes.ci.si.les.ec.services;

import java.util.Collection;
import java.util.NoSuchElementException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import edu.ifes.ci.si.les.ec.model.Compra;
import edu.ifes.ci.si.les.ec.model.ItemDeVenda;
import edu.ifes.ci.si.les.ec.model.Livro;
import edu.ifes.ci.si.les.ec.repositories.CompraRepository;
import edu.ifes.ci.si.les.ec.repositories.LivroRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.DataIntegrityException;
import edu.ifes.ci.si.les.ec.services.exceptions.ObjectNotFoundException;

@Service
public class CompraService {
    @Autowired
    private CompraRepository compraRepository;

    @Autowired
    private LivroRepository livroRepository;

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public Compra insert(Compra obj) {
        try {
        	if(verificarRegrasDeNegocio(obj)) {                
	        	obj.setId(null);
	        	return compraRepository.save(obj);
        	}
        } catch (DataIntegrityViolationException e) {
            throw new DataIntegrityException("Campo(s) obrigatório(s) da Compra não foi(foram) preenchido(s).");
        }
        return null;
    }

    // Implementando as regras de negócio relacionadas ao processo de negócio da Compra
 	public boolean verificarRegrasDeNegocio(Compra obj) { 
        // Regra de Negócio 1: O Usuário só pode comprar livros cadastrados
        // Collection<ItemDeVenda> itensDeVenda = obj.getItemDeVenda();
        for (ItemDeVenda item: obj.getItemDeVenda()) {
            System.out.println(item.getId().getLivro());
            // Livro livro = livroRepository.findById();
            /* if (livro == null) {
                return false;
            } */
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

    public Collection<Compra> findByUsuarioId(Integer id) {
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
}
