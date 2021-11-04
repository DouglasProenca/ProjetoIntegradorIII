<%-- 
    Document   : Listar Filial
    Created on : 28/10/2019, 22:11:28
    Author     : Douglas Proença
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Cadastrar Filial</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
              crossorigin="anonymous" />
    </head>
    <body>
        <div class="container">
            <c:import url="../uteis/header.jsp"/>
            <br>
            <br>
            <br>
            <h1><center>Cadastrar Filial</center></h1>
            <br>
            <br>
            <form class="col-md-6 offset-md-3 jumbotron" action="../cliente/CadastroFilialServlet" method="POST">

                <c:if test="${not empty filialAtualizacao}">
                    <input type="hidden" name="ope" value="1"/>
                </c:if>
                <div class="form-group">
                    <label>Rua</label>
                    <input type="text" name="rua" value="${filialAtualizacao.rua}"
                           required class="form-control"/><br/>
                </div>
                <div class="form-group">
                    <label>Número</label>
                    <input type="number" name="numero"
                           value="${filialAtualizacao.numero}" 
                           required=""
                           class="form-control"
                           />
                </div>
                <br>
                <div class="form-group">
                    <label>Bairro</label>

                    <input type="text" name="bairro"
                           value="${filialAtualizacao.bairro}" 
                           required
                           class="form-control"
                           />            

                </div>
                <br>
                <div class="form-group">
                    <label>Cidade</label>
                    <input type="text" name="cidade"
                           value="${filialAtualizacao.cidade}" 
                           required
                           class="form-control"
                           />     
                </div>
                <br>
                <div class="form-group">
                    <label>CEP</label>
                    <input type="number" name="CEP"
                           value="${filialAtualizacao.cep}" placeholder="00000-000"
                           required
                           class="form-control"
                           />
                </div>
                <br>
                <div class="form-group">
                    <c:if test="${empty filialAtualizacao}">
                        <label>UF</label>
                        <select name="uf" value="${filialAtualizacao.uf}"
                                class="form-control">
                            <option value="SP">SP</option>
                            <option value="MG">MG</option>
                            <option value="RS">RS</option>
                            <option value="RJ">RJ</option>
                            <option value="PR">PR</option>
                            <option value="AM">AM</option>
                            <option value="AC">AC</option>
                            <option value="BA">BA</option>
                            <option value="SC">SC</option>
                            <option value="PB">PB</option>
                            <option value="GO">GO</option>
                            <option value="RO">RO</option>
                            <option value="MS">MS</option>
                            <option value="AL">AL</option>
                            <option value="DF">DF</option>
                        </select>
                    </c:if>
                </div>
                <div class="form-group">
                    <label>Data de Lançamento</label>
                    <input type="date" name="admissaoColaborador" value="${filialAtualizacao.data_lançamento}"
                           required class="form-control"/><br/>
                </div>   
                <div class="form-group">
                    <input type="hidden" name="Colaborador" 
                           value="${sessionScope.usuario.id_colaborador}" 
                           class="form-control"
                           />
                </div>
                <br/>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </body>
</html>