package edu.ifes.ci.si.les.ec.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.ifes.ci.si.les.ec.model.LivroUsuario;

@Repository
public interface LivroUsuarioRepository extends JpaRepository<LivroUsuario, Integer> {  
    @Transactional(readOnly = true)
    @Query(value = "SELECT COUNT(*) > 0 FROM livro_usuario WHERE livro_id = ?1 AND usuario_id = ?2", nativeQuery = true)
    public boolean userHasBook(Integer book_id, Integer user_id);
}

