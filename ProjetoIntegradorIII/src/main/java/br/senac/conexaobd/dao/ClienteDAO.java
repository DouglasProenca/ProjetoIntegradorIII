/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tiago Scarton
 */
public class ClienteDAO {

    public static void inserirCliente(Cliente cliente) throws SQLException {
        boolean ok = true;
        String query = "insert into cliente(nome,cpf,email) values (?,?,?)";
        Connection con = Conexao.getConexao();
        PreparedStatement ps;
        ps = con.prepareStatement(query);
        ps.setString(1, cliente.getNome());
        ps.setString(2, cliente.getCPF());
        ps.setString(3, cliente.getEmail());
        ps.execute();

    }

    public static List<Cliente> getClientes() {
        List<Cliente> clientes = new ArrayList<>();
        String query = "select * from rc_pessoa";

        Connection con = Conexao.getConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                int id = rs.getInt("id");
                int id_filial = rs.getInt("id_filial");
                int id_categoria = rs.getInt("id_categoria");
                int id_colaborador = rs.getInt("id_colaborador");
                String nome = rs.getString("nome");
                String sexo = rs.getString("sexo");
                String email = rs.getString("email");
                String cpf = rs.getString("cpf");
                String celular = rs.getString("celular");
                String telResidencial = rs.getString("tel_residencial");
                String telComercial = rs.getString("tel_comercial");
                String estadoCivil = rs.getString("estado_civil");
                String obs = rs.getString("obs");
                Date dataNascimento = rs.getDate("data_nasc");
                Date data_ = rs.getDate("data_");

                cliente.setId(id);
                cliente.setId_filial(id_filial);
                cliente.setId_categoria(id_categoria);
                cliente.setId_colaborador(id_colaborador);
                cliente.setNome(nome);
                cliente.setSexo(sexo);
                cliente.setEmail(email);
                cliente.setCPF(cpf);
                cliente.setCelular(celular);
                cliente.setTelResidencial(telResidencial);
                cliente.setTelComercial(telComercial);
                cliente.setEstadoCivil(estadoCivil);
                cliente.setObs(obs);
                cliente.setDataNascimento(dataNascimento);
                cliente.setData_(data_);
                clientes.add(cliente);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return clientes;

    }

    public static Cliente getClientePorCPF(String cpf) {
        Cliente cliente = null;
        String query = "select * from cliente where cpf=?";

        Connection con = Conexao.getConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cpf);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cliente = new Cliente();
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                cliente.setNome(nome);
                cliente.setEmail(email);
                cliente.setCPF(cpf);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return cliente;

    }

    public static boolean deletarCliente(String cpf) {
        boolean ok = true;
        String query = "delete from cliente where cpf=?";
        Connection con = Conexao.getConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cpf);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }

    public static boolean atualizarCliente(Cliente cliente) {
        boolean ok = true;
        String query = "update cliente set nome=?,email=? where cpf=?";
        Connection con = Conexao.getConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getEmail());
            ps.setString(3, cliente.getCPF());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }

    public static List<Cliente> pesquisar(String pesquisa) {
        if (pesquisa.length() < 3) {
            System.out.println("teste");
        }
        List<Cliente> clientes = new ArrayList<>();
        String query = "select * from cliente where nome like ?";

        Connection con = Conexao.getConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, "%" + pesquisa + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                String cpf = rs.getString("cpf");
                cliente.setNome(nome);
                cliente.setEmail(email);
                cliente.setCPF(cpf);
                clientes.add(cliente);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return clientes;

    }
}
