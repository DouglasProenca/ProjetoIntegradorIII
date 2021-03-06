package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Turma;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Douglas
 */
public class TurmaDAO {

    public static List<Turma> getTurma() throws ClassNotFoundException, SQLException {

        List<Turma> TurmaList = new ArrayList<>();
        String query = "select * from rc_turma";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Turma turma = new Turma();
                int id = rs.getInt("id");
                int id_filial = rs.getInt("empr_id");
                String nome = rs.getString("nome");
                int id_colaborador = rs.getInt("id_colaborador");
                Date dt_inicio = rs.getDate("data_inicio");
                Date dt_fim = rs.getDate("data_fim");
                float valor = rs.getFloat("valor");

                turma.setId(id);
                turma.setEmpr_id(id_filial);
                turma.setNome(nome);
                turma.setId_colaborador(id_colaborador);
                turma.setData_inicio(dt_inicio);
                turma.setData_fim(dt_fim);
                turma.setValor(valor);

                TurmaList.add(turma);
            }

        } catch (SQLException ex) {
            Logger.getLogger(FilialDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return TurmaList;

    }

    public static Turma getTurmaPorID(String id) throws ClassNotFoundException, SQLException {
        Turma turma = null;
        String query = "select * from rc_turma where id =?";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                turma = new Turma();
                int id_tuma = rs.getInt("id");
                int id_filial = rs.getInt("empr_id");
                String nome = rs.getString("nome");
                int id_colaborador = rs.getInt("id_colaborador");
                Date dt_inicio = rs.getDate("data_inicio");
                Date dt_fim = rs.getDate("data_fim");
                float valor = rs.getFloat("valor");

                turma.setId(id_tuma);
                turma.setEmpr_id(id_filial);
                turma.setNome(nome);
                turma.setId_colaborador(id_colaborador);
                turma.setData_inicio(dt_inicio);
                turma.setData_fim(dt_fim);
                turma.setValor(valor);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return turma;
    }

    public static void inserirTurma(Turma turma) throws SQLException {
        try {
            boolean ok = true;
            String query = "insert into rc_turma values (null,?,?,?,?,?,?)";
            Connection con = Conexao.abrirConexao();
            PreparedStatement ps;
            ps = con.prepareStatement(query);
            ps.setInt(1, turma.getEmpr_id());
            ps.setString(2, turma.getNome());
            ps.setInt(3, turma.getId_colaborador());
            ps.setDate(4, new java.sql.Date(turma.getData_inicio().getTime()));
            ps.setDate(5, new java.sql.Date(turma.getData_fim().getTime()));
            ps.setFloat(6, turma.getValor());

            ps.execute();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static boolean atualizarTurma(Turma turma) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "update rc_turma set nome=?,data_inicio=?,data_fim=?, "
                + "valor=? where id=?";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, turma.getNome());
            ps.setDate(2, new java.sql.Date(turma.getData_inicio().getTime()));
            ps.setDate(3, new java.sql.Date(turma.getData_fim().getTime()));
            ps.setFloat(4, turma.getValor());
            ps.setInt(5, turma.getId());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
            ok = false;
            System.out.println(ex);
        }
        return ok;
    }

    public static boolean deletarTurma(String id) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "delete from rc_turma where id=?";
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

    public static List<Turma> getTurmaPorNome(String nomeParam) throws ClassNotFoundException, SQLException {
       nomeParam = nomeParam.toUpperCase();
       List<Turma> turmas = new ArrayList<>();
       String query = "select * from rc_turma where nome like ?";
       
       Connection con = Conexao.abrirConexao(); 
       try {
           PreparedStatement ps = con.prepareStatement(query);
           ps.setString(1, nomeParam+"%");
           ResultSet rs = ps.executeQuery();
           while (rs.next()) {
                Turma turma = new Turma();
                 int id_tuma = rs.getInt("id");
                int id_filial = rs.getInt("empr_id");
                String nome = rs.getString("nome");
                int id_colaborador = rs.getInt("id_colaborador");
                Date dt_inicio = rs.getDate("data_inicio");
                Date dt_fim = rs.getDate("data_fim");
                float valor = rs.getFloat("valor");

                turma.setId(id_tuma);
                turma.setEmpr_id(id_filial);
                turma.setNome(nome);
                turma.setId_colaborador(id_colaborador);
                turma.setData_inicio(dt_inicio);
                turma.setData_fim(dt_fim);
                turma.setValor(valor);
                turmas.add(turma);
           }
       } catch (SQLException ex) {
           Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
       return turmas;
       
   }
}
