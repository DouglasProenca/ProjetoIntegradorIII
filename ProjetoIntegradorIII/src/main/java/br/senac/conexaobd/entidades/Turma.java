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
public class Turma extends Filial {

    private String nome;
    private Date data_inicio;
    private Date data_fim;
    private float valor;
    
    public Turma(){
        super();
    }
}
