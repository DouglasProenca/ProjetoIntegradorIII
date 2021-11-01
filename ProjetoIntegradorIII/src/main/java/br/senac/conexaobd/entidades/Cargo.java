package br.senac.conexaobd.entidades;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Douglas
 */
@Getter
@Setter
public class Cargo extends Pessoa {

    private String categoria;
    private String cargo;
    private float salario;
    private Date data_ingresso;

    public Cargo() {
        super();
    }
}
