package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.*;
import lombok.*;


@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"id"})
@Entity
public class Post implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(length = 150)
	@NotBlank(message = "Preencha a descrição")
	@Size(min = 2, max = 150, message = "A descrição precisa ter no mínimo 2 letras")
	private String descricao;

	@ManyToOne
	@JoinColumn(name="escritor_id")
	private Escritor escritor;
}
