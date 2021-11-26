package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Relatorios;
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

    public static List<Relatorios> gerar_rel_sintetico(int id_filial, Date dataInicial, Date dataFinal) throws ClassNotFoundException, SQLException {
        List<Relatorios> relatorioSinte = new ArrayList<>();

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
                Relatorios r = new Relatorios();
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

    public static List<Relatorios> gerar_rel_analitico(String turma) throws ClassNotFoundException, SQLException {
        List<Relatorios> relatorioSinte = new ArrayList<>();

        String query = "select a.nome\n"
                + "	  ,a.cpf\n"
                + "       ,t.nome\n"
                + "       ,t.valor\n"
                + "       ,m.dt_matricula\n"
                + "       ,count(p.id_matricula) pagamentos\n"
                + "       ,t.data_fim\n"
                + "       ,m.id id_matricula\n"
                + "       ,t.data_fim - t.data_inicio tempo_curso\n"
                + "       ,p.id\n"
                + "       ,m.ativo\n"
                + "       ,c.Nome colaborador\n"
                + "from RC_ALUNO a\n"
                + "inner join rc_matricula m\n"
                + " on m.id_pessoa = a.id\n"
                + "inner join rc_turma t\n"
                + " on t.id = m.id_turma\n"
                + "left join rc_pagamento p\n"
                + " on p.id_matricula = m.id\n"
                + "inner join rc_cargo c\n"
                + " on c.id = m.id_colaborador\n"
                + "where t.nome like ? or t.id like ?\n"
                + " group by a.nome;";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, turma);
            ps.setString(2, turma);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Relatorios r = new Relatorios();
                r.setNome(rs.getString("nome"));
                r.setCPF(rs.getString("cpf"));
                r.setNome_colaborador(rs.getString("colaborador"));
                r.setPagamentos(rs.getString("pagamentos"));
                r.setTurma(turma);
                r.setSituacao(rs.getString("ativo"));
                r.setId_matricula(rs.getInt("id_matricula"));
                r.setData_final(rs.getDate("data_fim"));
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
