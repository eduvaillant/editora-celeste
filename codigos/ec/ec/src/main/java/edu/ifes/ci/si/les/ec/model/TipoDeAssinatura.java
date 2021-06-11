package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"id"})

@Entity
public class TipoDeAssinatura implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(length = 100)
	@NotBlank(message = "Preencha o nome do tipo de assinatura")
	@Size(min = 2, max = 100, message = "O nome do tipo da assinatura precisa ter no mínimo 2 letras")
	private String nome;

	@Column(length = 10)
	@NotBlank(message = "Preencha o valor do plano")
	@Size(min = 1, max = 150, message = "O valor do plano não pode ser grátis")
	private double valor;

	@ManyToOne
	@JoinColumn(name="assinatura_id")
	private Assinatura[] assinatura;

}
