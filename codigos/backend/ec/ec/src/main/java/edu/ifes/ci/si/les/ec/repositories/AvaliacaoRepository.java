package edu.ifes.ci.si.les.ec.repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
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
    @Query(value = "SELECT * FROM avaliacao av WHERE av.livro_id = ?1 ORDER BY nota ASC LIMIT 3", nativeQuery = true)
    public Collection<Avaliacao> pioresByLivroId(Integer livro_id);

    @Transactional(readOnly = true)
    @Query(value = "SELECT * FROM avaliacao av WHERE av.livro_id = ?1 ORDER BY nota DESC LIMIT 3", nativeQuery = true)
    public Collection<Avaliacao> melhoresByLivroId(Integer livro_id);
}

