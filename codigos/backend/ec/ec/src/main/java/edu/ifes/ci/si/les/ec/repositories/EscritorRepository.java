package edu.ifes.ci.si.les.ec.repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.jpa.repository.Query;
import edu.ifes.ci.si.les.ec.model.Escritor;

@Repository
public interface EscritorRepository extends JpaRepository<Escritor, Integer> {  
  @Transactional(readOnly = true)
  @Query(value = "SELECT e.*, u.* FROM escritor e INNER JOIN livro l ON l.escritor_id = e.id INNER JOIN usuario u ON e.id = u.id INNER JOIN avaliacao av ON l.id = av.livro_id GROUP BY e.id, u.id ORDER BY AVG(av.nota) ASC LIMIT 5", nativeQuery = true)
  public Collection<Escritor> melhoresEscritores();
} 
