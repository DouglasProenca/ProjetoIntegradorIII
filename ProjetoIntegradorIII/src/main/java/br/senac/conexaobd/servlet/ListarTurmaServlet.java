package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.TurmaDAO;
import br.senac.conexaobd.entidades.Turma;
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
@WebServlet(name = "ListarTurmaServlet", urlPatterns = {"/cliente/ListarTurmaServlet"})
public class ListarTurmaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Turma> TurmaList = TurmaDAO.getTurma();
            request.setAttribute("listaTurma", TurmaList);
            // RequestDispatcher reaproveita os objetos Request e Response
            String url = "/protegido/turma/listarTurma.jsp";
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
