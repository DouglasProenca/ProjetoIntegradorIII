package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.ClienteDAO;
import br.senac.conexaobd.entidades.Cliente;
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
@WebServlet(name = "BuscaCliente", urlPatterns = {"/cliente/BuscaCliente"})
public class BuscaCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nomeCliente = request.getParameter("nomeCliente");
        List<Cliente> clientes = null;
        try {
            clientes = ClienteDAO.getClientePorNome(nomeCliente);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(BuscaCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
        String clientesJson = new Gson().toJson(clientes);
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        pw.write(clientesJson);
    }

}
