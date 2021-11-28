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
                                            .append($('<td>').append(filial.Empr_id))
                                            .append($('<td>').append(filial.rua))
                                            .append($('<td>').append(filial.numero))
                                            .append($('<td>').append(filial.bairro))
                                            .append($('<td>').append(filial.cidade))
                                            .append($('<td>').append(filial.cep))
                                            .append($('<td>').append(filial.uf))
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
            <th>Rua</th>
            <th>Nº</th>
            <th>Bairro</th>
            <th>Cidade</th>
            <th>CEP</th>
            <th>UF</th>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>
</body>
</html>
