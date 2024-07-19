package jp.ac.jc21;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet(urlPatterns = { "/product" })
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	final String dbServer = "192.168.54.231";
	final String dbPort = "3306";
	final String dbName = "test2023";
	final String user = "test2023";
	final String pass = "test2023";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String url = "jdbc:mysql://"+dbServer+"/"+dbName;
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().append("<h2>Connect to : ").append(url).append("</h2>");
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection  conn = DriverManager.getConnection(url, user, pass);
			
			String sql ="SELECT MAKER_CODE,MAKER_NAME FROM MAKER";
			
			PreparedStatement statement = conn.prepareStatement(sql);
			
			ResultSet rs = statement.executeQuery();
			
			ArrayList<String[]> product = new ArrayList<>();
			while(rs.next()==true) {
				String[] s = new String[3];
				s[0]=rs.getString("MAKER_CODE");
				s[1]=rs.getString("MAKER_NAME");
				product.add(s);
			}
			request.setAttribute("product",product);
			
			
			
			String sql1 ="SELECT PRODUCT_CODE,PRODUCT_NAME,MAKER_CODE FROM PRODUCT";
			
			PreparedStatement statement1 = conn.prepareStatement(sql1);
			
			String code = request.getParameter("product1");
			statement.setString(1,code);
			
			ResultSet rs1 = statement1.executeQuery();
			
			ArrayList<String[]> product2 = new ArrayList<>();
			while(rs1.next()==true) {
				String[] s1 = new String[4];
				s1[0]=rs1.getString("PRODUCT_CODE");
				s1[1]=rs1.getString("PRODUCT_NAME");
				s1[2]=rs1.getString("MAKER_CODE");
				product2.add(s1);
			}
			request.setAttribute("product2",product2);
			
			
			
			RequestDispatcher rd =
					request.getRequestDispatcher("/WEB-INF/jsp/product.jsp");
			rd.forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}


	}

}
