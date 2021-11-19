package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.ClienteDAO;
import br.senac.conexaobd.dao.MatriculaDAO;
import br.senac.conexaobd.dao.TurmaDAO;
import br.senac.conexaobd.entidades.Cliente;
import br.senac.conexaobd.entidades.Matricula;
import br.senac.conexaobd.entidades.Turma;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "CadastroMatriculaServlet", urlPatterns = {"/cliente/CadastroMatriculaServlet"})
public class CadastroMatriculaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Passo 1 - Recuperar os parametros
            String idCliente = request.getParameter("id_cliente");
            String idturma = request.getParameter("id_turma");
            String dt_matricula = request.getParameter("dt_matricula");
            String dia_venc = request.getParameter("Dia_venc");
            String sit = request.getParameter("situacao");
            String matricula_ = request.getParameter("matricula");
            String colaborador = request.getParameter("Colaborador");
            // Passo 2 - Inserir no BD
            Matricula matricula = new Matricula();
            matricula.setId(Integer.parseInt(idCliente));
            matricula.setId_turma(Integer.parseInt(idturma));
            matricula.setMatricula(matricula_);
            Date data_mat = new SimpleDateFormat("yyyy-MM-dd").parse(dt_matricula);
            matricula.setDt_matricula(data_mat);
            matricula.setDia_venc_mensalidade(Integer.parseInt(dia_venc));
            matricula.setAtivo(sit);
            matricula.setId_colaborador(Integer.parseInt(colaborador));

            MatriculaDAO.inserirMatricula(matricula);

            response.sendRedirect(request.getContextPath() + "/protegido/uteis/sucesso.jsp");
        } catch (SQLException ex) {
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
            Logger.getLogger(CadastroMatriculaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
            Logger.getLogger(CadastroMatriculaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Cliente> clientes = ClienteDAO.getClientes();
            request.setAttribute("listaClientes", clientes);
            List<Turma> TurmaList = TurmaDAO.getTurma();
            request.setAttribute("listaTurma", TurmaList);
            // RequestDispatcher reaproveita os objetos Request e Response
            String url = "/protegido/turma/matricularAluno.jsp";
            request.getRequestDispatcher(url).forward(request, response);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ListarClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(ListarClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
        }
    }

}
