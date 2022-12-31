<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String cartype = request.getParameter("cartype");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/rent","root","");
        pst = con.prepareStatement("update car set username = ?,password =?,cartype= ? where id = ?");
        pst.setString(1, username);
        pst.setString(2, password);
        pst.setString(3, cartype);
        pst.setString(4, id);
        pst.executeUpdate();        
        %> 
        <script>  
            alert("Record Updateddddd");          
       </script>
    <%            
    }
%> 
   
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V1</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../css/util.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
<!--===============================================================================================-->
</head>
<body>	
    <div class="limiter">
	<div class="container-login100">
            <div class="wrap-login100">
		<div class="login100-pic js-tilt" data-tilt>
                    <span class="login100-form-title">Ford Mustang</span>
                    <img src="../images/product/mustng.png" alt=""/>
		</div>
                <form class="login100-form validate-form" method="POST" action="#" >
                    <%
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/rent","root","");
                        
                        String id = request.getParameter("id");
                        
                    pst = con.prepareStatement("select * from car where id = ?");
                    pst.setString(1, id);
                    rs = pst.executeQuery();
                    
                    while(rs.next()) {
                    %> 
                    <span class="login100-form-title">Araba Kirala</span>
                    <div class="wrap-input100 validate-input">
			<input class="input100" type="text" name="username" value="<%= rs.getString("username")%>" readonly/>
			<span class="focus-input100"></span>
			<span class="symbol-input100">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
			</span>
                    </div>
                    <div class="wrap-input100 validate-input" style="display: none">
			<input class="input100" type="text" name="password" value="<%= rs.getString("password")%>"/>
			<span class="focus-input100"></span>
			<span class="symbol-input100">
                            <i class="fa fa-lock" aria-hidden="true"></i>
			</span>
                    </div>
                    <div class="wrap-input100 validate-input">
                        <span class="txt3">Şu Anki arabanız</span>
			<input class="input100" type="text" value="<%= rs.getString("cartype")%>" readonly/>
			<span class="focus-input100"></span>
			<span class="symbol-input100">
                            <i class="fa fa-lock" aria-hidden="true"></i>
			</span>
                    </div>
                    <div class="wrap-input100 validate-input">
                        <span class="txt3">Kiralayacağınız Araba</span>
			<input class="input100" type="text" name="cartype" value="Ford Mustang"/>
			<span class="focus-input100"></span>
			<span class="symbol-input100">
                            <i class="fa fa-lock" aria-hidden="true"></i>
			</span>
                    </div>
                    
                    <div class="container-login100-form-btn">
                        <input class="login100-form-btn" type="submit"value="Kirala" name="submit"/>
                    </div>
                    <div class="text-center p-t-136">
			<a class="txt2" href="main.jsp?id=<%=id%>">
                            Geri Dön
                            <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
			</a>
                    </div>
                    <% }  %>
		</form>
            </div>
	</div>
    </div>	


<!--===============================================================================================-->	
	<script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/bootstrap/js/popper.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="../js/main.js"></script>
</body>
</html>