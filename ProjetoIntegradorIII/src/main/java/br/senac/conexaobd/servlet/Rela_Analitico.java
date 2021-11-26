package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.RelatoriosDAO;
import br.senac.conexaobd.entidades.Relatorios;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
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
@WebServlet(name = "Rela_Analitico", urlPatterns = {"/protegido/cliente/Rela_Analitico"})
public class Rela_Analitico extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String dados = request.getParameter("dados");    

            List<Relatorios> relatorioAnali = null;
            try {
                relatorioAnali = RelatoriosDAO.gerar_rel_analitico(dados);
            } catch (ClassNotFoundException | SQLException ex) {
                response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
                Logger.getLogger(BuscaFilial.class.getName()).log(Level.SEVERE, null, ex);
            }
            String jsonAnalitico = new Gson().toJson(relatorioAnali);
            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();
            pw.write(jsonAnalitico);
    }
}
