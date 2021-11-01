package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * 20/10/2021
 *
 * @author Douglas Proença
 */
public class ClienteDAO {

    public static void inserirCliente(Cliente cliente) throws SQLException {
        try {
            boolean ok = true;
            String query = "insert into rc_aluno values (null,?,?,?,?,?,?,?,?)";
            Connection con = Conexao.abrirConexao();
            PreparedStatement ps;
            ps = con.prepareStatement(query);
            ps.setInt(1, cliente.getEmpr_id());
            ps.setString(2, cliente.getNome());
            ps.setString(3, cliente.getSexo());
            ps.setString(4, cliente.getEmail());
            ps.setString(5, cliente.getCPF());
            ps.setString(6, cliente.getCelular());
            ps.setString(7, cliente.getTelResidencial());
            ps.setInt(8, cliente.getId_colaborador());
            
            ps.execute();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static List<Cliente> getClientes() throws ClassNotFoundException, SQLException {

        List<Cliente> clientes = new ArrayList<>();
        String query = "select * from rc_aluno order by nome;";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                int id = rs.getInt("id");
                int id_filial = rs.getInt("id_filial");
                int id_colaborador = rs.getInt("id_colaborador");
                String nome = rs.getString("nome");
                String sexo = rs.getString("sexo");
                String email = rs.getString("email");
                String cpf = rs.getString("cpf");
                String celular = rs.getString("celular");
                String telResidencial = rs.getString("tel_residencial");

                cliente.setId(id);
                cliente.setEmpr_id(id_filial);
                cliente.setId_colaborador(id_colaborador);
                cliente.setNome(nome);
                cliente.setSexo(sexo);
                cliente.setEmail(email);
                cliente.setCPF(cpf);
                cliente.setCelular(celular);
                cliente.setTelResidencial(telResidencial);
                clientes.add(cliente);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return clientes;

    }

    public static Cliente getClientePorCPF(String cpf) throws ClassNotFoundException, SQLException {
        Cliente cliente = null;
        String query = "select * from rc_aluno where cpf = ?;";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cpf);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cliente = new Cliente();
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                String celular = rs.getString("celular");
                String telResidencial = rs.getString("tel_residencial");
                cliente.setNome(nome);
                cliente.setEmail(email);
                cliente.setCPF(cpf);
                cliente.setCelular(celular);
                cliente.setTelResidencial(telResidencial);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return cliente;
    }

    public static boolean deletarCliente(String cpf) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "delete from rc_aluno where cpf=?";
        Connection con = Conexao.abrirConexao();
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

    public static boolean atualizarCliente(Cliente cliente) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "update rc_aluno set nome=?,email=?,celular=?,tel_residencial=?, "
                + "tel_comercial=?where cpf=?";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            //ps.setInt(1, cliente.getId_filial());
            //ps.setInt(2, cliente.getId_colaborador()); 
            ps.setString(1, cliente.getNome());
            //ps.setString(2, cliente.getSexo());
            ps.setString(2, cliente.getEmail());
            ps.setString(7, cliente.getCPF());
            ps.setString(3, cliente.getCelular());
            ps.setString(4, cliente.getTelResidencial());

            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
            ok = false;
            System.out.println(ex);
        }
        return ok;
    }

     public static List<Cliente> getClientePorNome(String nomeParam) throws ClassNotFoundException, SQLException {
       nomeParam = nomeParam.toUpperCase();
       List<Cliente> clientes = new ArrayList<>();
       String query = "select * from rc_aluno where nome like ?";
       
       Connection con = Conexao.abrirConexao(); 
       try {
           PreparedStatement ps = con.prepareStatement(query);
           ps.setString(1, nomeParam+"%");
           ResultSet rs = ps.executeQuery();
           while (rs.next()) {
               Cliente cliente = new Cliente();
                int id = rs.getInt("id");
                int id_filial = rs.getInt("id_filial");
                int id_colaborador = rs.getInt("id_colaborador");
                String nome = rs.getString("nome");
                String sexo = rs.getString("sexo");
                String email = rs.getString("email");
                String cpf = rs.getString("cpf");
                String celular = rs.getString("celular");
                String telResidencial = rs.getString("tel_residencial");

                cliente.setId(id);
                cliente.setEmpr_id(id_filial);
                cliente.setId_colaborador(id_colaborador);
                cliente.setNome(nome);
                cliente.setSexo(sexo);
                cliente.setEmail(email);
                cliente.setCPF(cpf);
                cliente.setCelular(celular);
                cliente.setTelResidencial(telResidencial);
                clientes.add(cliente);
           }
       } catch (SQLException ex) {
           Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
       return clientes;
       
   }
}
