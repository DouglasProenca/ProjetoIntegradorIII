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
public class Colaborador extends Pessoa {

    private String cargo;
    private String setor;
    private float salario;
    private Date data_ingresso;
}
