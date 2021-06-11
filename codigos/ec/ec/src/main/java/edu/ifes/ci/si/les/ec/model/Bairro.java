package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;

import javax.persistence.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"id"})
@Entity
public class Bairro {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String nome;

	// private Usuario usuario;

	@ManyToOne
	@JoinColumn(name="cidade_id")
	private Cidade cidade;
	
}
