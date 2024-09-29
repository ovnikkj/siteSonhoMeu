<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Comanda</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	width: 360px; 
	height: 640px; 
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 16px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	display: flex;
	flex-direction: column;
}

.navbar {
	background-color: #007bff;
	color: white;
	padding: 15px;
	text-align: center;
	font-size: 18px;
}

.content {
	padding: 20px;
	flex-grow: 1;
	display: flex;
	flex-direction: column;
}

.greeting {
	font-size: 22px;
	margin-bottom: 10px;
}

.saldo {
	font-size: 18px;
	color: green;
	margin-bottom: 20px;
}

.product-container {
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	margin-bottom: 20px;
}

.product {
	width: 80px;
	text-align: center;
	cursor: pointer;
}

.product img {
	width: 80px;
	height: 80px;
	border-radius: 4px;
}

.cart {
	margin-top: 20px;
	background-color: #f9f9f9;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	max-height: 200px;
	overflow-y: auto;
	flex-grow: 1;
	display: flex;
	flex-direction: column;
}

.cart-item {
	display: flex;
	justify-content: space-between;
	margin-bottom: 5px;
	padding: 5px;
	background-color: #e9ecef;
	border-radius: 4px;
}

.total {
	font-weight: bold;
	margin-top: 10px;
}

.pay-button {
	margin-top: 10px;
	padding: 10px;
	background-color: #28a745;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
</style>
</head>
<body>
<%
	String userName = (String) request.getAttribute("userName");
%>

<div class="container">
	<div class="navbar">Comanda - Padaria Sonho Meu</div>
	<div class="content">
		<h1>Olá, <%=session.getAttribute("username") %>!</h1>

		<div class="product-container">
			<div class="product" onclick="addProduct('Pão de Queijo', 2.50)">
				<img src="https://via.placeholder.com/80" alt="Pão de Queijo">
				<p>
					Pão de Queijo<br>R$ 2,50
				</p>
			</div>
			<div class="product" onclick="addProduct('Pão Francês', 1.50)">
				<img src="https://via.placeholder.com/80" alt="Pão Francês">
				<p>
					Pão Francês<br>R$ 1,50
				</p>
			</div>
			<div class="product" onclick="addProduct('Pudim', 7.00)">
				<img src="https://via.placeholder.com/80" alt="Pudim">
				<p>
					Pudim<br>R$ 7,00
				</p>
			</div>
			<div class="product" onclick="addProduct('Tortinha de Limão', 11.00)">
				<img src="https://via.placeholder.com/80" alt="Tortinha de Limão">
				<p>
					Tortinha de Limão<br>R$ 11,00
				</p>
			</div>
		</div>

		<div class="cart">
			<h4>Carrinho:</h4>
			<div id="cartItems"></div>
			<div class="total">
				Total: R$ <span id="totalPrice">0.00</span>
			</div>
			<form method="POST" action="finalizarCompra">
				<input type="hidden" name="total" id="totalInput" value="0.00">
				<input type="hidden" name="userName" value="<%= userName %>">
				<button type="submit" class="pay-button" onclick="updateTotalInput()">Pagar</button>
			</form>
		</div>

		<script>
			let total = 0.00; // Inicializa o total com zero

			function addProduct(productName, productPrice) {
				const cartItemsDiv = document.getElementById('cartItems');
				
				// Cria um novo elemento para o item do carrinho
				const cartItem = document.createElement('div');
				cartItem.className = 'cart-item';
				cartItem.innerHTML = '<span>' + productName + '</span><span>R$ ' + productPrice.toFixed(2) + '</span>';

				// Adiciona o novo item ao carrinho
				cartItemsDiv.appendChild(cartItem);

				// Atualiza o total acumulado
				total += productPrice;
				document.getElementById('totalPrice').innerText = total.toFixed(2);
			}

			// Atualiza o valor do campo oculto no formulário com o total atual
			function updateTotalInput() {
				document.getElementById('totalInput').value = total.toFixed(2);
			}
		</script>
	</div>
</div>
</body>
</html>
