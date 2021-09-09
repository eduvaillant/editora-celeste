package edu.ifes.ci.si.les.ec.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.jpa.repository.Query;
import edu.ifes.ci.si.les.ec.model.Livro;
import java.util.Collection;

@Repository
public interface LivroRepository extends JpaRepository<Livro, Integer> {  
  @Transactional(readOnly = true)
  public Collection<Livro> findByEscritorId(Integer escritor_id);

  @Transactional(readOnly = true)
  @Query(value = "SELECT l.*, AVG(av.nota) FROM livro l INNER JOIN escritor e ON e.id = l.escritor_id INNER JOIN avaliacao av ON l.id = av.livro_id WHERE e.id = ?1 GROUP BY l.id ORDER BY AVG(av.nota) ASC LIMIT 5", nativeQuery = true)
  public Collection<Livro> pioresByEscritorId(Integer escritor_id);

  @Transactional(readOnly = true)
  @Query(value = "SELECT l.*, AVG(av.nota) FROM livro l INNER JOIN escritor e ON e.id = l.escritor_id INNER JOIN avaliacao av ON l.id = av.livro_id WHERE e.id = ?1 GROUP BY l.id ORDER BY AVG(av.nota) DESC LIMIT 5", nativeQuery = true)
  public Collection<Livro> melhoresByEscritorId(Integer escritor_id);
  
}
