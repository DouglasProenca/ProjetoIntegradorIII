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
public class Matricula extends Cliente {

    private int id;
    private int id_turma;
    private String matricula;
    private String ativo;
    private int dia_venc_mensalidade;
    private Date dt_matricula;

    public Matricula() {
        super();
    }
}
