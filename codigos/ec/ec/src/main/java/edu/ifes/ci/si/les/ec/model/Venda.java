package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"id"})
@Entity
public class Venda implements Serializable {

  public Venda(double d, String string, Usuario usuario1, Class<byte[]> class1) {
  }

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
  @NotBlank(message = "A venda deve possuir pelo menos um Item de Venda")
  @OneToMany(mappedBy = "id.venda", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<ItemDeVenda> itemDeVenda;
}
