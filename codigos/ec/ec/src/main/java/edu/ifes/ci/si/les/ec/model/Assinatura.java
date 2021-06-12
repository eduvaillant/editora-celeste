package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"id"})
@Entity
public class Assinatura implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private Date data_inicio;

	private Date data_termino;

	private int total;

	// private TipoDeAssinatura tipoDeAssinatura;

	@ManyToOne
	@JoinColumn(name="usuario_id")
	private Usuario usuario;

}
