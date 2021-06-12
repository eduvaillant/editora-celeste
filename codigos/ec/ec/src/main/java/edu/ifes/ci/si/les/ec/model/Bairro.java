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

	@Column(length = 100)
	@NotBlank(message = "Nome deve ser preenchido")
	@Size(min = 2, max = 100, message = "Nome deve ter entre 2 e 100 caracteres")
	private String nome;

	// private Usuario usuario;

	@ManyToOne
	@JoinColumn(name="cidade_id")
	private Cidade cidade;
	
}
