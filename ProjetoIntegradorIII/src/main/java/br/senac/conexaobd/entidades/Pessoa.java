package br.senac.conexaobd.entidades;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Douglas
 */
@Getter
@Setter
public abstract class Pessoa {
    
    private int id;
    private String Nome;
    private int id_colaborador;
    private int Empr_id;
    
    public Pessoa(){
        
    }
}
