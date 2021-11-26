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
public class Relatorios extends Cliente {

    private String nome_colaborador;
    private String pagamentos;
    private int id_matricula;
    private String situacao;
    private String turma;
    private Date data_inicial;
    private Date data_final;
    private Date dtCompra;
    private String tempoCurso;
    private float valorContrato;
    
    public Relatorios(){
        super();
    }
}