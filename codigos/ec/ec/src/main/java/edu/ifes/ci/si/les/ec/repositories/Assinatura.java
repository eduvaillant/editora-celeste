package edu.ifes.ci.si.les.ec.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface AssinturaRepository extends JpaRepository<Assinatura, Integer> {
  
}