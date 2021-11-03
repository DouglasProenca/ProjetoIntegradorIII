<%-- 
    Document   : cadastroColaborador
    Created on : 01/11/2021, 16:03:38
    Author     : Douglas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de colaboradores</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
              crossorigin="anonymous" />
    </head>
    <body>
        <c:import url="../uteis/header.jsp"/>
            <br>
            <br>
            <br>
            <h1><center>Cadastro de colaboradores</center></h1>
            <br>
            <br>
            <form class="col-md-6 offset-md-3 jumbotron" action="../cliente/CadastroColaboradoresServlet" method="POST">

                <c:if test="${not empty colaboradorAtualizacao}">
                    <input type="hidden" name="ope" value="1"/>
                </c:if>
                <div  class="form-group">
                    <label>Nome</label>
                    <input type="text" name="nomeColaborador" value="${colaboradorAtualizacao.nome}"
                           required class="form-control"/><br/> 
                </div>
                <div class="form-group">
                    <label>Cargo</label>
                    <input type="text" name="cargoColaborador" value="${colaboradorAtualizacao.cargo}"
                           required class="form-control"/><br/>
                </div>
                 <div class="form-group">
                    <label>Setor</label>
                    <input type="text" name="setorColaborador" value="${colaboradorAtualizacao.setor}"
                           required class="form-control"/><br/>
                </div>
                 <div class="form-group">
                    <label>Salário</label>
                    <input type="number" name="salarioColaborador" value="${colaboradorAtualizacao.salario}"
                           required class="form-control"/><br/>
                </div>
                 <div class="form-group">
                    <label>Data de admissão</label>
                    <input type="date" name="admissaoColaborador" value="${colaboradorAtualizacao.admissao}"
                           required class="form-control"/><br/>
                </div>   
                           
                <br>               
                <br>                                               
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
    </body>
</html>
