package br.com.SonhoMeuCp.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/finalizarCompra")
public class FinalizarCompra extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FinalizarCompra() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		double total = Double.parseDouble(request.getParameter("total"));
		System.out.println("total da compra: R$" + total);
		
		PrintWriter out = response.getWriter();

        // Escreve o HTML que deseja retornar
        out.println("<html>");
        out.println("<head><title>Pagamento</title></head>");
        out.println("<body>");
        out.println("<h2>Falta: criar pagina de cobranca</h2>");
        out.println("<h1>"+"total da compra: R$" + total+"</h1>");
        // Aqui está o <h1> que você deseja exibir
        out.println("</body>");
        out.println("</html>");
        
        // Fecha o PrintWriter
        out.close();
		
		
	}

}
