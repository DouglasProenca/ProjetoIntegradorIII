package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.PagamentoDAO;
import br.senac.conexaobd.entidades.Pagamento;
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
@WebServlet(name = "CadastroPagamentoServlet", urlPatterns = {"/protegido/cliente/CadastroPagamentoServlet"})
public class CadastroPagamentoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String ope = request.getParameter("ope");
            // Passo 1 - Recuperar os parametros
            String id = request.getParameter("id");
            String id_matricula = request.getParameter("id_matricula");
            String ano_ref = request.getParameter("ano_ref");
            String mes_ref = request.getParameter("mes_ref");
            String dt_pag = request.getParameter("dataPagamento");
            String juros = request.getParameter("juros");
            String Forma_pagamento = request.getParameter("formaPagamento");
            String valor_pago = request.getParameter("valorPago");
            String colaborador = request.getParameter("Colaborador");

            // Passo 2 - Inserir no BD
            Pagamento pagamento = new Pagamento();
            pagamento.setId(Integer.parseInt(id));
            pagamento.setId_matricula(Integer.parseInt(id_matricula));
            pagamento.setAno_ref(ano_ref);
            pagamento.setMes_ref(mes_ref);
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Date data_pagamento = sdf.parse(dt_pag);
            pagamento.setDt_pagamento(data_pagamento);
            pagamento.setJuros(Float.parseFloat(juros));
            pagamento.setForma_pagamento(Forma_pagamento);
            pagamento.setValor_pago(Float.parseFloat(valor_pago));
            pagamento.setId_colaborador(Integer.parseInt(colaborador));
            
            // ope = 1 => Update
            if ("1".equals(ope)) {
                try {
                    PagamentoDAO.atualizarPagamento(pagamento);
                } catch (ClassNotFoundException ex) {
                    //Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
                    System.out.println(ex);
                }
            } else {
                PagamentoDAO.inserirPagamento(pagamento);
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
        String id = req.getParameter("idPagamento");
        String ope = req.getParameter("ope");
        //OPE = 1 => Atualização
        if ("1".equals(ope)) {
            try {
                Pagamento pagamento = PagamentoDAO.getPagamentoPorID(id);
                req.setAttribute("pagamentoAtualizacao", pagamento);
                req.getRequestDispatcher("/protegido/pagamento/cadastroPagamento.jsp").forward(req, resp);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                PagamentoDAO.deletarPagamento(id);
                resp.sendRedirect(req.getContextPath() + "/cliente/ListarPagamentoServlet");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CadastroFilialServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(CadastroFilialServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}
