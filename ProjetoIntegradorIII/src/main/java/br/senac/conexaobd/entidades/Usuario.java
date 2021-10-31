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
public class Usuario {

    private int id_rule;
    private String pessoa;
    private String senha;
    private int id_colaborador;
    private Date data_;
}
