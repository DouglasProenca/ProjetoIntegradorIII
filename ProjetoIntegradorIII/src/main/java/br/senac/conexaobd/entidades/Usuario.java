package br.senac.conexaobd.entidades;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Douglas
 */
@Getter
@Setter
public class Usuario extends Colaborador {

    private int id;
    private String senha;

    public Usuario() {
        super();
    }
    
     public boolean isEX(){
        return "EX".equalsIgnoreCase(this.getSetor());   
    }

    public boolean isTI() {
        return "TI".equalsIgnoreCase(this.getSetor());
    }
    
    public boolean isVendas(){
        return "Vendas".equalsIgnoreCase(this.getSetor());   
    }
    
    public boolean isAdministrativo(){
        return "Administrativo".equalsIgnoreCase(this.getSetor());   
    }
    
    public boolean isServico(){
        return " Produtos/Serviços/Marketing".equalsIgnoreCase(this.getSetor());   
    }        
}
