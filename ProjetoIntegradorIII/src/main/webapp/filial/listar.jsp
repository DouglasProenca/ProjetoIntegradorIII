<%-- 
    Document   : cadastro
    Created on : 17/09/2021, 21:00:14
    Author     : tiago.bscarton
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="/css/estilo.css">
        <title>Listar de Clientes</title>
        <script type="text/javascript">
            var cpfRemocao;
            function confirmarRemocao(nome, CPF) {
                console.log("Confirmar exclusao ", nome, CPF);
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
                var url = "CadastroClienteServlet?cpfUsuario=" + cpfRemocao;
                $.ajax(url).done(function () {
                    console.log("Cliente removido!");
                    var alerta = $("#alerta");
                    alerta.css("display", "block");
                    setTimeout(function () {
                        alerta.css("display", "none");
                        location.reload();
                    }, 1000)
                }).fail(function () {
                    console.log("Erro ao remover o cliente!");
                })
            }

        </script>
    </head>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
            <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"></path>
            </svg>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Ligar navegacao">
            <span class="navbar-toggler-icon"></span>
        </button>
    </nav>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <div id="alerta" class="alert alert-success" role="alert" style="display:none">
            Cliente removido com sucesso!
        </div>
        <br>
        <h1><center>Filiais</center></h1>
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
        <table class="table-bordered" aling="center" border="2px" width="80%">
            <thead>
            <td>Nome</td><td>Rua</td><td>Numero</td><td>Bairro</td><td>Cidade</td><td>UF</td>
            </thead>
            <tbody>
                <c:forEach var="filial" items="${listaFiliais}">
                    <tr>
                        <td>${filial.nome}</td>
                        <td>${filial.rua}</td>
                        <td>${filial.numero}</td>
                        <td>${filial.bairro}</td>
                        <td>${filial.cidade}</td>
                        <td>${filial.uf}</td>
                        <td><a href="CadastroClienteServlet?cpfUsuario=${cliente.CPF}&ope=1" >Atualizar</a></td>
                        <td><button onclick="confirmarRemocao('${cliente.nome}', '${cliente.CPF}')" class="btn btn-link">Deletar</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </fildset>
</body>
<a href="${pageContext.request.contextPath}/index.jsp">Voltar</a>
</html>
