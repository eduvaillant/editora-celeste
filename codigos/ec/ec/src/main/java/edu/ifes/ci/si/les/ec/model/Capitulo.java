package edu.ifes.ci.si.les.ec.model;
import java.io.Serializable;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"id"})
@Entity
public class Capitulo implements Serializable {

	private static final long serialVersionUID = 1L;

	@id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String titulo;

	private String subtitulo;

	private String conteudo;

	@ManyToOne
	@JoinColumn(name="livro_id")
	private Livro livro;

}
