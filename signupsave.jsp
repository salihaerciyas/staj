<%@ page contentType="text/html;UTF-8" pageEncoding="UTF-8" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>

<%!

public int generateId(Connection c){
	
	   Statement stmt = null;

	   int count  = 0;
	   
	   try {
       	 stmt = c.createStatement();

        ResultSet rs = stmt.executeQuery( "SELECT * FROM hesaplar;" );
      
       	 while ( rs.next() ) {
           count++;
       	 }
	   
       	stmt.close();
	   }
	   catch (Exception e) {
	         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	         System.exit(0);
	    }
	
       return count+1;
}


%>
<% 
	String kullaniciadi = (String)request.getParameter("kullaniciadi");
	String sifre = (String)request.getParameter("sifre");
	
	if(kullaniciadi == null || kullaniciadi.isEmpty() ||sifre == null || sifre.isEmpty()){
		response.sendRedirect("error.jsp");
	}else{
%>
        <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
    	<link href="./resources/css/style.css" rel="stylesheet">
        <body>
		<div class="container">
		        
			<jsp:include page="header.jspf" />
	     
		</div>
	
	</body>
<%
		try {
			String driver = "org.postgresql.Driver";
			String url = "jdbc:postgresql://localhost:5432/kullanici";
			String username = "postgres";
			String password = "postgres";
			Connection c = null;
			Statement stmt = null;
		      
			Class.forName(driver);
		    c = DriverManager.getConnection(url,username,password);
		    c.setAutoCommit(false);
		    
		    System.out.println("Opened database successfully");

		    stmt = c.createStatement();
		    int id = generateId(c);
		    String sql = "INSERT INTO hesaplar(id, username, password) VALUES ('" + Integer.toString(id) + "','" + kullaniciadi + "','" + sifre + "');";
		    stmt.executeUpdate(sql);
		    		    
		    stmt.close();
	        c.commit();
	        c.close();
		}
		catch(ClassNotFoundException e){
				e.printStackTrace();
		}
		catch (Exception e) {
	         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	         System.exit(0);
	    }
		
}
%>
 
 <%=kullaniciadi %> kullanıcısı sisteme başarı ile kaydedilmiştir.
	
