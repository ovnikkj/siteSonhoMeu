package br.com.SonhoMeuCp.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import br.com.fiap.connectionFactory.Conexao;
import br.com.fiap.dao.UsuarioDAO;
import br.com.fiap.model.Usuario;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cadastro")
public class Cadastro extends HttpServlet {
	@Override

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conexao = null;
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String sexo = request.getParameter("sexo");
		try {
			conexao = Conexao.conectar();

			UsuarioDAO usuariodao = new UsuarioDAO();
			Usuario usuario = new Usuario(nome, email, senha, sexo);
			usuariodao.inserirUsuario(usuario);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			Conexao.fechar(conexao);
		}

		request.getSession().setAttribute("logado", true);
		request.getSession().setAttribute("username", nome);
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);

	}

}
