package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Colaborador;
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
 *
 * @author Douglas
 */
public class ColaboradorDAO {
 
    public static List<Colaborador> getColaborador() throws ClassNotFoundException, SQLException {

        List<Colaborador> Colaboradores = new ArrayList<>();
        String query = "select * from rc_cargo";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Colaborador colaborador = new Colaborador();
                int id = rs.getInt("id");
                int id_colaborador = rs.getInt("id_colaborador");
                String nome = rs.getString("nome");
                String categoria = rs.getString("categoria");
                String cargo = rs.getString("cargo");
                float salario = rs.getFloat("salario");
                Date data_ingresso = rs.getDate("data_ingresso");

                colaborador.setId(id);
                //colaborador.(rua);
                colaborador.setNome(nome);
                colaborador.setSetor(categoria);
                colaborador.setCargo(cargo);
                colaborador.setSalario(salario);
                colaborador.setId_colaborador(id_colaborador);
                colaborador.setData_ingresso(data_ingresso);
                Colaboradores.add(colaborador);
            }

        } catch (SQLException ex) {
            Logger.getLogger(FilialDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return Colaboradores;

    }
    
     public static Colaborador getFilialPorID(String idColaborador) throws ClassNotFoundException, SQLException {
        Colaborador colaborador = null;
        String query = "select * from rc_cargo where id =?";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, idColaborador);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                colaborador = new Colaborador();
                 int id = rs.getInt("id");
                int id_colaborador = rs.getInt("id_colaborador");
                String nome = rs.getString("nome");
                String categoria = rs.getString("categoria");
                String cargo = rs.getString("cargo");
                float salario = rs.getFloat("salario");
                Date data_ingresso = rs.getDate("data_ingresso");

                colaborador.setId(id);
                //colaborador.(rua);
                colaborador.setNome(nome);
                colaborador.setSetor(categoria);
                colaborador.setCargo(cargo);
                colaborador.setSalario(salario);
                colaborador.setId_colaborador(id_colaborador);
                colaborador.setData_ingresso(data_ingresso);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return colaborador;
    }
    
    public static void inserirColaborador(Colaborador colaborador) throws SQLException {
        try {
            boolean ok = true;
            String query = "insert into rc_cargo values (null,'1',?,?,?,?,?,?)";
            Connection con = Conexao.abrirConexao();
            PreparedStatement ps;
            ps = con.prepareStatement(query);
            //ps.setInt(1, colaborador.getId_colaborador());
            ps.setString(1, colaborador.getNome());
            ps.setString(2, colaborador.getSetor());
            ps.setString(3, colaborador.getCargo());
            ps.setFloat(4, colaborador.getSalario());
            ps.setInt(5, colaborador.getId_colaborador());
            ps.setDate(6, new java.sql.Date(colaborador.getData_ingresso().getTime()));
            ps.execute();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     public static boolean deletarColaborador(String id) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "delete from rc_cargo where id=?";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
    
    public static boolean atualizarColaborador(Colaborador colaborador) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "update rc_cargo nome=?,categoria=?,cargo=?, "
                + "salario=?,data_ingresso=? where id=?";
        Connection con = Conexao.abrirConexao();
        try {
           PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, colaborador.getNome());
            ps.setString(2, colaborador.getSetor());
            ps.setString(3, colaborador.getCargo());
            ps.setFloat(4, colaborador.getSalario());
            ps.setInt(5, colaborador.getId_colaborador());
            ps.setDate(6, new java.sql.Date(colaborador.getData_ingresso().getTime()));
            ps.setInt(7, colaborador.getId());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
            ok = false;
            System.out.println(ex);
        }
        return ok;
    }
    
    public static List<Colaborador> getColaboradorNome(String nomeParam) throws ClassNotFoundException, SQLException {
       nomeParam = nomeParam.toUpperCase();
       List<Colaborador> colaboradores = new ArrayList<>();
       String query = "select * from rc_cargo where nome like ?";
       
       Connection con = Conexao.abrirConexao(); 
       try {
           PreparedStatement ps = con.prepareStatement(query);
           ps.setString(1, nomeParam+"%");
           ResultSet rs = ps.executeQuery();
           while (rs.next()) {
               Colaborador colaborador = new Colaborador();
                  int id = rs.getInt("id");
                int id_colaborador = rs.getInt("id_colaborador");
                String nome = rs.getString("nome");
                String categoria = rs.getString("categoria");
                String cargo = rs.getString("cargo");
                float salario = rs.getFloat("salario");
                Date data_ingresso = rs.getDate("data_ingresso");

                colaborador.setId(id);
                //colaborador.(rua);
                colaborador.setNome(nome);
                colaborador.setSetor(categoria);
                colaborador.setCargo(cargo);
                colaborador.setSalario(salario);
                colaborador.setId_colaborador(id_colaborador);
                colaborador.setData_ingresso(data_ingresso);
                colaboradores.add(colaborador);
           }
       } catch (SQLException ex) {
           Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
       return colaboradores;
        
   }
}
