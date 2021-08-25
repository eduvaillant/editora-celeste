package edu.ifes.ci.si.les.ec.repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.ifes.ci.si.les.ec.model.Assinatura;

@Repository
public interface AssinaturaRepository extends JpaRepository<Assinatura, Integer> {  
  @Transactional(readOnly = true)
  public Collection<Assinatura> findByUsuarioId(Integer usuario_id);
}

