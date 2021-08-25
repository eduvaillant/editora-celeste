package edu.ifes.ci.si.les.ec.services;

import java.util.Collection;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.Compra;
import edu.ifes.ci.si.les.ec.repositories.CompraRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.DataIntegrityException;
import edu.ifes.ci.si.les.ec.services.exceptions.ObjectNotFoundException;

@Service
public class CompraService {
    @Autowired
    private CompraRepository compraRepository;

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
        // TODO Revisar como implementar esse for, pois esta como erro   

        /* Regra de Negócio 1: O Usuário só pode comprar livros cadastrados
        for (ItemDeVenda item : obj.itemDeVenda) {
            Livro livro = livroRepository.find(item.id);
                return false;
            }
        } */
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
