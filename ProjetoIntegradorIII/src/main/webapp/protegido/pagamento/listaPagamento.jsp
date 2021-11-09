<%-- 
    Document   : listaPagamento
    Created on : 01/11/2021, 16:10:49
    Author     : Douglas
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Lista Pagamentos</title>
        <script type="text/javascript">
            var turmaRemocao;
            function confirmarRemocao(pagamento, id) {
                console.log("Confirmar exclusao ", pagamento, id);
                idPagamento = id;
                var paragrafoCliente = $("#campoTextoExclusao");
                paragrafoCliente.html(pagamento + " - " + idPagamento);

                var modalConfirmacao = $("#modalExclusao");
                modalConfirmacao.show();
            }

            function fecharModal() {
                var modalConfirmacao = $("#modalExclusao");
                modalConfirmacao.hide();
            }

            function deletar() {
                console.log("Excluindo Pagamento ", idPagamento);
                fecharModal();
                var url = "../protegido/cliente/CadastroPagamentoServlet?idPagamento=" + idPagamento;
                $.ajax(url).done(function () {
                    console.log("Pagamento removido!");
                    var alerta = $("#alerta");
                    alerta.css("display", "block");
                    setTimeout(function () {
                        alerta.css("display", "none");
                        location.reload();
                    }, 1000)
                }).fail(function () {
                    console.log("Erro ao remover o pagamento!");
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
        <h1><center>Pagamento</center></h1>
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
        <table class="table-bordered" aling="center" border="2px" width="80%">
            <thead>
            <td>ID</td><td>Nome</td><td>juros</td><td>Forma Pagamento</td><td>Valor Pago</td><td>Data Pagamento</td><td>Ano Ref.</td><td>Mês Ref.</td>
            </thead>
            <tbody>
                <c:forEach var="pagamento" items="${listaPagamento}">
                    <tr>
                        <td>${pagamento.id}</td>
                        <td>${pagamento.nome}</td>
                        <td>${pagamento.juros}</td>
                        <td>${pagamento.forma_pagamento}</td>
                        <td>${pagamento.valor_pago}</td>
                        <td>${pagamento.dt_pagamento}</td>
                        <td>${pagamento.ano_ref}</td>    
                        <td>${pagamento.mes_ref}</td>   
                        <td><a href="../cliente/CadastroPagamentoServlet?idPagamento=${pagamento.id}&ope=1" >Atualizar</a></td>
                        <td><button onclick="confirmarRemocao('${pagamento.nome}', '${pagamento.id}')" class="btn btn-link">Deletar</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </fildset>
</body>
<a href="${pageContext.request.contextPath}/protegido/index.jsp">Voltar</a>
</html>
