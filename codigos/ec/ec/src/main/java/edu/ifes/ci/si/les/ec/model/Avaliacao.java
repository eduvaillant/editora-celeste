package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;

import javax.persistence.*;

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

	private Integer nota;

	private Integer comentario;

	@ManyToOne
	@JoinColumn(name="livro_id")
	private Livro livro;

	@ManyToOne
	@JoinColumn(name="usuario_id")
	private Usuario usuario;

}
