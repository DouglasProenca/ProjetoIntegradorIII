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
    <style>

        body {
            background-color:darkgrey;
        }
    </style>
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

    <body>
        <div class="container">
            <c:import url="../uteis/header.jsp"/>
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
                    <label>CPF</label>
                        <input type="text" name="cpfCliente"
                               value="${clienteAtualizacao.cpf}" placeholder="000.000.000-00"
                               required=""
                               class="form-control"
                               />
                </div>
                <br>
                <div class="form-group">
                    <label>Celular</label>
                        <input type="text" name="CelularCliente"
                               value="${clienteAtualizacao.cpf}" placeholder="(00)00000-0000"
                               required
                               class="form-control"
                               />        
                </div>
                <br>
                <div class="form-group">
                <label>Telefone Residencial</label>
                        <input type="text" name="CelularCliente"
                               value="${clienteAtualizacao.cpf}" placeholder="(00)0000-0000"
                               required
                               class="form-control"
                               />
                </div>
                <br>
                <div class="form-group">
                    <label>Telefone Comercial</label>
                    <c:if test="${empty clienteAtualizacao}">
                        <input type="text" name="cpfCliente"
                               value="${clienteAtualizacao.cpf}" 
                               required
                               class="form-control"
                               />
                    </c:if>
                </div>
                <br>
                <div class="form-group">
                    <label>Data de Nascimento</label>
                    <c:if test="${empty clienteAtualizacao}">
                        <input type="Month" name="cpfCliente"
                               value="${clienteAtualizacao.cpf}" 
                               required
                               class="form-control"
                               />
                    </c:if>
                </div>
                <br/>
                <div class="form-group">
                    <label>Sexo</label>
                    <c:if test="${empty clienteAtualizacao}">
                        <select name="sexo" class="form-control">
                            <option value="bota">Masculino</option>
                            <option value="fla">Feminino</option>
                        </select>
                    </c:if>
                </div>
                <br/>
                <div class="form-group">
                    <label>Estado Civil</label>
                    <c:if test="${empty clienteAtualizacao}">
                        <select name="time" class="form-control">
                            <option value="Solteiro">Solteiro(a)</option>
                            <option value="Casado">Casado(a)</option>
                            <option value="Viuvo">Viúvo(a)</option>
                            <option value="Uniao">União Estavel</option>
                        </select>
                    </c:if>
                </div>
                <br/>
                <div  class="form-group">
                    <label>Observação</label>
                    <input type="text" name="observacao" value="${clienteAtualizacao.nome}"
                           class="form-control"/><br/> 
                </div>
                <br/>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </body>
</html>