<%-- 
    Document   : ListarTurma
    Created on : 01/11/2021, 16:19:44
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
        <title>Listar turmas</title>
        <script type="text/javascript">
            var turmaRemocao;
            function confirmarRemocao(turma, id) {
                console.log("Confirmar exclusao ", turma, id);
                idTurma = id;
                var paragrafoCliente = $("#campoTextoExclusao");
                paragrafoCliente.html(turma + " - " + id);

                var modalConfirmacao = $("#modalExclusao");
                modalConfirmacao.show();
            }

            function fecharModal() {
                var modalConfirmacao = $("#modalExclusao");
                modalConfirmacao.hide();
            }

            function deletar() {
                console.log("Excluindo Turma ", idTurma);
                fecharModal();
                var url = "../protegido/cliente/CadastroTurmaServlet?idTurma=" + idTurma;
                $.ajax(url).done(function () {
                    console.log("Turma removida!");
                    var alerta = $("#alerta");
                    alerta.css("display", "block");
                    setTimeout(function () {
                        alerta.css("display", "none");
                        location.reload();
                    }, 1000)
                }).fail(function () {
                    console.log("Erro ao remover a Turma!");
                })
            }
        </script>
    </head>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <div id="alerta" class="alert alert-success" role="alert" style="display:none">
            Turma removida com sucesso!
        </div>
        <br>
        <br>
        <br>
        <h1><center>Turmas</center></h1>
        <br>
        <div class="modal" tabindex="-1" role="dialog" id="modalExclusao">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Confirmar Exclusão</h5>                       
                    </div>
                    <div class="modal-body">
                        <p>Confirmar exclusão da turma abaixo?</p>
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
            <td>empr_id</td><td>ID</td><td>Turma</td><td>Data de inicio</td><td>Data de conclusão</td><td>Valor curso</td>
            </thead>
            <tbody>
                <c:forEach var="turma" items="${listaTurma}">
                    <tr>
                        <td>${turma.empr_id}</td>
                        <td>${turma.id}</td>
                        <td>${turma.nome}</td>
                        <td>${turma.data_inicio}</td>
                        <td>${turma.data_fim}</td>
                        <td>${turma.valor}</td>                        
                        <td><a href="../protegido/cliente/CadastroTurmaServlet?idTurma=${turma.id}&ope=1" >Atualizar</a></td>
                        <td><button onclick="confirmarRemocao('${turma.nome}', '${turma.id}')" class="btn btn-link">Deletar</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </fildset>
</body>
<a href="${pageContext.request.contextPath}/protegido/index.jsp">Voltar</a>
</html>
