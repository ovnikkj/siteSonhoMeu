package br.com.fiap.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.fiap.connectionFactory.Conexao;
import br.com.fiap.model.Usuario;

public class UsuarioDAO {

	// Método para inserir um novo usuário no banco de dados
	public void inserirUsuario(Usuario usuario) {
		Connection conexao = null;
		PreparedStatement stmt = null;

		try {

			conexao = Conexao.conectar();

			String sql = "INSERT INTO Usuario (nome, email, senha, sexo) VALUES (?, ?, ?, ?)";
			stmt = conexao.prepareStatement(sql);

			stmt.setString(1, usuario.getNome());
			stmt.setString(2, usuario.getEmail());
			stmt.setString(3, usuario.getSenha());
			stmt.setString(4, usuario.getSexo());

			stmt.executeUpdate();
			System.out.println("Usuário inserido com sucesso!");

		} catch (SQLException e) {
			System.out.println("Erro ao inserir usuário: " + e.getMessage());
		}
	}

	public boolean verificarUsuario(String nome, String senha) {
		boolean existe = false;
		Connection connection = null;
		ResultSet rs = null;
		try {
			connection = Conexao.conectar();

			String sql = "SELECT COUNT(*) FROM USUARIO WHERE NOME = ? AND SENHA =?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, nome);
			stmt.setString(2, senha);
			rs = stmt.executeQuery();
			if (rs.next() && rs.getInt(1) > 0) {
				return existe = true;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		System.out.println("usuario e senha nao correspondem");
		return existe=false;
	}
}
