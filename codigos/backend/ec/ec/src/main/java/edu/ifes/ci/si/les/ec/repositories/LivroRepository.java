package edu.ifes.ci.si.les.ec.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.ifes.ci.si.les.ec.model.Livro;
import java.util.Collection;
@Repository
public interface LivroRepository extends JpaRepository<Livro, Integer> {  
  @Transactional(readOnly = true)
  public Collection<Livro> findByEscritorId(Integer escritor_id);
}

