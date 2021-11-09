package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.ClienteDAO;
import br.senac.conexaobd.dao.PagamentoDAO;
import br.senac.conexaobd.entidades.Cliente;
import br.senac.conexaobd.entidades.Pagamento;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Douglas
 */
@WebServlet(name = "CadastroPagamentoServlet", urlPatterns = {"/cliente/CadastroPagamentoServlet"})
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Cliente> clientes = ClienteDAO.getClientes();
            request.setAttribute("listaClientes", clientes);
            // RequestDispatcher reaproveita os objetos Request e Response
            String url = "/protegido/pagamento/cadastroPagamento.jsp";
            request.getRequestDispatcher(url).forward(request, response);


        } catch (ClassNotFoundException ex) {
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
            Logger.getLogger(ListarClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
            Logger.getLogger(ListarClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
