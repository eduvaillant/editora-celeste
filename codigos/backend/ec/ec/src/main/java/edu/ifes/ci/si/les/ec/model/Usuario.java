package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;
import javax.validation.constraints.*;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.*;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"id"})
@Inheritance(strategy=InheritanceType.JOINED)
public class Usuario implements Serializable {  

  private static final long serialVersionUID = 1L;

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

  @Column(length = 50)
  @NotBlank(message = "O nome do usuário deve ser preenchido")
  @Size(min = 2, max = 50, message = "O nome da usuário deve ter entre 2 e 50 letras")
	private String nome;

  @Column(length = 14)
  @NotBlank(message = "O CPF do usuário deve ser preenchido")
  @Size(min = 14, max = 14, message = "O CPF do usuário deve ter 14 digítos")
  @Pattern(regexp="\\d{3}.\\d{3}.\\d{3}-\\d{2}", message = "O CPF do usuário deve seguir o padrão NNN.NNN.NNN-NN")
  private String cpf;

  @Column(length = 50)
  @NotBlank(message = "A rua do usuário deve ser preenchida")
  @Size(min = 2, max = 50, message = "A rua da usuário deve ter entre 2 e 50 letras")
  private String rua;

	@Digits(integer=4, fraction=0, message = "O número da casa do usuário deve ser preenchido com um valor inteiro")
  private Integer numero;

	@JsonFormat(pattern = "yyyy-MM-dd")
  private Date data_de_nascimento;

  @Column(length = 150)
  @NotBlank(message = "O email do usuário deve ser preenchido")
  @Size(min = 6, max = 150, message = "O email do usuário deve ter entre 6 e 150 caracteres")
	private String email;

  @Column(length = 20)
  @NotBlank(message = "A senha do usuário deve ser preenchida")
  @Size(min = 6, max = 10, message = "A senha do usuário deve ter entre 6 e 20 caracteres")
  private String senha;

  @NotNull(message = "O bairro do usuário deve ser preenchido")
  @ManyToOne
  @JoinColumn(name = "bairro_id")
  private Bairro bairro;
}
