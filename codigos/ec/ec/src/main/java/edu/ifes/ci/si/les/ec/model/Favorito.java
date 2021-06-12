package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;
import javax.validation.constraints.*;
import javax.persistence.*;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"id"})
@Entity
public class Favorito implements Serializable{
	public Favorito() {
	}

	public Favorito(Object object, Usuario usuario1, Livro livro1, Object object2) {
    }

    private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	private Integer id;

	@NotNull(message = "O Usuário deve ser preenchido")
	@ManyToOne()
	private Usuario usuario;

	@NotNull(message = "O Livro deve ser preenchido")
	@ManyToOne()
	private Livro livro;

	@NotNull(message = "O Escritor deve ser preenchido")
	@ManyToOne()
	private Escritor[] escritor;
}
