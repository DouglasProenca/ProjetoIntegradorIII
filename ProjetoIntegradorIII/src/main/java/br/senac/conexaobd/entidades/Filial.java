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
    private String nome;
    private String rua;
    private String numero;
    private String bairro;
    private String cidade;
    private String CEP;
    private String Uf;
    private int id_colaborador;
    private Date data_;
    private String obs;
    
    public Filial(){
        
    }
    
    
}
