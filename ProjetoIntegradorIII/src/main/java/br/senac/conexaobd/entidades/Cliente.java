package br.senac.conexaobd.entidades;

import lombok.Getter;
import lombok.Setter;

/**
 * 20/10/2021
 * @author Douglas Proença
 */
@Getter
@Setter
public class Cliente extends Pessoa {

  private String sexo;
  private String email;
  private String CPF;
  private String celular;
  private String telResidencial;
      
  public Cliente(){
      
  }
}
