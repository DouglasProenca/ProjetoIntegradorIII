function mostrarTelaAlerta(texto) {
    $("#txtAlerta").html(texto);
    $("#msgAlerta").css("display", "block");
    setTimeout(function () {
        $("#msgAlerta").css("display", "none");
    }, 1000)
}


function buscar() {
    var campoBusca = $("#nomeCliente");
    var nomeCliente = campoBusca.val();
    var tamanhoBusca = nomeCliente.length;
    if (tamanhoBusca < 3) {
        mostrarTelaAlerta("Digite, pelo menos, 3 caracteres");
    } else {
        $('#tabelaClientes tbody').empty();
        var url = "../cliente/BuscaCliente?nomeCliente=" + nomeCliente;
        $.ajax(url).done(function (resposta) {
            // Retorno do servlet
            var jsonClientes = JSON.parse(resposta);
            if (jsonClientes.length === 0) {
                mostrarTelaAlerta("A busca não encontrou resultados");
            }
            console.log(jsonClientes);
            // Adicionando resultado na lista
            jsonClientes.forEach(function (cliente) {
                $("#tabelaClientes").find('tbody')
                        .append($('<tr>')
                                .append($('<td>').append(cliente.nome))
                                .append($('<td>').append(cliente.email))
                                .append($('<td>').append(cliente.cpf))
                                .append($('<td>').append(cliente.sexo))
                                .append($('<td>').append(cliente.celular))
                                .append($('<td>').append(cliente.telResidencial))
                                );
            })




        }).fail(function () {
            console.log("Erro!");
        })
    }


}

