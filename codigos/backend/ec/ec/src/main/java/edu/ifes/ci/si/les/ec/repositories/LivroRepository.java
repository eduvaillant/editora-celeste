package edu.ifes.ci.si.les.ec.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.ifes.ci.si.les.ec.model.Livro;
import java.util.Collection;
@Repository
public interface LivroRepository extends JpaRepository<Livro, Integer> {  
  @Transactional(readOnly = true)
  public Collection<Livro> findByAuthor(Integer id);
}

