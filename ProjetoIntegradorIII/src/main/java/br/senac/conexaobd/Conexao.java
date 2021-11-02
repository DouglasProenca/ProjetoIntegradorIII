package br.senac.conexaobd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 20/10/2021
 * @author Douglas Proença
 */
public class Conexao {

    public Conexao() {
    }

    public static Connection abrirConexao() throws ClassNotFoundException, SQLException {
        String STATUS = "Não conectado";
        String DRIVER = "com.mysql.cj.jdbc.Driver"; 
        String SERVER = "localhost";
        String DATABASE = "projetointegrador3";           
        String LOGIN = "root";                         
        String SENHA = "20052016Pi3";                    
        String URL = "";
        Connection CONEXAO = null;

        URL = "jdbc:mysql://" + SERVER + ":3306/" + DATABASE + "?useTimezone=true&serverTimezone=UTC&useSSL=false";

        if (CONEXAO == null) {
            try {

                //Carrega a classe responsável pelo driver
                Class.forName(DRIVER);
                CONEXAO = DriverManager.getConnection(URL, LOGIN, SENHA);

                if (CONEXAO != null) {
                    STATUS = "Conexão realizada com sucesso!";
                } else {
                    STATUS = "Não foi possivel realizar a conexão";
                }

            } catch (ClassNotFoundException e) {  //Driver não encontrado

                throw new ClassNotFoundException("O driver expecificado nao foi encontrado.");

            } catch (SQLException e) {  //Erro ao estabelecer a conexão (Ex: login ou senha errados)

                //Outra falha de conexão
                throw new SQLException("Erro ao estabelecer a conexão (Ex: login ou senha errados).");
            }

        } else {
            try {
                //Se a conexão estiver fechada, reabro a conexão
                if (CONEXAO.isClosed()) {
                    CONEXAO = DriverManager.getConnection(URL, LOGIN, SENHA);
                }
            } catch (SQLException ex) {
                throw new SQLException("Falha ao fechar a conexão.");
            }
        }
        return CONEXAO;
    }
}
