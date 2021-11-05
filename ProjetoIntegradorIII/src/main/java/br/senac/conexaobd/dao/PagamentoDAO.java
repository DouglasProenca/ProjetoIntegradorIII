package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Pagamento;
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
public class PagamentoDAO {

    public static List<Pagamento> getPagamento() throws ClassNotFoundException, SQLException {

        List<Pagamento> PagamentoList = new ArrayList<>();
        String query = "select a.nome, p.* from rc_pagamento p\n"
                + "inner join rc_matricula m\n"
                + "on m.id = p.id_matricula\n"
                + "inner join rc_aluno a\n"
                + "on a.id = m.id_pessoa;";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Pagamento pagamento = new Pagamento();
                int id = rs.getInt("id");
                int id_matricula = rs.getInt("id_matricula");
                String nome = rs.getString("nome");
                float juros = rs.getFloat("juros");
                int id_colaborador = rs.getInt("id_colaborador");
                String mes_ref = rs.getString("mes_ref");
                String ano_ref = rs.getString("ano_ref");
                String forma_pg = rs.getString("forma_pagamento");
                Date dt_pg = rs.getDate("data_pagamento");
                float valor = rs.getFloat("valor_pago");

                pagamento.setNome(nome);
                pagamento.setId(id);
                pagamento.setId_matricula(id_matricula);
                pagamento.setAno_ref(ano_ref);
                pagamento.setMes_ref(mes_ref);
                pagamento.setDt_pagamento(dt_pg);
                pagamento.setJuros(juros);
                pagamento.setForma_pagamento(forma_pg);
                pagamento.setValor_pago(valor);
                pagamento.setId_colaborador(id_colaborador);

                PagamentoList.add(pagamento);
            }

        } catch (SQLException ex) {
            Logger.getLogger(FilialDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return PagamentoList;

    }

    public static boolean atualizarPagamento(Pagamento pagamento) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "update rc_pagamento set data_pagamento=?,ano_ref=?,mes_ref=?, "
                + "juros=?,valor_pago=? where id=?";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setDate(1, new java.sql.Date(pagamento.getDt_pagamento().getTime()));
            ps.setString(2, pagamento.getAno_ref());
            ps.setString(3, pagamento.getMes_ref());
            ps.setFloat(4, pagamento.getJuros());
            ps.setFloat(5, pagamento.getValor_pago());
            ps.setInt(6, pagamento.getId());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
            ok = false;
            System.out.println(ex);
        }
        return ok;
    }

    public static Pagamento getPagamentoPorID(String id) throws ClassNotFoundException, SQLException {
        Pagamento pagamento = null;
        String query = "select a.nome, p.* from rc_pagamento p\n"
                + "inner join rc_matricula m\n"
                + "on m.id = p.id_matricula\n"
                + "inner join rc_aluno a\n"
                + "on a.id = m.id_pessoa where p.id = ?;";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pagamento = new Pagamento();
                int id_pag = rs.getInt("id");
                int id_matricula = rs.getInt("id_matricula");
                String nome = rs.getString("nome");
                float juros = rs.getFloat("juros");
                int id_colaborador = rs.getInt("id_colaborador");
                String mes_ref = rs.getString("mes_ref");
                String ano_ref = rs.getString("ano_ref");
                String forma_pg = rs.getString("forma_pagamento");
                Date dt_pg = rs.getDate("data_pagamento");
                float valor = rs.getFloat("valor_pago");

                pagamento.setNome(nome);
                pagamento.setId(id_pag);
                pagamento.setId_matricula(id_matricula);
                pagamento.setAno_ref(ano_ref);
                pagamento.setMes_ref(mes_ref);
                pagamento.setDt_pagamento(dt_pg);
                pagamento.setJuros(juros);
                pagamento.setForma_pagamento(forma_pg);
                pagamento.setValor_pago(valor);
                pagamento.setId_colaborador(id_colaborador);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return pagamento;
    }

    public static boolean deletarPagamento(String id) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "delete from rc_pagamento where id=?";
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

    public static List<Pagamento> getPagamentoPorNome(String nomeParam) throws ClassNotFoundException, SQLException {
        nomeParam = nomeParam.toUpperCase();
        List<Pagamento> PagamentoList = new ArrayList<>();
        String query = "select a.nome, p.* from rc_pagamento p\n"
                + "inner join rc_matricula m\n"
                + "on m.id = p.id_matricula\n"
                + "inner join rc_aluno a\n"
                + "on a.id = m.id_pessoa where a.nome like ?;";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, nomeParam + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Pagamento pagamento = new Pagamento();
                int id = rs.getInt("id");
                int id_matricula = rs.getInt("id_matricula");
                String nome = rs.getString("nome");
                float juros = rs.getFloat("juros");
                int id_colaborador = rs.getInt("id_colaborador");
                String mes_ref = rs.getString("mes_ref");
                String ano_ref = rs.getString("ano_ref");
                String forma_pg = rs.getString("forma_pagamento");
                Date dt_pg = rs.getDate("data_pagamento");
                float valor = rs.getFloat("valor_pago");

                pagamento.setNome(nome);
                pagamento.setId(id);
                pagamento.setId_matricula(id_matricula);
                pagamento.setAno_ref(ano_ref);
                pagamento.setMes_ref(mes_ref);
                pagamento.setDt_pagamento(dt_pg);
                pagamento.setJuros(juros);
                pagamento.setForma_pagamento(forma_pg);
                pagamento.setValor_pago(valor);
                pagamento.setId_colaborador(id_colaborador);
                PagamentoList.add(pagamento);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return PagamentoList;

    }

    public static void inserirPagamento(Pagamento pagamento) throws SQLException {
        try {
            boolean ok = true;
            String query = "insert into rc_pagamento values (null,?,?,?,?,?,?,?,?)";
            Connection con = Conexao.abrirConexao();
            PreparedStatement ps;
            ps = con.prepareStatement(query);
            ps.setInt(1, pagamento.getId());
            ps.setInt(2, pagamento.getId_matricula());
            ps.setString(3, pagamento.getAno_ref());
            ps.setString(4, pagamento.getMes_ref());
            ps.setDate(5, new java.sql.Date(pagamento.getDt_pagamento().getTime()));
            ps.setFloat(6, pagamento.getJuros());
            ps.setString(7, pagamento.getForma_pagamento());
            ps.setFloat(8, pagamento.getValor_pago());
            ps.setInt(9, pagamento.getId_colaborador());
            ps.execute();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Pagamento getClientePorCPF(String cpf) throws ClassNotFoundException, SQLException {
        Pagamento pagamento = null;
        String query = "select a.id aluno, m.id matri, p.* from rc_pagamento p\n"
                + "inner join rc_matricula m\n"
                + "on m.id = p.id_matricula\n"
                + "inner join rc_aluno a\n"
                + "on a.id = m.id_pessoa where a.cpf = ?;";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cpf);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pagamento = new Pagamento();
                int id = rs.getInt("aluno");
                int id_matricula = rs.getInt("matri");
                pagamento.setId(id);
                pagamento.setId_matricula(id_matricula);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return pagamento;
    }
}
