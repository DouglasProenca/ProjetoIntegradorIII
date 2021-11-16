<%-- 
    Document   : listar
    Created on : 01/11/2021, 16:06:22
    Author     : Douglas
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="/css/estilo.css">
        <title>Listar colaboradores</title>
        <script type="text/javascript">
            var colaboradorRemocao;
            function confirmarRemocao(nome, id) {
                console.log("Confirmar exclusao ", nome, id);
                idColaborador = id;
                var paragrafoCliente = $("#campoTextoExclusao");
                paragrafoCliente.html(nome + " - " + id);

                var modalConfirmacao = $("#modalExclusao");
                modalConfirmacao.show();
            }

            function fecharModal() {
                var modalConfirmacao = $("#modalExclusao");
                modalConfirmacao.hide();
            }

            function deletar() {
                console.log("Excluindo colaborador(a) ", idColaborador);
                fecharModal();
                var url = "../protegido/cliente/CadastroColaboradorServlet?id=" + idColaborador;
                $.ajax(url).done(function () {
                    console.log("Colaborador(a) removido!");
                    var alerta = $("#alerta");
                    alerta.css("display", "block");
                    setTimeout(function () {
                        alerta.css("display", "none");
                        location.reload();
                    }, 1000)
                }).fail(function () {
                    console.log("Erro ao remover o colaborador!");
                })
            }
        </script>
    </head>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <div id="alerta" class="alert alert-success" role="alert" style="display:none">
            Colaborador(a) removido(a) com sucesso!
        </div>
        <br>
        <br>
        <br>
        <h1><center>Colaboradores</center></h1>
        <br>
        <div class="modal" tabindex="-1" role="dialog" id="modalExclusao">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Confirmar Exclusão</h5>                       
                    </div>
                    <div class="modal-body">
                        <p>Confirmar exclusão de colaborador abaixo?</p>
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
        <table class="table" aling="center">
            <thead>
            <td>empr_id</td><td>ID</td><td>Nome</td><td>Cargo</td><td>Setor</td><td>Salário</td><td>Data de admissão</td>
            </thead>
            <tbody>
                <c:forEach var="colaborador" items="${listaColaboradores}">
                    <tr>
                        <td>${colaborador.empr_id}</td>
                        <td>${colaborador.id}</td>
                        <td>${colaborador.nome}</td>
                        <td>${colaborador.cargo}</td>
                        <td>${colaborador.setor}</td>
                        <td>${colaborador.salario}</td>
                        <td>${colaborador.data_ingresso}</td>                           
                        <td><a href="../protegido/cliente/CadastroColaboradorServlet?id=${colaborador.id}&ope=1" >Atualizar</a></td>
                        <td><button onclick="confirmarRemocao('${colaborador.nome}', '${colaborador.id}')" class="btn btn-link">Deletar</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </fildset>
</body>
<a href="${pageContext.request.contextPath}/protegido/index.jsp">Voltar</a>
</html>
