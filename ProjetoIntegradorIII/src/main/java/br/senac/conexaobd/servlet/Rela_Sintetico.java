package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.RelatoriosDAO;
import br.senac.conexaobd.entidades.Relatorios;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet(name = "Rela_Sintetico", urlPatterns = {"/protegido/cliente/Rela_Sintetico"})
public class Rela_Sintetico extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id_filial = request.getParameter("id_filial");

        String variaveis = id_filial;
        String array[] = new String[3];

        array = variaveis.split(",");

        String id_aux = array[0];
        String data_inicial = array[1];
        String data_final = array[2];
      
        try {
            Date dt_ini = new SimpleDateFormat("yyyy-MM-dd").parse(data_inicial);
            Date dt_fim = new SimpleDateFormat("yyyy-MM-dd").parse(data_final);
            int id = Integer.parseInt(id_aux);

            List<Relatorios> relatorioSinte = null;
            try {
                relatorioSinte = RelatoriosDAO.gerar_rel_sintetico(id, dt_ini, dt_fim);
            } catch (ClassNotFoundException | SQLException ex) {
                response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
                Logger.getLogger(BuscaFilial.class.getName()).log(Level.SEVERE, null, ex);
            }
            String jsonSintetico = new Gson().toJson(relatorioSinte);
            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();
            pw.write(jsonSintetico);
        } catch (ParseException ex) {
            Logger.getLogger(Relatorios.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
