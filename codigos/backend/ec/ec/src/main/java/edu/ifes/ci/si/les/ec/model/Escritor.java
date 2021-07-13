package edu.ifes.ci.si.les.ec.model;

import java.util.Date;

import javax.persistence.*;
import javax.validation.constraints.*;
import lombok.*;
@Data 
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Entity
public class Escritor extends Usuario {
	private static final long serialVersionUID = 1L;

	@Column(length = 50)
	@NotBlank(message = "Nome Artistico deve ser preenchido")
	@Size(min = 3, max = 50, message = "Nome Artistico deve ter entre 3 e 50 letras")   
	private String nome_artistico;

	@Column(length = 255)
	private String imagem;

	@Column(length = 100)
	@NotBlank(message = "Email deve ser preenchido")
	@Size(min = 2, max = 100, message = "Email deve ter entre 2 e 100 caracteres")
	private String email_escritor;

	//https://en.wikipedia.org/wiki/E.164
	// 15 Caracteres é a  de tamanho maximo para numeros de telefone
	@Column
  @NotBlank(message = "telefone deve ser preenchido")
	@Size(min = 2, max = 16, message = "Telefone deve ter entre 2 e 16 caracteres")
	private String telefone;

	@Builder
	public Escritor(Integer id, String nome, String cpf, String rua, String numero, Date data_de_nascimento,  String email, String senha, Bairro bairro, String nome_artistico, String email_escritor, String telefone) {
		super(id, nome, cpf, rua, numero, data_de_nascimento, email, senha, bairro);
		this.email_escritor = email_escritor;
		this.nome_artistico = nome_artistico;
		this.telefone = telefone;
	}

	@Builder
	public Escritor(Integer id, String nome, String cpf, String rua, String numero, Date data_de_nascimento,  String email, String senha, Bairro bairro, String nome_artistico, String email_escritor, String telefone, String imagem) {
		super(id, nome, cpf, rua, numero, data_de_nascimento, email, senha, bairro);
		this.email_escritor = email_escritor;
		this.nome_artistico = nome_artistico;
		this.telefone = telefone;
		this.imagem = imagem;
	}
}
