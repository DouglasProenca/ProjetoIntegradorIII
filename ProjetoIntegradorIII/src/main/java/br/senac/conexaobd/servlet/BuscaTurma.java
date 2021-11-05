package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.TurmaDAO;
import br.senac.conexaobd.entidades.Turma;
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
@WebServlet(name = "BuscaTurma", urlPatterns = {"/protegido/cliente/BuscaTurma"})
public class BuscaTurma extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nomeTurma = request.getParameter("nomeTurma");
        List<Turma> turmas = null;
        try {
            turmas = TurmaDAO.getTurmaPorNome(nomeTurma);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(BuscaFilial.class.getName()).log(Level.SEVERE, null, ex);
        }
        String jsonTurmas = new Gson().toJson(turmas);
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        pw.write(jsonTurmas);
    }

}
