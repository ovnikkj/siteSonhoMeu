<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    
    <!-- Adicionando Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 30px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .form-control {
            margin-bottom: 15px;
        }
        .btn-login {
            background-color: #4CAF50;
            color: white;
            border: none;
            width: 100%;
            padding: 10px 0;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-login:hover {
            background-color: #45a049;
        }
        .form-title {
            text-align: center;
            margin-bottom: 30px;
        }
        .link-cadastro {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<%Boolean falhou = (Boolean)session.getAttribute("falhou"); %>
    <div class="login-container">
        <h2 class="form-title">Login</h2>
       <div class="error-message" style="<%= (falhou != null && falhou) ? "" : "display:none;" %>">
    Usuário ou Senha inválido
</div>
        <form action="login" method="POST">
            <div class="mb-3">
                <label for="username" class="form-label">Usuário:</label>
                <input type="text" id="username" name="username" class="form-control" placeholder="Digite seu username" required>
            </div>

          
            

            <div class="mb-3">
                <label for="senha" class="form-label">Senha:</label>
                <input type="password" id="senha" name="senha" class="form-control" placeholder="Digite sua senha" required>
            </div>

            <input type="submit" value="Entrar" class="btn btn-login">

            <!-- Link para cadastro -->
            <p>Ainda não tem uma conta?</p><span><a href="Cadastro.jsp" class="link-cadastro"> Cadastre-se</a></span>
        </form>
    </div>

    <!-- Adicionando Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
