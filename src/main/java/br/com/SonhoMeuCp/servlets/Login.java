package br.com.SonhoMeuCp.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.websocket.Session;

import java.io.IOException;

import br.com.fiap.dao.UsuarioDAO;

@WebServlet ("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Login() {
        super();
      
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("chamou");
		String username = request.getParameter("username");
		UsuarioDAO usuariodao = new UsuarioDAO();
		String senha = request.getParameter("senha");
		if(usuariodao.verificarUsuario(username,senha)) {
			System.out.println("usuario encontrado no nosso banco de dados");
			request.getSession().setAttribute("username", username);
			response.sendRedirect("index.jsp");
			request.getSession().setAttribute("falhou", false);
			request.getSession().setAttribute("logado", true);
			
		}else{System.out.println("login falhou");
		request.getSession().setAttribute("falhou", true);
			response.sendRedirect("login.jsp");}
		
		
		
		
		

	}

}
