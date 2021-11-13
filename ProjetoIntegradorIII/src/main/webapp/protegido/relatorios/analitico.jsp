<%-- 
    Document   : analitico
    Created on : 08/11/2021, 22:23:27
    Author     : Douglas
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatorio analitico</title>
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
            <th>Cursos disponiveis</th>
            <th>Valor do curso</th>
            <th>Valor do material</th>
        </thead>        
        <tbody>
            
        </tbody>
    </table>

</body>
</html>
