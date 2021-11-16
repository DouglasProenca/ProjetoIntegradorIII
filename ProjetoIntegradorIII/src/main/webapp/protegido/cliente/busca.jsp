<%-- 
    Document   : Buscar Cliente
    Created on : 31/10/2021, 21:00:14
    Author     : Douglas Proença
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar Pessoas</title>
    </head>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <br><br><br>
        <input type="text" id="nomeCliente" class="form-control"/><br/>
        <button onclick="buscar()" class="btn btn-primary">Buscar</button>
        <div id="msgAlerta" class="alert alert-warning" role="alert" style="display:none">
            <span id="txtAlerta"></span>
        </div>
        <br><br>
        <table id="tabelaClientes" class="table">
            <thead>
            <th>Nome</th>
            <th>Email</th>
            <th>CPF</th>
            <th>Sexo</th>
            <th>Celular</th>
            <th>Fixo</th>
        </thead>
        <tbody></tbody>
    </table>
</body>
</html>
