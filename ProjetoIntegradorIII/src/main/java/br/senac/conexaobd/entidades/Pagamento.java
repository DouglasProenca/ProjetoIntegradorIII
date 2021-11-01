package br.senac.conexaobd.entidades;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Douglas
 */
@Getter
@Setter
public class Pagamento {

    private String ano_ref;
    private String mes_ref;
    private float juros;
    private String forma_pagamento;
    private float valor_pago;
    
    public Pagamento() {

    }
}
