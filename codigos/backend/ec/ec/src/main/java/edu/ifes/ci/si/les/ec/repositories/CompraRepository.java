package edu.ifes.ci.si.les.ec.repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.ifes.ci.si.les.ec.model.Compra;

@Repository
public interface CompraRepository extends JpaRepository<Compra, Integer> {  
    @Transactional(readOnly = true)
    public Collection<Compra> findByUsuarioId(Integer usuario_id);
}

