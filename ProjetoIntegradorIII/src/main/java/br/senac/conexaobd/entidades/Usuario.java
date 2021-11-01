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
}
