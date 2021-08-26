package edu.ifes.ci.si.les.ec.model;


import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.*;
import lombok.*;
import com.fasterxml.jackson.annotation.JsonIgnore;

//TODO alterar tudo relacionado a ItemDeVenda para ItemDeCompra
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"id"})
@Entity
public class ItemDeVenda implements Serializable {

  private static final long serialVersionUID = 1L;

	@JsonIgnore
	@EmbeddedId
	private ItemDeVendaPK id = new ItemDeVendaPK();

	@Digits(integer=1, fraction=0, message = "A quantidade deve ser preenchida com um valor inteiro")
	private Integer quantidade;

	@Column(length = 150)
	@Size(max = 150, message = "A observação pode ter no máximo 150 caracteres")
	private String observacao;

	@Min(value = 1, message = "Valor do Item de Venda deve ser maior que zero")
	@NotNull(message = "Valor do Item de Venda deve ser preenchido")
	@Digits(integer=6, fraction=2, message = "Valor do Item de Venda deve ser preenchido com dígitos")
	private double total;

	@Builder
	public ItemDeVenda(Compra compra, Livro livro, Integer quantidade, String observacao, double total) {
		this.id.setCompra(compra);
		this.id.setLivro(livro);
		this.quantidade = quantidade;
		this.observacao = observacao;
		this.total = total;
	}
	
}
