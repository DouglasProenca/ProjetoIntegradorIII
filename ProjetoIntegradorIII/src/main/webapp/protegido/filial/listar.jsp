<%-- 
    Document   : Lista Filial
    Created on : 17/09/2021, 21:00:14
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
        <title>Lista de Filiais</title>
        <script type="text/javascript">
            var cpfRemocao;
            function confirmarRemocao(cidade, empr_id) {
                console.log("Confirmar exclusao ", cidade, empr_id);
                idFilial = empr_id;
                var paragrafoCliente = $("#campoTextoExclusao");
                paragrafoCliente.html(cidade + " - " + empr_id);

                var modalConfirmacao = $("#modalExclusao");
                modalConfirmacao.show();
            }

            function fecharModal() {
                var modalConfirmacao = $("#modalExclusao");
                modalConfirmacao.hide();
            }

            function deletar() {
                console.log("Excluindo Filial ", idFilial);
                fecharModal();
                var url = "../protegido/cliente/CadastroFilialServlet?idFilial=" + idFilial;
                $.ajax(url).done(function () {
                    console.log("Filial removida!");
                    var alerta = $("#alerta");
                    alerta.css("display", "block");
                    setTimeout(function () {
                        alerta.css("display", "none");
                        location.reload();
                    }, 1000)
                }).fail(function () {
                    console.log("Erro ao remover a Filial!");
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
        <table class="table" aling="center">
            <thead>
            <td>ID</td><td>Rua</td><td>Numero</td><td>Bairro</td><td>Cidade</td><td>UF</td>
            </thead>
            <tbody>
                <c:forEach var="filial" items="${listaFiliais}">
                    <tr>
                        <td>${filial.empr_id}</td>
                        <td>${filial.rua}</td>
                        <td>${filial.numero}</td>
                        <td>${filial.bairro}</td>
                        <td>${filial.cidade}</td>
                        <td>${filial.uf}</td>
                        <td><a href="../protegido/cliente/CadastroFilialServlet?idFilial=${filial.empr_id}&ope=1" >Atualizar</a></td>
                        <td><button onclick="confirmarRemocao('${filial.cidade}', '${filial.empr_id}')" class="btn btn-link">Deletar</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </fildset>
</body>
<a href="${pageContext.request.contextPath}/protegido/index.jsp">Voltar</a>
</html>
