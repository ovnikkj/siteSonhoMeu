<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>

</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Página Inicial</title>
<!-- Link para o CSS do Bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
</style>
</head>
<body>

	<%
	//implementar o login para ter acesso ao nome
	//arrumar o "você está logado" na navbar, tirar e colocar o nome da pessoa q passará do login.

	Boolean logado = (Boolean) session.getAttribute("logado");
	if (logado == null) {
		logado = false;
		session.setAttribute("logado", false);

	}
	if (logado) {
		logado = true;
		String username = (String) session.getAttribute("username");

	}
	%>



	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#"> <img src="lib/logo padaria.png"
			width="100px" height="100%" alt="Logo">
		</a>




		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li style="<%=logado ? "" : "display:none;"%>" class="nav-item"><a
					class="nav-link" href="Comanda.jsp">Acessar Comanda</a></li>
				<!--tirar o login quando o usuario ja estiver logado-->
				<li style="<%=!logado ? "" : "display:none;"%>" class="nav-item"><a
					class="nav-link" href="login.jsp">Login</a></li>
				<!--tirar esse registrar se quando o usuario ja estiver logado-->
				<li style="<%=!logado ? "" : "display:none;"%>" class="nav-item"><a
					class="nav-link" href="Cadastro.jsp">Registrar-se</a></li>
				<%
				if (logado) {
				%>
				<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</nav>

	<div class="container mt-5">
		<span><h1 style="<%=logado ? "" : "display:none;"%>"><%=session.getAttribute("username")%></h1>
		</span>
		<h1>Bem-vindo ao nosso app!</h1>
		<p style="<%=!logado ? "" : "display:none;"%>">
			<span><a href="Cadastro.jsp">Cadastre-se</a></span> ou <span><a
				href="login.jsp">Entre</a></span> e retire seus itens sem pegar fila!
		</p>
	</div>



	<script type="text/javascript">
		function logar() {

		}
	</script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



</body>
</html>
