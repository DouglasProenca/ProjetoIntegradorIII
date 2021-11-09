package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.FilialDAO;
import br.senac.conexaobd.entidades.Filial;
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
@WebServlet(name = "CadastroFilialServlet", urlPatterns = {"/protegido/cliente/CadastroFilialServlet"})
public class CadastroFilialServlet extends HttpServlet {

      @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String ope = request.getParameter("ope");
            // Passo 1 - Recuperar os parametros
            String rua = request.getParameter("rua");
            String numero = request.getParameter("numero");
            String bairro = request.getParameter("bairro");
            String cidade = request.getParameter("cidade");
            String cep = request.getParameter("CEP");
            String uf = request.getParameter("uf");
            String dt_admissao = request.getParameter("admissaoColaborador");
            String colaborador = request.getParameter("Colaborador");
            String empr = request.getParameter("empr");
            
            // Passo 2 - Inserir no BD
            Filial filial = new Filial();
            filial.setRua(rua);
            filial.setNumero(numero);
            filial.setBairro(bairro);
            filial.setCidade(cidade);
            filial.setCep(cep);
            filial.setUf(uf);
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Date dt_lc = sdf.parse(dt_admissao);
            filial.setData_lançamento(dt_lc);
            filial.setId_colaborador(Integer.parseInt(colaborador));

            try {
                // ope = 1 => Update
                if ("1".equals(ope)) {
                    try {
                        FilialDAO.atualizarFilial(filial);
                    } catch (ClassNotFoundException ex) {
                        //Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
                        System.out.println(ex);
                    }
                } else {
                    FilialDAO.inserirFilial(filial);
                }
                response.sendRedirect(request.getContextPath() + "/protegido/uteis/sucesso.jsp");
            } catch (SQLException ex) {
                response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
            }
        } catch (ParseException ex) {
              response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
              Logger.getLogger(CadastroFilialServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("idFilial");
        String ope = req.getParameter("ope");
        //OPE = 1 => Atualização
        if ("1".equals(ope)) {
            try {
                Filial filial = FilialDAO.getFilialPorID(id);
                req.setAttribute("filialAtualizacao", filial);
                req.getRequestDispatcher("/protegido/filial/cadastroFilial.jsp").forward(req, resp);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                FilialDAO.deletarFilial(id);
                resp.sendRedirect(req.getContextPath() + "/cliente/ListarFilialServlet");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CadastroFilialServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(CadastroFilialServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}
