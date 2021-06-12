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

	@Column(length = 50)
	@NotBlank(message = "Nome Artistico deve ser preenchido")
	@Size(min = 3, max = 50, message = "Nome Artistico deve ter entre 3 e 50 letras")   
	private String nome_artistico;

	@Column(length = 100)
    @NotBlank(message = "Email deve ser preenchido")
    @Size(min = 2, max = 100, message = "Email deve ter entre 2 e 100 caracteres")
	private String email;

	//https://en.wikipedia.org/wiki/E.164
	// 15 Caracteres é a  de tamanho maximo para numeros de telefone
	@Column
    @NotBlank(message = "telefone deve ser preenchido")
	@Size(min = 2, max = 16, message = "Telefone deve ter entre 2 e 16 caracteres")
	private String telefone;

	//private Livro livro;

	//private Favorito favorito;

}
