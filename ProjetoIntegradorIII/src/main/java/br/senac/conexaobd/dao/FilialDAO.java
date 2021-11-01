package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Filial;
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
 * 20/10/2021
 *
 * @author Douglas Proença
 */
public class FilialDAO {

    public static List<Filial> getFilial() throws ClassNotFoundException, SQLException {

        List<Filial> Filiais = new ArrayList<>();
        String query = "select * from rc_filial";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Filial filial = new Filial();
                int id = rs.getInt("empr_id");
                int id_colaborador = rs.getInt("id_colaborador");
                String uf = rs.getString("uf");
                String rua = rs.getString("rua");
                String bairro = rs.getString("bairro");
                String numero = rs.getString("numero");
                String cidade = rs.getString("cidade");
                String CEP = rs.getString("CEP");
                Date data_lançamento = rs.getDate("data_lançamento");

                filial.setEmpr_id(id);
                filial.setRua(rua);
                filial.setBairro(bairro);
                filial.setNumero(numero);
                filial.setCidade(cidade);
                filial.setCep(CEP);
                filial.setUf(uf);
                filial.setId_colaborador(id_colaborador);
                filial.setData_lançamento(data_lançamento);
                Filiais.add(filial);
            }

        } catch (SQLException ex) {
            Logger.getLogger(FilialDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return Filiais;

    }

    public static Filial getFilialPorID(String idFilial) throws ClassNotFoundException, SQLException {
        Filial filial = null;
        String query = "select empr_id,rua,numero,bairro,cidade,cep,uf,"
                + "id_colaborador,data_lançamento from rc_filial where empr_id =?";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, idFilial);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                filial = new Filial();
                int id = rs.getInt("empr_id");
                int id_colaborador = rs.getInt("id_colaborador");
                String uf = rs.getString("uf");
                String rua = rs.getString("rua");
                String cidade = rs.getString("Cidade");
                String bairro = rs.getString("bairro");
                String numero = rs.getString("numero");
                String CEP = rs.getString("CEP");
                Date data_ = rs.getDate("data_lançamento");
                filial.setEmpr_id(id);
                filial.setRua(rua);
                filial.setBairro(bairro);
                filial.setNumero(numero);
                filial.setCidade(cidade);
                filial.setCep(CEP);
                filial.setUf(uf);
                filial.setId_colaborador(id_colaborador);
                filial.setData_lançamento(data_);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return filial;
    }

    public static void inserirFilial(Filial filial) throws SQLException {
        try {
            boolean ok = true;
            String query = "insert into rc_filial values (null,?,?,?,?,?,?,1,'2021-09-09')";
            Connection con = Conexao.abrirConexao();
            PreparedStatement ps;
            ps = con.prepareStatement(query);
            ps.setString(1, filial.getRua());
            ps.setString(2, filial.getNumero());
            ps.setString(3, filial.getBairro());
            ps.setString(4, filial.getCidade());
            ps.setString(5, filial.getCep());
            ps.setString(6, filial.getUf());
            ps.execute();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static boolean atualizarFilial(Filial filial) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "update rc_filial rua=?,numero=?,bairro=?, "
                + "cidade=?,CEP=? where empr_id=?";
        Connection con = Conexao.abrirConexao();
        try {
           PreparedStatement ps = con.prepareStatement(query);
            ps.setString(2, filial.getRua());
            ps.setString(3, filial.getNumero());
            ps.setString(4, filial.getBairro());
            ps.setString(5, filial.getCidade());
            ps.setString(6, filial.getCep());
            ps.setInt(8, filial.getEmpr_id());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
            ok = false;
            System.out.println(ex);
        }
        return ok;
    }
    
    public static boolean deletarFilial(String id) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "delete from rc_filial where empr_id=?";
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
    
     public static List<Filial> getFilialPorNome(String nomeParam) throws ClassNotFoundException, SQLException {
       nomeParam = nomeParam.toUpperCase();
       List<Filial> Filiais = new ArrayList<>();
       String query = "select * from rc_filial where nome like ?";
       
       Connection con = Conexao.abrirConexao(); 
       try {
           PreparedStatement ps = con.prepareStatement(query);
           ps.setString(1, nomeParam+"%");
           ResultSet rs = ps.executeQuery();
           while (rs.next()) {
               Filial filial = new Filial();
                int id = rs.getInt("empr_id");
                int id_colaborador = rs.getInt("id_colaborador");
                String uf = rs.getString("uf");
                String rua = rs.getString("rua");
                String bairro = rs.getString("bairro");
                String numero = rs.getString("numero");
                String cidade = rs.getString("cidade");
                String CEP = rs.getString("CEP");
                Date data_ = rs.getDate("data_lançamento");

                filial.setEmpr_id(id);
                filial.setRua(rua);
                filial.setBairro(bairro);
                filial.setNumero(numero);
                filial.setCidade(cidade);
                filial.setCep(CEP);
                filial.setUf(uf);
                filial.setId_colaborador(id_colaborador);
                filial.setData_lançamento(data_);
                Filiais.add(filial);
           }
       } catch (SQLException ex) {
           Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
       return Filiais;
       
   }
}
