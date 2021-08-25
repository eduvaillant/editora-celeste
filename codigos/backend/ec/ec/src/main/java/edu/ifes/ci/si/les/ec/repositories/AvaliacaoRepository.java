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
}

