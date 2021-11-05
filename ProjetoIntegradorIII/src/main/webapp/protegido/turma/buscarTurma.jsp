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
        <script type="text/javascript">

            function buscarTurma() {
                var campoBusca = $("#nomeTurma");
                var nomeTurma = campoBusca.val();
                var tamanhoBusca = nomeTurma.length;
                if (tamanhoBusca == 0) {
                    mostrarTelaAlerta("Digite, pelo menos, 1 caracteres");
                } else {
                    $('#tabelaTurma tbody').empty();
                    var url = "../cliente/BuscaTurma?nomeTurma=" + nomeTurma;
                    $.ajax(url).done(function (resposta) {
                        // Retorno do servlet
                        var jsonTurmas = JSON.parse(resposta);
                        if (jsonTurmas.length === 0) {
                            mostrarTelaAlerta("A busca não encontrou resultados");
                        }
                        console.log(jsonTurmas);
                        // Adicionando resultado na lista
                        jsonTurmas.forEach(function (turma) {
                            $("#tabelaTurma").find('tbody')
                                    .append($('<tr>')
                                            .append($('<td>').append(turma.nome))
                                            .append($('<td>').append(turma.data_inicio))
                                            .append($('<td>').append(turma.data_fim))
                                            .append($('<td>').append(turma.valor))
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
        <input type="text" id="nomeTurma" class="form-control"/><br/>
        <button onclick="buscarTurma()" class="btn btn-primary">Buscar</button>

        <div id="msgAlerta" class="alert alert-warning" role="alert" style="display:none">
            <span id="txtAlerta"></span>
        </div>
        <br>
        <br>
        <table id="tabelaTurma" class="table">
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
