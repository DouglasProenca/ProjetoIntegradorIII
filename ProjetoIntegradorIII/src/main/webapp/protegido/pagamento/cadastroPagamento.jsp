<%-- 
    Document   : cadastroPagamento
    Created on : 01/11/2021, 16:15:16
    Author     : Douglas
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
              crossorigin="anonymous" />
        <title>Cadastro Pagamento</title>
    </head>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <br>
        <br>
        <br>
        <h1><center>Realizar Pagamento</center></h1>
        <br>
        <br>
        <form class="col-md-6 offset-md-3 jumbotron" action="../cliente/CadastroPagamentoServlet" method="POST">

            <c:if test="${not empty pagamentoAtualizacao}">
                <input type="hidden" name="ope" value="1"/>
            </c:if>
            <div  class="form-group">
                <label>Nome</label>
                <input type="text" name="nome" value="${pagamentoAtualizacao.nome}"
                       required class="form-control"/><br/> 
            </div>
            <div class="form-group">
                <label>Data do Pagamento</label>
                <input type="date" name="dataPagamento" value="${pagamentoAtualizacao.dt_pagamento}"
                       required class="form-control"/><br/>
            </div>
            <div class="form-group">
                <label>Mês de Referência</label>
                <input type="number" name="mes_Ref" value="${pagamentoAtualizacao.mes_ref}"
                       required class="form-control"/><br/>
            </div>
            <div class="form-group">
                <label>Ano de Referência</label>
                <input type="number" name="ano_ref" value="${pagamentoAtualizacao.ano_ref}"
                       required class="form-control"/><br/>
            </div>
            <div class="form-group">
                <label>Juros</label>
                <input type="number" name="juros" value="${pagamentoAtualizacao.juros}"
                       class="form-control"/><br/>
            </div>
            <div class="form-group">
                <c:if test="${empty pagamentoAtualizacao}">
                    <label>Forma de Pagamento</label>
                    <select name="formaPagamento" value="${pagamentoAtualizacao.forma_pagamento}"
                            class="form-control">
                        <option value="Boleto">Boleto</option>
                        <option value="Cartão">Cartão</option>
                        <option value="Dinheiro">Dinheiro</option>
                        <option value="Transferência">Transferência</option>
                    </select>
                </c:if>
            </div>
            <div class="form-group">
                <label>Valor Pago</label>
                <input type="number" name="valorPago" value="${pagamentoAtualizacao.valor_pago}"
                       required class="form-control"/><br/>
            </div>
            <div class="form-group">
                <input type="hidden" name="Colaborador" 
                       value="${sessionScope.usuario.id_colaborador}" 
                       class="form-control"
                       />
            </div>
            <div class="form-group">
                <input type="hidden" name="empr" 
                       value="${sessionScope.usuario.empr_id}" 
                       class="form-control"
                       />
            </div>
            <br>               
            <br>                                               
            <button type="submit" class="btn btn-primary">Enviar</button>
        </form>
    </body>
</html>
