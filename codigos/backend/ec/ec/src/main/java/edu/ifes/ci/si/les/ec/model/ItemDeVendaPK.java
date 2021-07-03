package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;
import javax.persistence.*;
import lombok.*;


@Embeddable
@Data
@EqualsAndHashCode(of = {"venda", "livro"})
public class ItemDeVendaPK implements Serializable {
    public ItemDeVendaPK() {
    }

    private static final long serialVersionUID = 1L;

    @ManyToOne
    @JoinColumn(name = "venda_id")
    private Venda venda;

    @ManyToOne
    @JoinColumn(name = "livro_id")
    private Livro livro;    
}
