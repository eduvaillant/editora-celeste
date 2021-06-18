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
public class Capitulo implements Serializable {
  private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(length = 100)
	@NotBlank(message = "Titulo do Capitulo deve ser preenchido")
	@Size(min = 1, max = 100, message = "Titulo do Capitulo deve ter entre 1 e 100 letras")   
	private String titulo;

	@Column(length = 100)
	@NotBlank(message = "SubTitulo do Capitulo deve ser preenchido")
	@Size(min = 1, max = 100, message = "SubTitulo do Capitulo deve ter entre 1 e 100 letras")   
	private String subtitulo;
	
	// https://wordcounter.net/blog/2017/02/15/102944_how-many-words-chapter.html#:~:text=As%20a%20general%20guideline%2C%20chapters,decide%20on%20are%20merely%20guidelines.
	// Essa fonte diz que geralmente livros tem de 3000 a 5000 palavras
	// Analizando a quantidade de letras com essa fonte
	// https://capitalizemytitle.com/character-count/5000-characters/
	// Chega em cerca de 25000 caracteres um texto dfe 4k a 8k palavras
	@Column(length = 25000)
	@Size(min = 0, max = 25000, message = "SubTitulo do Capitulo deve ter entre 1 e 25000 letras")  
	private String conteudo;

	@ManyToOne
	private Livro livro;

}
