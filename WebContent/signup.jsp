<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
    	<link href="./resources/css/style.css" rel="stylesheet">
    	 <SCRIPT LANGUAGE="JavaScript">
	        function SetDest1() {
	            document.forms["myform"].action = "signupsave.jsp";
	        }
	
	        function SetDest2() {
	            document.forms["myform"].action = "giris.jsp";
	        }

    </script>   
	</head>
	<body>
		
		<div class="container" style="background-color:darkcyan">
		        
			<jsp:include page="header.jspf" />
	
			<div style="width: 100%;" align="center">
			<div style="background-color:#8D6E63; width: 40%; padding: 1%;">
				<form Name="myform" class="form-horizontal" method="post" action="signupsave.jsp">
				   	
				   	<h1>KAYIT SİSTEMİ</h1><br>
				   	
	                  <div class="form-group">
	                  	<div class="col-xs-1  col-sm-1 col-md-1 col-lg-1"></div>
	                  	<div class="col-xs-3  col-sm-5 col-md-5 col-lg-5">
	                  		Kullanıcı Adı
	                  	</div>
	                  	<div class="col-xs-7  col-sm-5 col-md-5 col-lg-5">
	                  		<input name="kullaniciadi" type="text" class="form-control" ></input>
	                  	</div>
	                  	<div class="col-xs-1  col-sm-1 col-md-1 col-lg-1"></div>
	            	</div>
	             	<div class="form-group">
	             		<div class="col-xs-1  col-sm-1 col-md-1 col-lg-1"></div>
	                  	<div class="col-xs-3  col-sm-5 col-md-5 col-lg-5">
	                  		Şifre
	                  	</div>
	                  	<div class="col-xs-7  col-sm-5 col-md-5 col-lg-5">
	          	 		   <input name="sifre" type="password" class="form-control col-sm-5" ></input>
	             		<div class="col-sm-5" style="text-align:right">
	            			
	          			</div>
	          			<div class="col-xs-1  col-sm-1 col-md-1 col-lg-1"></div>
	          		</div>
	                </div>
	         		<div class="form-group">
           				<div class="col-sm-offset-3 col-sm-6">
          					<div class="checkbox">
          						<label  style="text-align:center">
           						<input type="checkbox"> Remember me</label>
      						</div>
    					</div>
  					</div>
					<div class="form-group">
					    
						<div class="col-sm-offset-3 col-sm-6">
						   
					    <input type="submit" class="btn btn-default" value="Kayıt Ol" style="background-color:#C0CA33;text-align:left" OnClick="SetDest1()"></input>
					    <input type="submit" class="btn btn-default" value="Giriş Yap" style="background-color:#C0CA33;text-align:left" OnClick="SetDest2()"></input>
					      
					    </div>
				  </div>
	
			</form>
			</div>
		</div>
	
		</div>
	</body>
</html>