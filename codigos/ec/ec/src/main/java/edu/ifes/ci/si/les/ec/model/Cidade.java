package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"id"})
@Entity
public class Cidade {

	private static final long serialVersionUID = 1L;

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String nome;

	private Bairro bairro; 

	@ManyToOne
	@JoinColumn(name="uf_id")
	private UF uf;

}
