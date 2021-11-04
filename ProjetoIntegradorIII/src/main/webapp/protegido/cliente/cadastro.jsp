<%-- 
    Document   : cadastro
    Created on : 20/10/2021, 22:11:28
    Author     : Douglas Proença
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Cadastro de Clientes</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
              crossorigin="anonymous" />
    </head>
    <body>
        <div class="container">
            <c:import url="../uteis/header.jsp"/>
            <br>
            <br>
            <br>
            <h1><center>Cadastro de Pessoas</center></h1>
            <br>
            <br>
            <form class="col-md-6 offset-md-3 jumbotron" action="CadastroClienteServlet" method="POST">

                <c:if test="${not empty clienteAtualizacao}">
                    <input type="hidden" name="ope" value="1"/>
                </c:if>
                <div  class="form-group">
                    <label>Nome</label>
                    <input type="text" name="nomeCliente" value="${clienteAtualizacao.nome}"
                           required class="form-control"/><br/> 
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="text" name="emailCliente" value="${clienteAtualizacao.email}"
                           required class="form-control"/><br/>
                </div>
                <div class="form-group">
                    <c:if test="${empty clienteAtualizacao}">
                        <label>CPF</label>
                        <input type="text" name="CPFCliente"
                               value="${clienteAtualizacao.CPF}" placeholder="000.000.000-00"
                               required=""
                               class="form-control"
                               />
                    </c:if>
                </div>
                <br>
                <div class="form-group">
                    <label>Celular</label>
                    <input type="text" name="CelularCliente"
                           value="${clienteAtualizacao.celular}" placeholder="(00)00000-0000"
                           required
                           class="form-control"
                           />        
                </div>
                <br>
                <div class="form-group">
                    <label>Telefone Residencial</label>
                    <input type="text" name="ResidencialCliente"
                           value="${clienteAtualizacao.telResidencial}" placeholder="(00)0000-0000"
                           required
                           class="form-control"
                           />
                </div>
                <br>
                <div class="form-group">
                    <c:if test="${empty clienteAtualizacao}">
                        <label>Sexo</label>
                        <select name="sexo" value="${clienteAtualizacao.sexo}"
                                class="form-control">
                            <option value="Masculino">Masculino</option>
                            <option value="Feminino">Feminino</option>
                        </select>
                    </c:if>
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
                <br/>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </body>
</html>