package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;
import javax.validation.constraints.*;
import javax.persistence.*;
import lombok.*;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"id"})
public class Favorito implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	private Integer id;

	@NotNull(message = "O Usuário deve ser preenchido")
	@ManyToOne()
	@JoinColumn(name="livro_id")
	private Usuario usuario;

	@NotNull(message = "O Livro deve ser preenchido")
	@ManyToOne()
	@JoinColumn(name="livro_id")
	private Livro livro;

	@NotNull(message = "O Escritor deve ser preenchido")
	@ManyToOne()
	@JoinColumn(name="escritor_id")
	private Escritor[] escritor;
}
