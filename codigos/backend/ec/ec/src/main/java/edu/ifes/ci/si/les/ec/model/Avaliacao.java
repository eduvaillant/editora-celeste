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
public class Avaliacao implements Serializable {

  private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotNull(message = "Preencha a nota da avaliação")
	@Digits(integer=3, fraction=1, message="A nota da avaliação deve ser preenchido com dígitos")
	private Integer nota;

	@Column(length = 100)
	@Size(min = 2, max = 100, message = "Comentário deve ter entre 2 e 100 caracteres")
	private String comentario;

	@ManyToOne
	@NotNull(message = "Preencha o Livro")
	private Livro livro;

	@ManyToOne
	@NotNull(message = "Preencha o Usuário")
	private Usuario usuario;
}
