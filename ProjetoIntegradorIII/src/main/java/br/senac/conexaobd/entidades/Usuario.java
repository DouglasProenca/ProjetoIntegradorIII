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
public class Usuario extends Cargo {

    private int id;
    private String senha;

    public Usuario() {
        super();
    }
    
     public boolean isEX(){
        return "EX".equalsIgnoreCase(this.getCategoria());   
    }

    public boolean isTI() {
        return "TI".equalsIgnoreCase(this.getCategoria());
    }
    
    public boolean isVendas(){
        return "Vendas".equalsIgnoreCase(this.getCategoria());   
    }
    
    public boolean isAdministrativo(){
        return "Administrativo".equalsIgnoreCase(this.getCategoria());   
    }
    
    public boolean isServico(){
        return " Produtos/Serviços/Marketing".equalsIgnoreCase(this.getCategoria());   
    }        
}
