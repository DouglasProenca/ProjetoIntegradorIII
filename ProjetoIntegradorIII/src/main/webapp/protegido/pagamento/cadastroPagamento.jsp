<%-- 
    Document   : Cadastro Pagamento
    Created on : 2 de nov. de 2021, 23:09:43
    Author     : Douglas Proença
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Pagamento</title>
    </head>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <div>
            <br><br><br>
            <c:if test="${empty pagamentoAtualizacao}">
            <h1><center>Alunos</center></h1>
            <table  class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>CPF</th>
                        <th>Telefone</th>
                        <th>E-mail</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="cliente" items="${listaClientes}">
                        <tr>
                            <td>${cliente.id}</td>
                            <td>${cliente.nome}</td>
                            <td>${cliente.CPF}</td>
                            <td>${cliente.celular}</td>
                            <td>${cliente.email}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            </c:if>
        </div>

        <div>
            <h2><center>Cadastrar Pagamento</center></h2>
            <form class="col-md-6 offset-md-3 jumbotron" action="CadastroPagamentoServlet" method="POST">
                <c:if test="${not empty pagamentoAtualizacao}">
                    <input type="hidden" name="ope" value="1"/>
                </c:if>
                <div  class="form-group">
                    <label>ID Cliente</label>
                    <input type="text" name="id" value="${pagamentoAtualizacao.id}"
                           required class="form-control"/><br/> 
                </div>
                <div  class="form-group">
                    <label>Data Pagamento</label>
                    <input type="date" name="dataPagamento" value="${pagamentoAtualizacao.dt_pagamento}"
                           required class="form-control"/><br/> 
                </div>
                <div  class="form-group">
                    <label>Ano de Referência</label>
                    <input type="number" name="ano_ref" value="${pagamentoAtualizacao.ano_ref}"
                           required class="form-control"/><br/> 
                </div>
                <div  class="form-group">
                    <label>Mês de Referência</label>
                    <input type="number" name="mes_ref" value="${pagamentoAtualizacao.mes_ref}"
                           required class="form-control"/><br/> 
                </div>
                <div  class="form-group">
                    <label>Juros</label>
                    <input type="number" name="juros" value="${pagamentoAtualizacao.juros}"
                           required class="form-control"/><br/> 
                </div>
                <div class="form-group">
                    <c:if test="${empty pagamentoAtualizacao}">
                        <label>Forma de Pagamento</label>
                        <select name="formaPagamento"
                                class="form-control">
                            <option value="Boleto">Boleto</option>
                            <option value="Cartão">Cartão</option>
                            <option value="Cheque">Cheque</option>
                            <option value="Transferência">Transferência</option>
                        </select>
                    </c:if>
                </div>
                <div  class="form-group">
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
                <button type="submit" class="btn btn-primary">Realizar Pagamento</button>
            </form> 
        </div>
    </body>
</html>
