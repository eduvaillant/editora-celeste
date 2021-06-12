package edu.ifes.ci.si.les.ec.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.ifes.ci.si.les.ec.model.ItemDeVenda;
import edu.ifes.ci.si.les.ec.model.ItemDeVendaPK;

@Repository
public interface ItemDeVendaRepository extends JpaRepository<ItemDeVenda, ItemDeVendaPK> {
	
}