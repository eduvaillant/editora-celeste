package edu.ifes.ci.si.les.ec.repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.ifes.ci.si.les.ec.model.Favorito;

@Repository
public interface FavoritoRepository extends JpaRepository<Favorito, Integer> {  
  @Transactional(readOnly = true)
  public Collection<Favorito> findByUsuarioId(Integer usuario_id);
}
