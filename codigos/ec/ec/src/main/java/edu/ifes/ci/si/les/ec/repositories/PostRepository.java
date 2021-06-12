package edu.ifes.ci.si.les.ec.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.ifes.ci.si.les.ec.model.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Integer> {  

}

