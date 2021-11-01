package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author Douglas
 */
public class UsuarioDAO {

    public static Usuario getUsuario(String login, String senha) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.abrirConexao();
        Usuario usuario = null;
        String query = "select p.nome, u.data_,u.id_colaborador, u.senha, u.id_rule from rc_usuario u \n"
                + "inner join rc_cargo p\n"
                + "on u.id_pessoa = p.id\n"
                + "where p.nome = ? and u.senha = ?;";

        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, login);
        ps.setString(2, senha);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            int id_rule = rs.getInt("id_rule");
            int id_colaborador = rs.getInt("id_colaborador");
            Date data = rs.getDate("data_");
            usuario = new Usuario();
            usuario.setPessoa(login);
            usuario.setId_rule(id_rule);
            usuario.setId_colaborador(id_colaborador);
            usuario.setData_(data);
        }
        return usuario;
    }
}
