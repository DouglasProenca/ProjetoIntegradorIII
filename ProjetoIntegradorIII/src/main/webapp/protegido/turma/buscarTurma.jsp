<%-- 
    Document   : buscarTurma
    Created on : 01/11/2021, 16:26:43
    Author     : Douglas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar turmas</title>
    </head>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <br>
        <br>
        <br>
        <input type="text" id="nomeCliente" class="form-control"/><br/>
        <button onclick="buscar()" class="btn btn-primary">Buscar</button>

        <div id="msgAlerta" class="alert alert-warning" role="alert" style="display:none">
            <span id="txtAlerta"></span>
        </div>
        <br>
        <br>
        <table id="tabelaClientes" class="table">
            <thead>
            <th>Turma</th>
            <th>Data de inicio</th>
            <th>Data de conclusão</th>
            <th>Valor curso</th>
        </thead>
        <tbody>

        </tbody>
    </table>

</body>
</html>
