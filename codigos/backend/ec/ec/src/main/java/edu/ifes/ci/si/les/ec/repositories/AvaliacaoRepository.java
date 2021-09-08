package edu.ifes.ci.si.les.ec.repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.ifes.ci.si.les.ec.model.Avaliacao;

@Repository
public interface AvaliacaoRepository extends JpaRepository<Avaliacao, Integer> {  
    @Transactional(readOnly = true)
    public Collection<Avaliacao> findByLivroId(Integer livro_id);

    @Transactional(readOnly = true)
    public Collection<Avaliacao> findByUsuarioId(Integer livro_id);

   
    @Transactional(readOnly = true)
    @Query(value = "SELECT * from avaliacao av WHERE av.livro_id = ?1 oder by nota asc limit 3;", nativeQuery = true)
    public boolean pioresByLivroId(Integer livro_id);

    @Transactional(readOnly = true)
    @Query(value = "SELECT * from avaliacao av WHERE av.livro_id = ?1 oder by nota desc limit 3;", nativeQuery = true)
    public boolean melhoresByLivroId(Integer livro_id);
}

