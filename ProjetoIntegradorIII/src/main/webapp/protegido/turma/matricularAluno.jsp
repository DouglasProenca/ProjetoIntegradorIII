<%-- 
    Document   : Cadastro Matricula
    Created on : 2 de nov. de 2021, 23:09:43
    Author     : Douglas Proença
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Matricula</title>
    </head>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <div>
            <br><br><br>
            <h1><center>Clientes</center></h1>
            <table  class="table">
                <thead>
                    <tr>
                        <th>ID Cliente</th>
                        <th>Nome</th>
                        <th>CPF</th>
                        <th>Telefone</th>
                        <th>E-mail</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="cliente" items="${listaClientes}">
                        <tr>
                            <td>${cliente.id}</td>
                            <td>${cliente.nome}</td>
                            <td>${cliente.CPF}</td>
                            <td>${cliente.celular}</td>
                            <td>${cliente.email}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div>
            <br><br><br>
            <h1><center>Turma</center></h1>
            <table  class="table">
                <thead>
                    <tr>
                        <th>ID Turma</th>
                        <th>Turma</th>
                        <th>Data de inicio</th>
                        <th>Data de conclusão</th>
                        <th>Valor curso</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="turma" items="${listaTurma}">
                        <tr>
                            <td>${turma.empr_id}</td>
                            <td>${turma.id}</td>
                            <td>${turma.nome}</td>
                            <td>${turma.data_inicio}</td>
                            <td>${turma.data_fim}</td>
                            <td>${turma.valor}</td>                       
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div>
            <h2><center>Matricular Aluno</center></h2>
            <form class="col-md-6 offset-md-3 jumbotron" method="POST">
                <div  class="form-group">
                    <label>ID Cliente</label>
                    <input type="text" name="id_cliente" 
                           required class="form-control"/><br/> 
                </div>
                <div  class="form-group">
                    <label>ID turma</label>
                    <input type="number" name="id_turma" 
                           required class="form-control"/><br/> 
                </div>
                <div  class="form-group">
                    <label>Data Matricula</label>
                    <input type="date" name="dt_matricula" 
                           required class="form-control"/><br/> 
                </div>
                <div  class="form-group">
                    <label>Matricula</label>
                    <input type="text" name="matricula" 
                           required class="form-control"/><br/> 
                </div>
                <div  class="form-group">
                    <label>Dia de Vencimento da Mensalidade</label>
                    <input type="number" name="Dia_venc" 
                           required class="form-control"/><br/> 
                </div>
                <div class="form-group">
                        <label>Situação</label>
                        <select name="situacao"
                                class="form-control">
                            <option value="Sim">Ativo</option>
                            <option value="Não">Não Ativo</option>
                        </select>
                </div>
                <div class="form-group">
                    <input type="hidden" name="Colaborador" 
                           value="${sessionScope.usuario.id_colaborador}" 
                           class="form-control"
                           />
                </div>
                <button type="submit" class="btn btn-primary">Realizar Matricula</button>
            </form> 
        </div>
    </body>
</html>
