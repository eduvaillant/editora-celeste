package edu.ifes.ci.si.les.ec.repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.ifes.ci.si.les.ec.model.Favorito;

@Repository
public interface FavoritoRepository extends JpaRepository<Favorito, Integer> {  
  @Transactional(readOnly = true)
  public Collection<Favorito> findByUsuarioId(Integer usuario_id);

  @Transactional(readOnly = true)
  @Query(value = "SELECT COUNT(*) > 0 FROM favorito WHERE livro_id = ?1 AND usuario_id = ?2", nativeQuery = true)
  public boolean userHasBookAsFavorite(Integer livro_id, Integer usuario_id);

  @Transactional(readOnly = true)
  @Query(value = "SELECT COUNT(*) > 0 FROM favorito WHERE escritor_id = ?1 AND usuario_id = ?2", nativeQuery = true)
  public boolean userHasWriterAsFavorite(Integer escritor_id, Integer usuario_id);
}
