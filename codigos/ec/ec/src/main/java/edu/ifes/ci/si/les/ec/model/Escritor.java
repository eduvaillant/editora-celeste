package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"id"})
@Entity
public class Escritor extends Usuario {

	private static final long serialVersionUID = 1L;

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String nome_artistico;

	private String email;

	private String telefone;

	private Livro livro;

	private Favorito favorito;

}
