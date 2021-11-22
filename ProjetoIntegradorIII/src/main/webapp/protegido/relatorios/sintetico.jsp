<<<<<<< HEAD
<%-- 
  Document   : sintetico
  Created on : 08/11/2021, 22:23:38
  Author     : Douglas
=======
  <%-- 
    Document   : sintetico
    Created on : 08/11/2021, 22:23:38
    Author     : Douglas
>>>>>>> main
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatorio sintetico</title>
<<<<<<< HEAD
        <script type="text/javascript">

            function relSint() {
                var campoId = $("#id_filial");
                var dtIni = $("#data_inicial");
                var dtFim = $("#data_final");
                var idFilial= campoId.val();
                var dataInicial= dtIni.val();
                var dataFinal= dtFim.val();
                    $('#tabelaRelatorio tbody').empty();
                    var url = "../cliente/Rela_Sintetico?id_filial=" + idFilial+
                            ","+dataInicial+","+dataFinal;
                    $.ajax(url).done(function (relatorioSinte) {
                        // Retorno do servlet
                        var jsonSintetico = JSON.parse(relatorioSinte);
                        if (jsonSintetico.length === 0) {
                            mostrarTelaAlerta("A busca não encontrou resultados");
                        }
                        console.log(jsonSintetico);
                        // Adicionando resultado na lista
                        jsonSintetico.forEach(function (relatorio) {
                            $("#tabelaRelatorio").find('tbody')
                                    .append($('<tr>')
                                            .append($('<td>').append(relatorio.nome))
                                            .append($('<td>').append(relatorio.dtCompra))
                                            .append($('<td>').append(relatorio.valorContrato))
                                            .append($('<td>').append(relatorio.tempoCurso))
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
=======
    </head>
     <body class="container">
>>>>>>> main
        <c:import url="../uteis/header.jsp"/>
        <br>
        <br>
        <br>
<<<<<<< HEAD
        <label>Filial:</label>
        <input type="text" id="id_filial" class="form-control" placeholder="Digite o ID da Filial"/><br/>
        <label>Data Inicial:</label>
        <input type="date" id="data_inicial" class="form-control"/><br/>
        <label>Data Final:</label>
        <input type="date" id="data_final" class="form-control"/><br/>
        <button onclick="relSint()" class="btn btn-primary">Buscar</button>
=======
        <input type="text" id="nomeCliente" class="form-control"/><br/>
        <button onclick="buscar()" class="btn btn-primary">Buscar</button>
>>>>>>> main

        <div id="msgAlerta" class="alert alert-warning" role="alert" style="display:none">
            <span id="txtAlerta"></span>
        </div>
        <br>
        <br>
<<<<<<< HEAD
        <table id="tabelaRelatorio" class="table">
            <thead>
=======
        <table id="tabelaClientes" class="table">
        <thead>
>>>>>>> main
            <th>Nome</th>
            <th>Data da compra</th>
            <th>Valor do contrato</th>
            <th>Tempo do curso</th>
        </thead>
<<<<<<< HEAD

        <tbody>

=======
        
        <tbody>
            
>>>>>>> main
        </tbody>
    </table>

</body>
</html>