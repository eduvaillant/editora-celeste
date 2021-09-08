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
  @Query(value = "SELECT l.*, AVG(av.nota) from livro l inner join escritor e on e.id = l.escritor_id inner join avaliacao av on l.id = av.livro_id WHERE e.id = $1 group by l.id order by avg(av.nota) asc limit 3;", nativeQuery = true)
  public Collection<Livro> pioresByEscritorId(Integer escritor_id);

  @Transactional(readOnly = true)
  @Query(value = "SELECT l.*, AVG(av.nota) from livro l inner join escritor e on e.id = l.escritor_id inner join avaliacao av on l.id = av.livro_id WHERE e.id = $1 group by l.id order by avg(av.nota) desc limit 3;", nativeQuery = true)
  public Collection<Livro> melhoresByEscritorId(Integer escritor_id);
  
}
