package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.ClienteDAO;
import br.senac.conexaobd.entidades.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tiago.bscarton
 */
public class CadastroClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
        Cliente cliente = new Cliente();
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
                    ClienteDAO.atualizarCliente(cliente);
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
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cpf = req.getParameter("CPFUsuario");
        String ope = req.getParameter("ope");
        //OPE = 1 => Atualização
        if ("1".equals(ope)) {
            try {
                Cliente cliente = ClienteDAO.getClientePorCPF(cpf);
                req.setAttribute("clienteAtualizacao", cliente);
                req.getRequestDispatcher("/cliente/cadastro.jsp").forward(req, resp);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                ClienteDAO.deletarCliente(cpf);
                resp.sendRedirect(req.getContextPath() + "/cliente/ListarClienteServlet");
                resp.sendRedirect(req.getContextPath() + "/cliente/BuscarClienteServlet");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}
