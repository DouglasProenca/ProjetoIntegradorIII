package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Matricula;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Douglas
 */
public class MatriculaDAO {
     public static void inserirMatricula(Matricula matricula) throws SQLException {
        try {
            boolean ok = true;
            String query = "insert into rc_matricula values (null,?,?,?,?,?,?,?)";
            Connection con = Conexao.abrirConexao();
            PreparedStatement ps;
            ps = con.prepareStatement(query);
            ps.setInt(1, matricula.getId_turma());
            ps.setInt(2, matricula.getId());
            ps.setString(3, matricula.getMatricula());
            ps.setString(4, matricula.getAtivo()); 
            ps.setInt(5, matricula.getDia_venc_mensalidade());
            ps.setDate(6, new java.sql.Date(matricula.getDt_matricula().getTime()));
            ps.setInt(7, matricula.getId_colaborador());
            
            ps.execute();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
