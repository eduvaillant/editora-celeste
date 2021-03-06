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

  private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	private Integer id;

	@NotNull(message = "O Usuário deve ser preenchido")
	@ManyToOne()
	private Usuario usuario;

	@ManyToOne()
	private Livro livro;

	@ManyToOne()
	private Escritor escritor;
}
