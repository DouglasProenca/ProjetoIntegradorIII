package br.senac.conexaobd.servlet;


import br.senac.conexaobd.dao.ColaboradorDAO;
import br.senac.conexaobd.entidades.Colaborador;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Douglas Proença
 */
@WebServlet(name = "BuscaColaborador", urlPatterns = {"/protegido/cliente/BuscaColaborador"})
public class BuscaColaborador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nomeCliente = request.getParameter("nomeColaborador");
        List<Colaborador> colaboradores = null;
        try {
            colaboradores = ColaboradorDAO.getColaboradorNome(nomeCliente);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(BuscaFilial.class.getName()).log(Level.SEVERE, null, ex);
        }
        String clientesJson = new Gson().toJson(colaboradores);
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        pw.write(clientesJson);
    }

}