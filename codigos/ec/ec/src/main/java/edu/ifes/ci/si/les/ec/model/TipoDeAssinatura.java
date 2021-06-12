package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.*;
import lombok.*;


@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"id"})
@Entity
public class TipoDeAssinatura implements Serializable {
	public TipoDeAssinatura() {
	}

	public TipoDeAssinatura(String string, double d, List<Assinatura> list) {
	}

	private static final long serialVersionUID = 1L;

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(length = 100)
	@NotBlank(message = "Preencha o nome do tipo de assinatura")
	@Size(min = 2, max = 100, message = "O nome do tipo da assinatura precisa ter no mínimo 2 letras")
	private String nome;

	@Min(value = 1, message = "O valor do plano não pode ser grátis")
	@NotNull(message = "Preencha o valor do plano")
	@Digits(integer=6, fraction=2, message = "Valor do Empréstimo deve ser preenchido com dígitos")
	private double valor;

	@ManyToOne
	@JoinColumn(name="assinatura_id")
	private Assinatura[] assinatura;
}
