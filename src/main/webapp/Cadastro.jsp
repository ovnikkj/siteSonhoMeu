<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    
    <!-- Adicionando Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            max-width: 400px;
            margin: auto;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        /* Adiciona estilo para a seleção de gênero */
        .gender-selection {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 15px 0;
        }
        .gender-selection input[type="radio"] {
            margin-right: 5px;
            width: 20px; /* Aumenta a largura do botão de rádio */
            height: 20px; /* Aumenta a altura do botão de rádio */
        }
        .gender-selection label {
            margin-right: 15px;
        }
        .gender-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .gender-container img {
            width: 100px;
            height: 100px;
            border: 2px solid #ddd;
            margin-left: 20px;
        }
    </style>
    
    <script>
    function validarSenhas() {
        const senha = document.getElementById("senha").value;
        const confirmarSenha = document.getElementById("confirmarSenha").value;

        if (senha !== confirmarSenha) {
            alert("As senhas não coincidem. Por favor, tente novamente.");
            return false; // Impede o envio do formulário
        }

        alert("Cadastro concluído com sucesso");
        return true; // Permite o envio do formulário
    }

    function mostrarImagemGenero() {
        const generoSelecionado = document.querySelector('input[name="sexo"]:checked').value;
        const imagem = document.getElementById("imagemGenero");

        switch (generoSelecionado) {
            case "H":
                imagem.src = "lib/homem.png";
                imagem.alt = "Foto de um homem";
                break;
            case "M":
                imagem.src = "lib/mulher.png";
                imagem.alt = "Foto de uma mulher";
                break;
            default:
                imagem.src = "lib/anonimo.png";
                imagem.alt = "Foto de uma pessoa anônima";
                break;
        }
    }
    </script>
</head>
<body>

    <h2 class="text-center">Formulário de Cadastro</h2>

    <form action="cadastro" method="POST" onsubmit="return validarSenhas()">
        <div class="mb-3">
            <label for="nome" class="form-label">Nome:</label>
            <input type="text" id="nome" name="nome" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="senha" class="form-label">Senha:</label>
            <input type="password" id="senha" name="senha" class="form-control" required>
        </div>
        
        <div class="mb-3">
            <label for="confirmar" class="form-label">Confirmar senha:</label>
            <input type="password" id="confirmarSenha" name="confirmarSenha" class="form-control" required>
        </div>

        <!-- Seção de seleção de gênero com imagem -->
        <div class="gender-container">
            <div class="gender-selection">
                <label class="form-label">Selecione seu gênero:</label>
                <input type="radio" id="homem" name="sexo" value="H" required onclick="mostrarImagemGenero()">
                <label for="homem">Homem</label>

                <input type="radio" id="mulher" name="sexo" value="M" onclick="mostrarImagemGenero()">
                <label for="mulher">Mulher</label>

                <input type="radio" id="anonimo" name="sexo" value="A" onclick="mostrarImagemGenero()">
                <label for="anonimo">Prefiro não informar</label>
            </div>
            <!-- Imagem que será alterada conforme a seleção -->
            <img id="imagemGenero" src="lib/anonimo.png" alt="Foto de uma pessoa anônima">
        </div>

        <div class="text-center mt-4">
            <input type="submit" value="Cadastrar" class="btn btn-success">
        </div>
    </form>

    <!-- Adicionando Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
