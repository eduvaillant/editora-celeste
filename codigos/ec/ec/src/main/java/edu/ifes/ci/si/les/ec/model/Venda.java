package edu.ifes.ci.si.les.ec.model;

import java.util.List;

public class Venda {

	private Integer id;

	private double total;

	private Integer formaDePagamento;

	private Usuario usuario;
	
	private List<ItemDeVenda> itemDeVenda;

}
