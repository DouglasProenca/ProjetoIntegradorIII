package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Douglas
 */
public class UsuarioDAO {

    public static Usuario getUsuario(String login, String senha) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.abrirConexao();
        Usuario usuario = null;
        String query = "select p.id_filial,u.id,p.nome,p.categoria,u.senha,p.id "
                + "                from rc_usuario u \n"
                + "                inner join rc_cargo p\n"
                + "                on u.id_cargo = p.id\n"
                + "                where p.nome = ? and u.senha = ?;";

        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, login);
        ps.setString(2, senha);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            int id_rule = rs.getInt("id");
            int id_colaborador = rs.getInt("id");
            String categoria = rs.getString("categoria");
            int id_filial = rs.getInt("id_filial");
            usuario = new Usuario();
            usuario.setNome(login);
            usuario.setId(id_rule);
            usuario.setId_colaborador(id_colaborador);
            usuario.setSetor(categoria);
            usuario.setEmpr_id(id_filial);
        }
        return usuario;
    }
}
