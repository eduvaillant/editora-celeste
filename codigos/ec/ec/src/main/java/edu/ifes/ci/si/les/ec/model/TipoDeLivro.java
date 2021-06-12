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
public class TipoDeLivro implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(length = 100)
	@NotBlank(message = "Preencha o tipo do livro")
	@Size(min = 2, max = 150, message = "O tipo de livro precisa ter no mínimo 2 letras")
	private String genero;

	@Column(length = 100)
	@NotBlank(message = "Preencha o subgenero do livro")
	@Size(min = 2, max = 150, message = "O tipo de subgenero do livro precisa ter no mínimo 2 letras")
	private String subgenero;

}
