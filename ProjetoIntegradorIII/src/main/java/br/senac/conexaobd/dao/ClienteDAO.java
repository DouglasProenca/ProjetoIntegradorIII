package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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
            String query = "insert into rc_pessoa values (null,1,2,?,0,?,?,?,?,?,'2021-09-09','Solteiro','2021-09-09',1,?)";
            Connection con = Conexao.abrirConexao();
            PreparedStatement ps;
            ps = con.prepareStatement(query);
            //ps.setInt(1, cliente.getId_filial());
            //ps.setInt(2, cliente.getId_categoria());
            //ps.setInt(2, cliente.getId_colaborador()); 
            ps.setString(1, cliente.getNome());
            //ps.setString(2, cliente.getSexo());
            ps.setString(2, cliente.getEmail());
            ps.setString(3, cliente.getCPF());
            ps.setString(4, cliente.getCelular());
            ps.setString(5, cliente.getTelResidencial());
            ps.setString(6, cliente.getTelComercial());
            //ps.setDate(8, (java.sql.Date) cliente.getDataNascimento());
            //ps.setString(8, cliente.getEstadoCivil());
            ps.setString(7, cliente.getObs());
            //ps.setDate(14, (java.sql.Date) cliente.getData_());
            ps.execute();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static List<Cliente> getClientes() throws ClassNotFoundException, SQLException {

        List<Cliente> clientes = new ArrayList<>();
        String query = "select id,id_filial,id_categoria,nome,case when sexo = 0 then 'Masculino' else 'Feminino' end as sexo,\n"
                + "email,cpf,celular,tel_residencial,tel_comercial,data_nasc,estado_civil,data_,id_colaborador,obs from rc_pessoa order by nome;";

        Connection con = Conexao.abrirConexao();
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

    public static Cliente getClientePorCPF(String cpf) throws ClassNotFoundException, SQLException {
        Cliente cliente = null;
        String query = "select id,id_filial,id_categoria,nome,case when sexo = 0 then 'Masculino' else 'Feminino' end as sexo,\n"
                + "email,cpf,celular,tel_residencial,tel_comercial,data_nasc,estado_civil,data_,id_colaborador,obs from rc_pessoa where cpf = ?;";

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
                String telComercial = rs.getString("tel_comercial");
                String estadoCivil = rs.getString("estado_civil");
                String obs = rs.getString("obs");
                Date dataNascimento = rs.getDate("data_nasc");
                Date data_ = rs.getDate("data_");
                cliente.setNome(nome);
                cliente.setEmail(email);
                cliente.setCPF(cpf);
                cliente.setCelular(celular);
                cliente.setTelResidencial(telResidencial);
                cliente.setTelComercial(telComercial);
                cliente.setEstadoCivil(estadoCivil);
                cliente.setObs(obs);
                cliente.setDataNascimento(dataNascimento);
                cliente.setData_(data_);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return cliente;
    }

    public static boolean deletarCliente(String cpf) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "delete from rc_pessoa where cpf=?";
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
        String query = "update rc_pessoa set nome=?,email=?,celular=?,tel_residencial=?, "
                + "tel_comercial=?,obs=? where cpf=?";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            //ps.setInt(1, cliente.getId_filial());
            //ps.setInt(2, cliente.getId_categoria());
            //ps.setInt(2, cliente.getId_colaborador()); 
            ps.setString(1, cliente.getNome());
            //ps.setString(2, cliente.getSexo());
            ps.setString(2, cliente.getEmail());
            ps.setString(7, cliente.getCPF());
            ps.setString(3, cliente.getCelular());
            ps.setString(4, cliente.getTelResidencial());
            ps.setString(5, cliente.getTelComercial());
            //ps.setDate(8, (java.sql.Date) cliente.getDataNascimento());
            //ps.setString(8, cliente.getEstadoCivil());
            ps.setString(6, cliente.getObs());
            //ps.setDate(14, (java.sql.Date) cliente.getData_());
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
       String query = "select * from rc_pessoa where nome like ?";
       
       Connection con = Conexao.abrirConexao(); 
       try {
           PreparedStatement ps = con.prepareStatement(query);
           ps.setString(1, nomeParam+"%");
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
           Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
       return clientes;
       
   }
}
