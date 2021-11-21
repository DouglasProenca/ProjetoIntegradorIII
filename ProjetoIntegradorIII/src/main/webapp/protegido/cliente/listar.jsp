<%-- 
    Document   : cadastro
    Created on : 20/10/2021, 21:00:14
    Author     : Douglas Proença
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Lista de Pessoas</title>
        <script type="text/javascript">
            var cpfRemocao;
            function confirmarRemocao(nome, CPF) {
                console.log("Confirmar exclusao", nome, CPF);
                cpfRemocao = CPF;
                var paragrafoCliente = $("#campoTextoExclusao");
                paragrafoCliente.html(nome + " - " + CPF);
                
                var modalConfirmacao = $("#modalExclusao");
                modalConfirmacao.show();
            }
            
            function fecharModal() {
                var modalConfirmacao = $("#modalExclusao");
                modalConfirmacao.hide();
            }

            function deletar() {
                console.log("Excluindo cliente ", cpfRemocao);
                fecharModal();
                var url = "../protegido/cliente/CadastroClienteServlet?CPFUsuario=" + cpfRemocao;
                $.ajax(url).done(function () {
                    console.log("Cliente removido!");
                    var alerta = $("#alerta");
                    alerta.css("display", "block");
                    setTimeout(function(){
                         alerta.css("display", "none");
                         location.reload();
                    }, 1000)
                }).fail(function () {
                    console.log("Erro ao remover o cliente!");
                })
            }

        </script>
    </head>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <div id="alerta" class="alert alert-success" role="alert" style="display:none">
           Cliente removido com sucesso!
        </div>
        <br>
        <br>
        <br>
        <h1><center>Todos Os Alunos</center></h1>
        <br>
        <div class="modal" tabindex="-1" role="dialog" id="modalExclusao">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Confirmar Exclusão</h5>                       
                    </div>
                    <div class="modal-body">
                        <p>Confirmar exclusão do usuário abaixo?</p>
                        <p id="campoTextoExclusao"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="fecharModal()">Cancelar</button>
                        <button type="button" class="btn btn-primary" onclick="deletar()">Confirmar</button>
                    </div>
                </div>
            </div>
        </div>
    <fildset>
        <table class="table-bordered" aling="left" border="2px" width="100%">
            <thead>
            <td>Nome</td><td>Email</td><td>CPF</td><td>Sexo</td><td>Celular</td><td>Fixo</td>
        </thead>
        <tbody>
            <c:forEach var="cliente" items="${listaClientes}">
                <tr>
                    <td>${cliente.nome}</td>
                    <td>${cliente.email}</td>
                    <td>${cliente.CPF}</td>
                    <td>${cliente.sexo}</td>
                    <td>${cliente.celular}</td>
                    <td>${cliente.telResidencial}</td>
                    <td><a href="../protegido/cliente/CadastroClienteServlet?CPFUsuario=${cliente.CPF}&ope=1" >Atualizar</a></td>
                    <td><button onclick="confirmarRemocao('${cliente.nome}', '${cliente.CPF}')" class="btn btn-link">Deletar</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</fildset>
</body>
<a href="${pageContext.request.contextPath}/protegido/index.jsp">Voltar</a>
</html>
