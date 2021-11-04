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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
              crossorigin="anonymous" />
        <script type="text/javascript">

            function buscarColaborador() {
                var campoBusca = $("#nomeColaborador");
                var nomeColaborador = campoBusca.val();
                var tamanhoBusca = nomeColaborador.length;
                if (tamanhoBusca < 3) {
                    mostrarTelaAlerta("Digite, pelo menos, 3 caracteres");
                } else {
                    $('#tabelaColaboradores tbody').empty();
                    var url = "../cliente/BuscaColaborador?nomeColaborador=" + nomeColaborador;
                    $.ajax(url).done(function (resposta) {
                        // Retorno do servlet
                        var jsonClientes = JSON.parse(resposta);
                        if (jsonClientes.length === 0) {
                            mostrarTelaAlerta("A busca não encontrou resultados");
                        }
                        console.log(jsonClientes);
                        // Adicionando resultado na lista
                        jsonClientes.forEach(function (colaborador) {
                            $("#tabelaColaboradores").find('tbody')
                                    .append($('<tr>')
                                            .append($('<td>').append(colaborador.id))
                                            .append($('<td>').append(colaborador.nome))
                                            .append($('<td>').append(colaborador.cargo))
                                            .append($('<td>').append(colaborador.setor))
                                            .append($('<td>').append(colaborador.salario))
                                            .append($('<td>').append(colaborador.data_ingresso))
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
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <br>
        <br>
        <br>
        <input type="text" id="nomeColaborador" class="form-control"/><br/>
        <button onclick="buscarColaborador()" class="btn btn-primary">Buscar</button>

        <div id="msgAlerta" class="alert alert-warning" role="alert" style="display:none">
            <span id="txtAlerta"></span>
        </div>
        <br>
        <br>
        <table id="tabelaColaboradores" class="table">
            <thead>
            <th>ID</th>
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
