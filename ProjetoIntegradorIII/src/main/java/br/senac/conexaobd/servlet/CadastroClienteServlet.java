package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.ClienteDAO;
import br.senac.conexaobd.entidades.Cliente;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Douglas Proença
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
        String sexo = request.getParameter("sexo");
        String colaborador = request.getParameter("Colaborador");
        String empr = request.getParameter("empr");

        // Passo 2 - Inserir no BD
        Cliente cliente = new Cliente();
        cliente.setNome(nome);
        cliente.setCPF(cpf);
        cliente.setEmail(email);
        cliente.setCelular(celularCliente);
        cliente.setTelResidencial(residencial);
        cliente.setId_colaborador(Integer.parseInt(colaborador));
        cliente.setSexo(sexo);
        cliente.setEmpr_id(Integer.parseInt(empr));

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
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/sucesso.jsp");
        } catch (SQLException ex) {
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cpf = req.getParameter("CPFUsuario");
        String ope = req.getParameter("ope");
        //OPE = 1 => Atualização
        System.out.println(ope);
        if ("1".equals(ope)) {
            try {
                Cliente cliente = ClienteDAO.getClientePorCPF(cpf);
                req.setAttribute("clienteAtualizacao", cliente);
                req.getRequestDispatcher("/protegido/cliente/cadastro.jsp").forward(req, resp);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                ClienteDAO.deletarCliente(cpf);
                resp.sendRedirect(req.getContextPath() + "/cliente/ListarClienteServlet");

                //resp.sendRedirect(req.getContextPath() + "/cliente/BuscarClienteServlet");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);

            } catch (SQLException ex) {
                Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);

            }
        }

    }

}
