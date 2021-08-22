package edu.ifes.ci.si.les.ec.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.ifes.ci.si.les.ec.model.LivroUsuario;

@Repository
public interface LivroUsuarioRepository extends JpaRepository<LivroUsuario, Integer> {  

}

