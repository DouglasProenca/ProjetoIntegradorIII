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
        String query = "select p.nome,u.id_colaborador, u.senha, u.id from rc_usuario u \n"
                + "inner join rc_cargo p\n"
                + "on u.id_colaborador = p.id\n"
                + "where p.nome = ? and u.senha = ?;";

        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, login);
        ps.setString(2, senha);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            int id_rule = rs.getInt("id");
            int id_colaborador = rs.getInt("id_colaborador");
            usuario = new Usuario();
            usuario.setNome(login);
            usuario.setId(id_rule);
            usuario.setId_colaborador(id_colaborador);

        }
        return usuario;
    }
}
