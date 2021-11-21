package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Rel_Sintetico;
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
public class RelatoriosDAO {

    public static List<Rel_Sintetico> gerar_rel_sintetico(int id_filial, Date dataInicial, Date dataFinal) throws ClassNotFoundException, SQLException {
        List<Rel_Sintetico> relatorioSinte = new ArrayList<>();

        String query = "select a.nome\n"
                + "	  ,m.dt_matricula\n"
                + "      ,(select t.data_fim - t.data_inicio) as 'tempo_curso'\n"
                + "      ,t.valor\n"
                + "from RC_ALUNO a\n"
                + "inner join RC_MATRICULA m\n"
                + "on m.id_pessoa = a.id\n"
                + "inner join RC_TURMA t \n"
                + "on m.id_turma = t.id\n"
                + "inner join RC_FILIAL f\n"
                + "on f.empr_id = t.empr_id\n"
                + "where m.dt_matricula between ? and ?\n"
                + "and f.empr_id = ?;";
        
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setDate(1, new java.sql.Date(dataInicial.getTime()));
            ps.setDate(2, new java.sql.Date(dataFinal.getTime()));
            ps.setInt(3, id_filial);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Rel_Sintetico r = new Rel_Sintetico();
                r.setNome(rs.getString("nome"));
                r.setDtCompra(rs.getDate("dt_matricula"));
                r.setTempoCurso(rs.getString("tempo_curso"));
                r.setValorContrato(rs.getFloat("valor"));

                relatorioSinte.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return relatorioSinte;
    }
}
