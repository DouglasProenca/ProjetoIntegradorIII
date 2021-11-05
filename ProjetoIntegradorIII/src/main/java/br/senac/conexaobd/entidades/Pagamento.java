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
public class Pagamento extends Pessoa {

    private int id_matricula;
    private String ano_ref;
    private String mes_ref;
    private float juros;
    private String forma_pagamento;
    private float valor_pago;
    private Date dt_pagamento;
    
    public Pagamento() {

    }
}
