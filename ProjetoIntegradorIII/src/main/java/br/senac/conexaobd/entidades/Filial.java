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
public class Filial {

    private int empr_id;
    private String rua;
    private String numero;
    private String bairro;
    private String cidade;
    private String cep;
    private String uf;
    private int id_colaborador;
    private Date data_lançamento;
    
    public Filial(){
        
    }
    
}
