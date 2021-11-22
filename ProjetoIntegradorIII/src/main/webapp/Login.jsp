<%-- 
    Document   : Login
    Created on : 08/10/2021, 20:19:16
    Author     : Douglas Proença
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Login</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous" />
    </head>

    <body>

        <div class="container" >
            <!--tag para centralização do formulario-->
            <br>
            <br>
            <!--<form class="col-md-6 offset-md-3 jumbotron" action="/login" method="POST">-->
            <form class="col-md-6 offset-md-3 jumbotron" action="LoginServlet" method="POST">
                <h3>Login</h3>
                <br>
                <c:if test="${param.loginInvalido != null}">
                    <div class="alert alert-danger" role="alert">
                        Usuário/Senha inválidos
                    </div>  
                </c:if>
                <!-- Endereço de email-->
                <label for="exampleInputEmail1">Nome:</label>
                <input type="text" class="form-control" name="nomeUsuario" placeholder="Nome">

                <br>
                <!--senha-->
                <label for="exampleInputPassword1">Senha:</label>
                <input type="password" class="form-control" name="senhaUsuario" placeholder="Senha">
                <!-- Botao para entrar -->
                <br>
                <br>
                <br>
                <center>
                    <button type="submit" value="Enviar" class="btn btn-primary">Login</button>
                </center>
                <br>
            </form>
        </div>
    </body>
</html>