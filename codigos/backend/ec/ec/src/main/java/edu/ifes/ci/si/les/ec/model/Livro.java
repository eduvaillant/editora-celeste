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
public class Livro implements Serializable {

  private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(length = 150)
	@NotBlank(message = "Preencha o Título")
	@Size(min = 2, max = 150, message = "A titulo precisa ter no mínimo 2 letras e no máximo 150")
	private String titulo;

	@Column(length = 150)
	private String imagem_capa;

	@Column(length = 150)
	@NotBlank(message = "Preencha o Subtítulo")
	@Size(min = 2, max = 150, message = "A subtítulo precisa ter no mínimo 2 letras e no máximo 150")
	private String subtitulo;

	@Column(length = 255)
	@NotBlank(message = "Preencha a Descrição")
	@Size(min = 2, max = 255, message = "A descrição precisa ter no mínimo 2 letras e no máximo 255")
	private String descricao;

	@NotNull(message = "A quantidade de capítulos deve ser preenchida")
	private Integer qtd_capitulos;

	@NotNull(message = "O número de páginas deve ser preenchido")
	private Integer numero_paginas;

	@NotNull(message = "O Escritor deve ser preenchido")
  @ManyToOne()
	private Escritor escritor;

	@NotNull(message = "O Tipo de Livro deve ser preenchido")
  @ManyToOne()
	private TipoDeLivro tipoDeLivro;
}
