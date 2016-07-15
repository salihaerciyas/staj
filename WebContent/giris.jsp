<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
    	<link href="./resources/css/style.css" rel="stylesheet">
</head>
<body>

<% 
	String kullaniciadi = (String)request.getParameter("kullaniciadi");
	String sifre = (String)request.getParameter("sifre");
	
	if(kullaniciadi == null || kullaniciadi.isEmpty() ||sifre == null || sifre.isEmpty()){
		response.sendRedirect("error.jsp");
	}else{
		
%>


	<div class="container">
		<jsp:include page="header.jspf" />
		
		<h1 style="color:purple ;text-align:center">KULLANICILAR</h1>
         <table style="width:100%">
				<tr>
<% 
		String msg ="";
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
			
			    String sql = "SELECT password FROM hesaplar  where username = '" + kullaniciadi + "';";
			    	    
		        ResultSet rs = stmt.executeQuery( sql );
		                
		        if ( rs.next() ) {
		        	int pass = rs.getInt("password");
		        	if ( Integer.parseInt(sifre) == pass) {
		        		System.out.println("Hoşgeldin " + kullaniciadi );
		        		msg = "Hoşgeldin " + kullaniciadi;
		        	}    
		        	else {
		        		
		        		System.out.println("Sayın " + kullaniciadi + " yanlış şifre girdiniz." );
		        		msg = "Sayın " + kullaniciadi + " yanlış şifre girdiniz.";
		        	}
		        }
		        else {
		        	System.out.println( kullaniciadi + " sistemde kayıtlı değildir.");
		        	msg = kullaniciadi + " sistemde kayıtlı değildir." ;
		        }
		        
			    stmt.close();
		        c.commit();
		        c.close();
			}
			catch (Exception e) {
		        System.err.println( e.getClass().getName()+": "+ e.getMessage() );
		        System.exit(0);
		   }
%>
				  <th><%= msg %></th>
				  
				</tr>
				</table>
	</div>
<%
	}
%>

</body>
</html>