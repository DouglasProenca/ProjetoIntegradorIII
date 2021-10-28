<%-- 
    Document   : index
    Created on : 08/10/2021, 20:19:16
    Author     : Douglas Proença
--%>
<html>
   <head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Login</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous" />
</head>

<body>

	<div class="container" >
            <!--tag para centralização do formulario-->
            <br>
            <br>
        <!--<form class="col-md-6 offset-md-3 jumbotron" action="/login" method="POST">-->
        <form class="col-md-6 offset-md-3 jumbotron">
            <h3>Login</h3>
            
            <div class="form-group">
                <!-- Endereço de email-->
                <label for="exampleInputEmail1">Nome:</label>
                <input type="text" class="form-control" name="nome" placeholder="Nome">
            </div>
            
            <div class="form-group">
                <!--senha-->
                <label for="exampleInputPassword1">Senha:</label>
                <input type="password" class="form-control" name="senha" placeholder="Senha">
            </div>
            
            <!-- Botao para entrar -->
            <center>
                <button class="btn btn-primary"><a href="index.jsp">Login</a></button>
            </center>
            <br>
	</form>
	</div>
</body>
</html>