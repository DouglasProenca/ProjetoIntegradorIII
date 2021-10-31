<%-- 
    Document   : buscaFilial
    Created on : 31/10/2021, 10:55:10
    Author     : Douglas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar Filial</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
              crossorigin="anonymous" />
        <script type="text/javascript">

            function buscarFilial() {
                var campoBusca = $("#nomeFilial");
                var nomeFilial = campoBusca.val();
                var tamanhoBusca = nomeFilial.length;
                if (tamanhoBusca < 3) {
                    mostrarTelaAlerta("Digite, pelo menos, 3 caracteres");
                } else {
                    $('#tabelaClientes tbody').empty();
                    var url = "../cliente/BuscaFilial?nomeFilial=" + nomeFilial;
                    $.ajax(url).done(function (resposta) {
                        // Retorno do servlet
                        var jsonClientes = JSON.parse(resposta);
                        if (jsonClientes.length === 0) {
                            mostrarTelaAlerta("A busca não encontrou resultados");
                        }
                        console.log(jsonClientes);
                        // Adicionando resultado na lista
                        jsonClientes.forEach(function (filial) {
                            $("#tabelaClientes").find('tbody')
                                    .append($('<tr>')
                                            .append($('<td>').append(filial.empr_id))
                                            .append($('<td>').append(filial.nome))
                                            .append($('<td>').append(filial.rua))
                                            );
                        })




                    }).fail(function () {
                        console.log("Erro!");
                    })
                }

            }

            function mostrarTelaAlerta(texto) {
                $("#txtAlerta").html(texto);
                $("#msgAlerta").css("display", "block");
                setTimeout(function () {
                    $("#msgAlerta").css("display", "none");
                }, 1000)
            }
        </script>
    </head>
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
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <br>
        <br>
        <br>
        <br>
        <input type="text" id="nomeFilial" class="form-control"/><br/>

        <button onclick="buscarFilial()" class="btn btn-primary">Buscar Filial</button>
        <div id="msgAlerta" class="alert alert-warning" role="alert" style="display:none">
            <span id="txtAlerta"></span>
        </div>
        <br>
        <br>
        <table id="tabelaClientes" class="table">
            <thead>
            <th>ID</th>
            <th>Nome</th>
            <th>Rua</th>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>
</body>
</html>
