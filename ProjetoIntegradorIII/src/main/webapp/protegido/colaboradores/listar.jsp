<%-- 
    Document   : listar
    Created on : 01/11/2021, 16:06:22
    Author     : Douglas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="/css/estilo.css">
        <title>Listar colaboradores</title>
        <script type="text/javascript">
            var colaboradorRemocao;
            function confirmarRemocao(nome, id) {
                console.log("Confirmar exclusao ", nome, id);
                idColaborador = id;
                var paragrafoCliente = $("#campoTextoExclusao");
                paragrafoCliente.html(nome + " - " + id);

                var modalConfirmacao = $("#modalExclusao");
                modalConfirmacao.show();
            }

            function fecharModal() {
                var modalConfirmacao = $("#modalExclusao");
                modalConfirmacao.hide();
            }

            function deletar() {
                console.log("Excluindo colaborador(a) ", idColaborador);
                fecharModal();
                var url = "../protegido/cliente/CadastroTurmaServlet?idTurma=" + idColaborador;
                $.ajax(url).done(function () {
                    console.log("Colaborador(a) removido!");
                    var alerta = $("#alerta");
                    alerta.css("display", "block");
                    setTimeout(function () {
                        alerta.css("display", "none");
                        location.reload();
                    }, 1000)
                }).fail(function () {
                    console.log("Erro ao remover a Turma!");
                })
            }
        </script>
    </head>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
             <div id="alerta" class="alert alert-success" role="alert" style="display:none">
            Colaborador(a) removido(a) com sucesso!
        </div>
        <br>
        <br>
        <br>
        <h1><center>Colaboradores</center></h1>
        <br>
        <div class="modal" tabindex="-1" role="dialog" id="modalExclusao">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Confirmar Exclusão</h5>                       
                    </div>
                    <div class="modal-body">
                        <p>Confirmar exclusão de colaborador abaixo?</p>
                        <p id="campoTextoExclusao"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="fecharModal()">Cancelar</button>
                        <button type="button" class="btn btn-primary" onclick="deletar()">Confirmar</button>
                    </div>
                </div>
            </div>
        </div>
    <fildset>
        <table class="table-bordered" aling="center" border="2px" width="80%">
            <thead>
            <td>empr_id</td><td>ID</td><td>Nome</td><td>Cargo</td><td>Setor</td><td>Salário</td><td>Data de admissão</td>
            </thead>
            <tbody>
                <c:forEach var="turma" items="${listaColaboradores}">
                    <tr>
                        <td>${turma.empr_id}</td>
                        <td>${turma.id}</td>
                        <td>${turma.nome}</td>
                        <td>${turma.cargo}</td>
                        <td>${turma.setor}</td>
                        <td>${turma.salario}</td>
                        <td>${turma.salario}</td>                         
                        <td><a href="../protegido/cliente/CadastroColaboradorServlet?idColaborador=${colaborador.id}&ope=1" >Atualizar</a></td>
                        <td><button onclick="confirmarRemocao('${colaborador.nome}','${colaborador.id}')" class="btn btn-link">Deletar</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </fildset>
    </body>
</html>
