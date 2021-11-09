package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.ClienteDAO;
import br.senac.conexaobd.entidades.Cliente;
import java.io.IOException;
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
@WebServlet(name = "ListarClienteServlet", urlPatterns = {"/protegido/cliente/ListarClienteServlet"})
public class ListarClienteServlet extends HttpServlet {

    

      @Override   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          try {
              List<Cliente> clientes = ClienteDAO.getClientes();
              request.setAttribute("listaClientes", clientes);
              // RequestDispatcher reaproveita os objetos Request e Response
              String url = "/protegido/cliente/listar.jsp";
              request.getRequestDispatcher(url).forward(request, response);
              
              //sendRedirect sempre cria um novo request/response
              //response.sendRedirect("listar.jsp");
          } catch (ClassNotFoundException ex) {
              response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
              Logger.getLogger(ListarClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
          } catch (SQLException ex) {
              response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
              Logger.getLogger(ListarClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
          }
    }

   

}
