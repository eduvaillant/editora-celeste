package edu.ifes.ci.si.les.ec.model;

import java.io.Serializable;
import javax.persistence.*;
import lombok.*;

//Classe criada para representar a chave primária composta do objeto ItemDeEmprestimo
@Embeddable
@Data
@EqualsAndHashCode(of = {"venda", "livro"})
public class ItemDeVendaPK implements Serializable {

    private static final long serialVersionUID = 1L;

    @ManyToOne
    @JoinColumn(name = "venda_id")
    private Venda venda;

    @ManyToOne
    @JoinColumn(name = "livro_id")
    private Livro livro;    
}
