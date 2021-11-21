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
public class Rel_Sintetico extends Pessoa {

    private Date data_inicial;
    private Date data_final;
    private Date dtCompra;
    private String tempoCurso;
    private float valorContrato;
    
    public Rel_Sintetico(){
        super();
    }
}
