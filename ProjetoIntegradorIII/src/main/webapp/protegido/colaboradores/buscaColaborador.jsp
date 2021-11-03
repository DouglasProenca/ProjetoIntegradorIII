<%-- 
    Document   : buscaColaborador
    Created on : 01/11/2021, 16:07:12
    Author     : Douglas
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar colaboradores</title>
    </head>
    <body>
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
        <table id="tabelaColaboradores" class="table">
            <thead>
            <th>Nome</th>
            <th>Cargo</th>
            <th>Setor</th>
            <th>Salario</th>
            <th>Data de admissão</th>
        </thead>
        <tbody>

        </tbody>
    </table>
    </body>
</html>
