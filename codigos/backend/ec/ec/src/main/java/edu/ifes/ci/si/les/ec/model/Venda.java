package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"id"})
@Entity
public class Venda implements Serializable { // TODO: Alterar "Venda" para "Compra"

  private static final long serialVersionUID = 1L;

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;

  @Min(value = 1, message = "O Total da Venda deve ser maior que zero")
  @NotNull(message = "O Total da Venda deve ser preenchido")
  @Digits(integer=6, fraction=2, message = "O Total da Venda deve ser preenchido com dígitos")
	private double total;

  @Column(length = 50)
  @NotBlank(message = "A Forma de Pagamento deve ser preenchida")
  @Size(min = 2, max = 50, message = "Forma de Pagamento deve ter entre 2 e 50 letras")
	private String formaDePagamento;

  @ManyToOne
	private Usuario usuario;
	
  @NotNull(message = "A venda deve possuir pelo menos um Item de Venda")
  @OneToMany(mappedBy = "id.venda", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<ItemDeVenda> itemDeVenda;

  @Builder
  public Venda(Integer id, Double total, String formaDePagamento, Usuario usuario) {
    this.id = id;
    this.total = total;
    this.formaDePagamento = formaDePagamento;
    this.usuario = usuario;
  }
}
