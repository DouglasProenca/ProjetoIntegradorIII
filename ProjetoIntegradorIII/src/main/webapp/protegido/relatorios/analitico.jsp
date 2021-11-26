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
        <script type="text/javascript">

            function relAnali() {
                var campoText = $("#dadoTurma");
                var dado = campoText.val();
                $('#tabelaRelatorio tbody').empty();
                var url = "../cliente/Rela_Analitico?dados=" + dado;
                $.ajax(url).done(function (relatorioAnali) {
                    // Retorno do servlet
                    var jsonAnalitico = JSON.parse(relatorioAnali);
                    if (jsonAnalitico.length === 0) {
                        mostrarTelaAlerta("A busca não encontrou resultados");
                    }
                    console.log(jsonAnalitico);
                    // Adicionando resultado na lista
                    jsonAnalitico.forEach(function (relatorio) {
                        $("#tabelaRelatorio").find('tbody')
                                .append($('<tr>')
                                        .append($('<td>').append(relatorio.nome))
                                        .append($('<td>').append(relatorio.CPF))
                                        .append($('<td>').append(relatorio.turma))
                                        .append($('<td>').append(relatorio.valorContrato))
                                        .append($('<td>').append(relatorio.data_final))
                                        .append($('<td>').append(relatorio.dtCompra))
                                        .append($('<td>').append(relatorio.tempoCurso))
                                        .append($('<td>').append(relatorio.pagamentos))
                                        .append($('<td>').append(relatorio.situacao))
                                        .append($('<td>').append(relatorio.id_matricula))
                                        .append($('<td>').append(relatorio.nome_colaborador))
                                        );
                    })


                }).fail(function () {
                    console.log("Erro!");
                })
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
        <input type="text" id="dadoTurma" class="form-control" placeholder="Digite o nome ou id da turma"/><br/>
        <button onclick="relAnali()" class="btn btn-primary">Buscar</button>

        <div id="msgAlerta" class="alert alert-warning" role="alert" style="display:none">
            <span id="txtAlerta"></span>
        </div>
        <br>
        <br>
        <table id="tabelaRelatorio" class="table">
            <thead>
            <th>Nome</th>
            <th>CPF</th>
            <th>Turma</th>
            <th>Valor do curso</th>
            <th>Data Matricula</th>
            <th>Data de Conclusão</th>
            <th>Tempo de Curso</th>
            <th>Número de Pagamentos</th>
            <th>Situação</th>
            <th>ID Matricula</th>
            <th>Colaborador</th>
        </thead>        
        <tbody>

        </tbody>
    </table>

</body>
</html>
