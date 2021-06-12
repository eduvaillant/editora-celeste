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
public class Cidade implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(length = 50)
	@NotBlank(message = "Nome da Cidade deve ser preenchido")
	@Size(min = 3, max = 50, message = "Nome da Cidade deve ter entre 3 e 50 letras")   
	private String nome;

	@ManyToOne
	@JoinColumn(name="uf_id")
	private UF uf;

}
