package edu.ifes.ci.si.les.ec.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.ifes.ci.si.les.ec.model.Favorito;

@Repository
public interface LivroRepository extends JpaRepository<Favorito, Integer> {  

}

