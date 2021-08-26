package edu.ifes.ci.si.les.ec.services;

import java.util.Collection;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import edu.ifes.ci.si.les.ec.model.Favorito;
import edu.ifes.ci.si.les.ec.model.Usuario;
import edu.ifes.ci.si.les.ec.repositories.FavoritoRepository;
import edu.ifes.ci.si.les.ec.repositories.UsuarioRepository;
import edu.ifes.ci.si.les.ec.services.exceptions.BusinessRuleException;
import edu.ifes.ci.si.les.ec.services.exceptions.DataIntegrityException;
import edu.ifes.ci.si.les.ec.services.exceptions.ObjectNotFoundException;

@Service
public class FavoritoService {
  @Autowired
  private FavoritoRepository favoritoRepository;

  @Autowired
  private UsuarioRepository usuarioRepository;

  public Favorito insert(Favorito obj) {
    try {
      if(verificarRegrasDeNegocio(obj)) {
        obj.setId(null);
        return favoritoRepository.save(obj);
      }
    } catch (DataIntegrityViolationException e) {
      throw new DataIntegrityException("Campo(s) obrigatório(s) do Favorito não foi(foram) preenchido(s).");
    }
    return null;
  }

  public boolean verificarRegrasDeNegocio(Favorito obj) { 		
    // Regra de Negócio 1: Verificar se o usuario existe
    Usuario usuario = usuarioRepository.findById(obj.getUsuario().getId()).get();
    if (usuario == null) {
        throw new BusinessRuleException("Este usuário não existe!");
    }

    // Regra de Negócio 2: O usuário não pode inserir o mesmo favorito(Livro) mais de uma vez
    if(obj.getLivro() != null) {
        boolean userHasBookAsFavorite = favoritoRepository.userHasBookAsFavorite(obj.getLivro().getId(),obj.getUsuario().getId());
        if (userHasBookAsFavorite) {
            throw new BusinessRuleException("Este usuário já possui este livro como favorito!");
        }
    }  

    // Regra de Negócio 2: O usuário não pode inserir o mesmo favorito(Escritor) mais de uma vez
    if(obj.getEscritor() != null) {
      boolean userHasWriterAsFavorite = favoritoRepository.userHasWriterAsFavorite(obj.getEscritor().getId(),obj.getUsuario().getId());
      if (userHasWriterAsFavorite) {
          throw new BusinessRuleException("Este usuário já possui este escritor como favorito!");
      }
    }     

    return true;
}

  public Collection<Favorito> findByUsuario(Integer id) {
    try {
      Collection<Favorito> obj = favoritoRepository.findByUsuarioId(id);
      return obj;
    } catch (NoSuchElementException e) {
      throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Favorito.class.getName());
    }
  }

  public Favorito findById(Integer id) {
    try {
      Favorito obj = favoritoRepository.findById(id).get();
      return obj;
    } catch (NoSuchElementException e) {
      throw new ObjectNotFoundException("Objeto não encontrado! Id: " + id + ", Tipo: " + Favorito.class.getName());
    }
  }

  public void delete(Integer id) {
    findById(id);
    try {
      favoritoRepository.deleteById(id);
    } catch (DataIntegrityViolationException e) {
      throw new DataIntegrityException("Não é possível excluir este favorito!");
    }
  }
}
