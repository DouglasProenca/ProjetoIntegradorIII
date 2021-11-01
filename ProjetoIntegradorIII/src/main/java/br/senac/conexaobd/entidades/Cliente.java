/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.conexaobd.entidades;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

/**
 * 20/10/2021
 * @author Douglas Proença
 */
@Getter
@Setter
public class Cliente {

  private int id;
  private int id_filial;
  private int id_categoria;
  private int id_colaborador;
  private String nome;
  private String sexo;
  private String email;
  private String CPF;
  private String celular;
  private String telResidencial;
  private String telComercial;
  private Date dataNascimento;
  private Date data_;
      
}
