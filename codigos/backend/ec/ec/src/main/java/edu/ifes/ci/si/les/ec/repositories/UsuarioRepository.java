package edu.ifes.ci.si.les.ec.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.ifes.ci.si.les.ec.model.Usuario;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {  
  @Transactional(readOnly = true)
	public Usuario findByEmailAndSenha(String email, String senha);
}

