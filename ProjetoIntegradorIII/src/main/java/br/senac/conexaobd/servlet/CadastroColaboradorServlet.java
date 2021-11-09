package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.ColaboradorDAO;
import br.senac.conexaobd.entidades.Colaborador;
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
@WebServlet(name = "CadastroColaboradorServlet", urlPatterns = {"/protegido/cliente/CadastroColaboradorServlet"})
public class CadastroColaboradorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String ope = request.getParameter("ope");
            // Passo 1 - Recuperar os parametros
            String nome = request.getParameter("nomeColaborador");
            String cargo = request.getParameter("cargoColaborador");
            String setor = request.getParameter("categoria");
            String salario = request.getParameter("salarioColaborador");
            String admissao = request.getParameter("admissaoColaborador");
            String idcolaborador = request.getParameter("Colaborador");
            String empr = request.getParameter("empr");

            // Passo 2 - Inserir no BD
            Colaborador colaborador = new Colaborador();
            colaborador.setNome(nome);
            colaborador.setCargo(cargo);
            colaborador.setSetor(setor);
            colaborador.setSalario(Float.parseFloat(salario));
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Date dt_admissão = sdf.parse(admissao);
            colaborador.setData_ingresso(dt_admissão);
            colaborador.setId_colaborador(Integer.parseInt(idcolaborador));
            colaborador.setEmpr_id(Integer.parseInt(empr));

            try {
                // ope = 1 => Update
                if ("1".equals(ope)) {
                    try {
                        ColaboradorDAO.atualizarColaborador(colaborador);
                    } catch (ClassNotFoundException ex) {
                        //Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
                        System.out.println(ex);
                    }
                } else {
                    ColaboradorDAO.inserirColaborador(colaborador);
                }
                response.sendRedirect(request.getContextPath() + "/protegido/uteis/sucesso.jsp");
            } catch (SQLException ex) {
                response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
            }
        } catch (ParseException ex) {
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
            Logger.getLogger(CadastroColaboradorServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String ope = req.getParameter("ope");
        //OPE = 1 => Atualização
        if ("1".equals(ope)) {
            try {
                Colaborador colaborador = ColaboradorDAO.getFilialPorID(id);
                req.setAttribute("colaboradorAtualizacao", colaborador);
                req.getRequestDispatcher("/protegido/colaboradores/cadastroColaborador.jsp").forward(req, resp);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                ColaboradorDAO.deletarColaborador(id);
                resp.sendRedirect(req.getContextPath() + "/cliente/ListarFilialServlet");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CadastroFilialServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(CadastroFilialServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}
