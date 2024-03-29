package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.TurmaDAO;
import br.senac.conexaobd.entidades.Turma;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "CadastroTurmaServlet", urlPatterns = {"/protegido/cliente/CadastroTurmaServlet"})
public class CadastroTurmaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String ope = request.getParameter("ope");
            // Passo 1 - Recuperar os parametros
            String nome = request.getParameter("nomeTurma");
            String dt_ini = request.getParameter("inicioCliente");
            String dt_fim = request.getParameter("conclusaoCliente");
            String valor = request.getParameter("valorCliente");
            String colaborador = request.getParameter("Colaborador");
            String empr = request.getParameter("empr");
            String id = request.getParameter("id");
            // Passo 2 - Inserir no BD
            Turma turma = new Turma();
            turma.setNome(nome);
            Date data_inicial = new SimpleDateFormat("yyyy-MM-dd").parse(dt_ini);
            Date data_final = new SimpleDateFormat("yyyy-MM-dd").parse(dt_fim);
            turma.setData_inicio(data_inicial);
            turma.setData_fim(data_final);
            turma.setValor(Float.parseFloat(valor));
            turma.setId_colaborador(Integer.parseInt(colaborador));
            turma.setEmpr_id(Integer.parseInt(empr));
            
            if ("1".equals(ope)) {
            turma.setId(Integer.parseInt(id));
            }
            
            // ope = 1 => Update
            if ("1".equals(ope)) {
                try {
                    TurmaDAO.atualizarTurma(turma);
                } catch (ClassNotFoundException ex) {
                    System.out.println(ex);
                }
            } else {
                TurmaDAO.inserirTurma(turma);
            }
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/sucesso.jsp");
        } catch (ParseException ex) {
            Logger.getLogger(CadastroTurmaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CadastroTurmaServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("idTurma");
        String ope = req.getParameter("ope");
        //OPE = 1 => Atualização
        if ("1".equals(ope)) {
            try {
                Turma turma = TurmaDAO.getTurmaPorID(id);
                req.setAttribute("turmaAtualizacao", turma);
                req.getRequestDispatcher("/protegido/turma/cadastroTurma.jsp").forward(req, resp);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                TurmaDAO.deletarTurma(id);
                resp.sendRedirect(req.getContextPath() + "/cliente/ListarTurmaServlet");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CadastroFilialServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                
                Logger.getLogger(CadastroFilialServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}
