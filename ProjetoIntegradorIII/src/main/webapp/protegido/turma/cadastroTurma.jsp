<%-- 
    Document   : cadastroTurma
    Created on : 01/11/2021, 16:27:22
    Author     : Douglas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Turmas</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
              crossorigin="anonymous" />

    </head>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <br>
        <br>
        <br>
        <h1><center>Cadastro de Turmas</center></h1>
        <br>
        <br>
        <form class="col-md-6 offset-md-3 jumbotron" action="../cliente/CadastroTurmaServlet" method="POST">

            <c:if test="${not empty turmaAtualizacao}">
                <input type="hidden" name="ope" value="1"/>
            </c:if>
            <div  class="form-group">
                <label>Turma</label>
                <input type="text" name="nomeTurma" value="${turmaAtualizacao.nome}"
                       required class="form-control"/><br/> 
            </div>
            <div class="form-group">
                <label>Data de inicio</label>
                <input type="date" name="inicioCliente" value="${turmaAtualizacao.data_inicio}"
                       required class="form-control"/><br/>
            </div>
            <div class="form-group">
                <label>Data de conclusão</label>
                <input type="date" name="conclusaoCliente" value="${turmaAtualizacao.data_fim}"
                       required class="form-control"/><br/>
            </div>
            <div class="form-group">
                <label>Valor curso</label>
                <input type="text" name="valorCliente" value="${turmaAtualizacao.valor}"
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
            <div class="form-group">
                <input type="hidden" name="id" 
                       value="${turmaAtualizacao.id}" 
                       class="form-control"
                       />
            </div>
            <br>               
            <br>                                               
            <button type="submit" class="btn btn-primary">Enviar</button>
        </form>
    </body>

</html>
