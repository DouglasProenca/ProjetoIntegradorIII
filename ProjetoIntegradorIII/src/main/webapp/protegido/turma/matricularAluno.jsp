<%-- 
    Document   : matricularAluno
    Created on : 02/11/2021, 18:57:33
    Author     : Douglas
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Matricular Aluno</title>
    </head>
 <body>
        <div class="container">
            <c:import url="../uteis/header.jsp"/>                        
            <br>
            <br>
            <br>
            <h1><center>Matricular aluno</center></h1>
            <br>
            <br>
            <form class="col-md-6 offset-md-3 jumbotron" action="../cliente/CadastroTurmaServlet" method="POST">

                <c:if test="${not empty matriculaAtualizacao}">
                    <input type="hidden" name="ope" value="1"/>
                </c:if>
                    
                <div  class="form-group">
                    <label>Nome</label>
                    <input type="text" name="nomeTurma" value="${matriculaAtualizacao.nome}"
                           required class="form-control"/><br/> 
                    </div>
                                    
                <div class="form-group">
                    <c:if test="${empty matriculaAtualizacao}">
                    <label>Turma</label>
                    <select name="turma" value="${matriculaAtualizacao.matricula}"
                            class="form-control">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>                       
                    </select>
                    </c:if>
                </div>
          
                <div class="form-group">
                    <c:if test="${empty ativoAtualizacao}">
                    <label>Situação da matricula</label>
                    <select name="ativo" value="${matriculaAtualizacao.ativo}"
                            class="form-control">
                        <option value="ativa">Ativa</option>
                        <option value="naoAtiva">Não ativa</option>                     
                    </select>
                    </c:if>
                </div>
                
                <div class="form-group">
                    <label>Dia vencimento da matricula</label>
                    <input type="number" name="vencimentoCliente" value="${matriculaAtualizacao.vencimento}"
                           required class="form-control"/><br/>
                </div> 

                <div class="form-group">
                    <label>Data da matrícula</label>
                    <input type="date" name="matriculaCliente" value="${matriculaAtualizacao.matricula}"
                           required class="form-control"/><br/>
                </div>                           
                <br>                                               
                <button type="submit" class="btn btn-primary">Enviar</button> <button type="submit" class="btn btn-primary">Buscar</button> 
            </form>

    </body>
</html>
