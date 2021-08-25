package edu.ifes.ci.si.les.ec.repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.ifes.ci.si.les.ec.model.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Integer> {  
    @Transactional(readOnly = true)
    public Collection<Post> findByEscritorId(Integer escritor_id);
}

