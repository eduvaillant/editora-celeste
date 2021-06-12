package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

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
  @NotBlank(message = "Nome do Usuario deve ser preenchido")
  @Size(min = 2, max = 50, message = "Nome da Usuario deve ter entre 2 e 50 letras")
	private String nome;

  @Column(length = 50)
  @NotBlank(message = "CPF da Pessoa deve ser preenchido")
  @Size(min = 2, max = 50, message = "CPF da Pessoa deve ter entre 2 e 50 letras")
  @Pattern(regexp="\\d{3}.\\d{3}.\\d{3}-\\d{2}", message = "CPF da Pessoa deve seguir o padrão NNN.NNN.NNN-NN")
  private String cpf;

  @Column(length = 50)
  @NotBlank(message = "Rua da Pessoa deve ser preenchido")
  @Size(min = 2, max = 50, message = "Rua da Pessoa deve ter entre 2 e 50 letras")
  private String rua;

	@Digits(integer=4, fraction=0, message = "Número da Casa da Pessoa deve ser preenchido com um valor inteiro")
  private Integer numero;

	@JsonFormat(pattern = "yyyy-MM-dd")
  private Date data_de_nascimento;

  @Column(length = 150)
  @NotBlank(message = "O Email ser preenchida")
  @Size(min = 6, max = 150, message = "Senha do Funcionário deve ter entre 6 e 150 caracteres")
	private String email;

  @Column(length = 20)
  @NotBlank(message = "Senha do Gerente deve ser preenchida")
  @Size(min = 6, max = 10, message = "Senha do Funcionário deve ter entre 6 e 20 caracteres")
  private String senha;

  @NotNull(message = "O Bairro do Usuário deve ser preenchido")
  @ManyToOne
  @JoinColumn(name = "bairro_id")
  private Bairro bairro;
}
