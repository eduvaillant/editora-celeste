package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;
import javax.validation.constraints.*;

import com.fasterxml.jackson.annotation.JsonFormat;

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

	@NotNull(message = "Data de início da assinatura deve ser preenchido")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date data_inicio;

	@NotNull(message = "Data de término da assinatura deve ser preenchido")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date data_termino;

	@NotNull(message = "Preencha o total da assinatura")
	@Digits(integer=6, fraction=2, message="O total da assinatura deve ser preenchido com dígitos")
	private int total;

	// private TipoDeAssinatura tipoDeAssinatura;

	@ManyToOne
	private Usuario usuario;
}
