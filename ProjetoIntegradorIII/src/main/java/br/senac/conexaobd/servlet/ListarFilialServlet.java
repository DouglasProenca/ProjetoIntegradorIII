package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.FilialDAO;
import br.senac.conexaobd.entidades.Filial;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Douglas
 */
public class ListarFilialServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          try {
              List<Filial> Filiais = FilialDAO.getFilial();
              request.setAttribute("listaFiliais", Filiais);
              // RequestDispatcher reaproveita os objetos Request e Response
              String url = "/protegido/filial/listar.jsp";
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
