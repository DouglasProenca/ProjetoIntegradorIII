/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.FilialDAO;
import br.senac.conexaobd.entidades.Filial;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "CadastroFilialServlet", urlPatterns = {"/cliente/CadastroFilialServlet"})
public class CadastroFilialServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     */
     // @Override
   /* protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ope = request.getParameter("ope");
        // Passo 1 - Recuperar os parametros
        String nome = request.getParameter("nomeCliente");
        String email = request.getParameter("emailCliente");
        String cpf = request.getParameter("CPFCliente");
        String celularCliente = request.getParameter("CelularCliente");
        String residencial = request.getParameter("ResidencialCliente");
        String comercial = request.getParameter("TelefoneComercial");
        String dataNasc = request.getParameter("DataNascimento");
        String sexo = request.getParameter("sexo");
        String estadoCivil = request.getParameter("EstadoCivil");
        String obs = request.getParameter("observacao");

        // Passo 2 - Inserir no BD
        Filial cliente = new Filial();
        cliente.setNome(nome);
        cliente.setCPF(cpf);
        cliente.setEmail(email);
        cliente.setCelular(celularCliente);
        cliente.setTelResidencial(residencial);
        cliente.setTelComercial(comercial);
        //cliente.setDataNascimento(dataNasc);
        cliente.setSexo(sexo);
        cliente.setEstadoCivil(estadoCivil);
        cliente.setObs(obs);
        
        try {
            // ope = 1 => Update
            if ("1".equals(ope)) {
                try {
                    FilialDAO.atualizarCliente(cliente);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                ClienteDAO.inserirCliente(cliente);
            }
            response.sendRedirect(request.getContextPath() + "/uteis/sucesso.jsp");
        } catch (SQLException ex) {
            response.sendRedirect(request.getContextPath() + "/uteis/erro.jsp");
        }
    }*/

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cpf = req.getParameter("idFilial");
        String ope = req.getParameter("ope");
        //OPE = 1 => Atualização
        if ("1".equals(ope)) {
            try {
                Filial filial = FilialDAO.getFilialPorID(cpf);
                req.setAttribute("filialAtualizacao", filial);
                req.getRequestDispatcher("/filial/cadastroFilial.jsp").forward(req, resp);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            //FilialDAO.deletarCliente(cpf);
            resp.sendRedirect(req.getContextPath() + "/cliente/ListarClienteServlet");
            resp.sendRedirect(req.getContextPath() + "/cliente/BuscarClienteServlet");
        }

    }

}
