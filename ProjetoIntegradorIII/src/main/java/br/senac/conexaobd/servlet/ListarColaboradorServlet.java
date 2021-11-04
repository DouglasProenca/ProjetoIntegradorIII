package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.ColaboradorDAO;
import br.senac.conexaobd.entidades.Colaborador;
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
 * @author Douglas
 */
@WebServlet(name = "ListarColaboradorServlet", urlPatterns = {"/cliente/ListarColaboradorServlet"})
public class ListarColaboradorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          try {
              List<Colaborador> Colaboradores = ColaboradorDAO.getColaborador();
              request.setAttribute("listaColaboradores", Colaboradores);
              // RequestDispatcher reaproveita os objetos Request e Response
              String url = "/protegido/colaboradores/listar.jsp";
              request.getRequestDispatcher(url).forward(request, response);
              
              //sendRedirect sempre cria um novo request/response
              //response.sendRedirect("listar.jsp");
          } catch (ClassNotFoundException ex) {
              Logger.getLogger(ListarClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
          } catch (SQLException ex) {
              Logger.getLogger(ListarClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
          }
    }
}
