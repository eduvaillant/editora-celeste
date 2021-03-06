package edu.ifes.ci.si.les.ec.repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.ifes.ci.si.les.ec.model.Capitulo;

@Repository
public interface CapituloRepository extends JpaRepository<Capitulo, Integer> {  
  @Transactional(readOnly = true)
  public Collection<Capitulo> findByLivroId(Integer livro_id);
}