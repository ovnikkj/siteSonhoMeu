package br.com.fiap.connectionFactory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

    // URL do banco de dados, usuário e senha
    private static final String URL = "jdbc:oracle:thin:@oracle.fiap.com.br:1521:orcl";
    private static final String USER = "rm94947"; // Substitua pelo seu usuário
    private static final String PASSWORD = "051203"; // Substitua pela sua senha

    // Método para conectar ao banco de dados
    public static Connection conectar() throws SQLException {
        try {
            // Carrega o driver JDBC
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver JDBC não encontrado.", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Método para fechar a conexão
    public static void fechar(Connection conexao) {
        if (conexao != null) {
            try {
                conexao.close();
            } catch (SQLException e) {
                System.out.println("Erro ao fechar a conexão: " + e.getMessage());
            }
        }
    }
}
