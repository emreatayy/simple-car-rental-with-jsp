<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
 
    if(request.getParameter("submit")!=null)
    {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String room = request.getParameter("car");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/rent","root","");
        pst = con.prepareStatement("insert into car(username,password,cartype)values(?,?,?)");
        pst.setString(1, username);
        pst.setString(2, password);
        pst.setString(3, room);
        pst.executeUpdate();  
        
        %>
    <script>  
        alert("Record Adddeddddd");    
    </script>
    <%            
    }
   %>
<!DOCTYPE html>
<html>
<head>
  <title>Ana sayfa</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!--enable mobile device-->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!--fontawesome css-->
      <link rel="stylesheet" href="../css/font-awesome.min.css" />
      <!--bootstrap css-->
      <link rel="stylesheet" href="../css/bootstrap.min.css" />
      <!--animate css-->
      <link rel="stylesheet" href="../css/animate-wow.css" />
      <!--main css-->
      <link rel="stylesheet" href="../css/style.css" />
      <link rel="stylesheet" href="../css/bootstrap-select.min.css" />
      <link rel="stylesheet" href="../css/slick.min.css" />
      <!--responsive css-->
      <link rel="stylesheet" href="../css/responsive.css" />
</head>
<body>
      <div class="page-content-product">
         <div class="main-product">
            <div class="container">
               <div class="row clearfix">
                  <div class="find-box">
                      <h1>Merhaba <%=session.getAttribute("username")%></h1>
                     <h1>Kiralamak İstediğin Arabayı Seç</h1>
                  </div>
               </div>
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
                        
                                while(rs.next())
                                {
                %>
                
               <div class="row clearfix">
                  <div class="col-lg-3 col-sm-6 col-md-3">
                     <a href="update1.jsp?id=<%=id%>">
                        <div class="box-img">
                           <h4>Honda Acura</h4>
                           <img src="../images/product/1.png" alt="" />
                        </div>
                     </a>                  </div>
                  <div class="col-lg-3 col-sm-6 col-md-3">
                     <a href="update2.jsp?id=<%=id%>">
                        <div class="box-img">
                           <h4>Ferrari</h4>
                           <img src="../images/product/ferrari.png" alt=""/>
                        </div>
                     </a>
                  </div>
                  <div class="col-lg-3 col-sm-6 col-md-3">
                     <a href="update3.jsp?id=<%=id%>">
                        <div class="box-img">
                           <h4>Bugatti</h4>
                           <img src="../images/product/bugatti.png" alt=""/>
                        </div>
                     </a>
                  </div>
                  <div class="col-lg-3 col-sm-6 col-md-3">
                     <a href="update4.jsp?id=<%=id%>">
                        <div class="box-img">
                           <h4>Mercedes</h4>
                           <img src="../images/product/Mercedes.png" alt=""/>
                        </div>
                     </a>
                  </div>
                  <div class="col-lg-3 col-sm-6 col-md-3">
                     <a href="update5.jsp?id=<%=id%>">
                        <div class="box-img">
                           <h4>Aston Martin</h4>
                           <img src="../images/product/aston martin.png" alt=""/>
                        </div>
                     </a>
                  </div>
                  <div class="col-lg-3 col-sm-6 col-md-3">
                     <a href="update6.jsp?id=<%=id%>">
                        <div class="box-img">
                           <h4>Bentley</h4>
                           <img src="../images/product/benttle.png" alt=""/>
                        </div>
                     </a>
                  </div>
                  <div class="col-lg-3 col-sm-6 col-md-3">
                     <a href="update7.jsp?id=<%=id%>">
                        <div class="box-img">
                           <h4>Lexus</h4>
                           <img src="../images/product/lexus.png" alt=""/>
                        </div>
                     </a>
                  </div>
                  <div class="col-lg-3 col-sm-6 col-md-3">
                     <a href="update8.jsp?id=<%=id%>">
                        <div class="box-img">
                           <h4>Ford Mustang</h4>
                           <img src="../images/product/mustng.png" alt=""/>
                        </div>
                     </a>
                  </div>
                   <% } %>
               </div>
            </div>
         </div>
      </div>
      <!--main js--> 
      <script src="../js/jquery-1.12.4.min.js"></script> 
      <!--bootstrap js--> 
      <script src="../js/bootstrap.min.js"></script> 
      <script src="../js/bootstrap-select.min.js"></script>
      <script src="../js/slick.min.js"></script> 
      <script src="../js/wow.min.js"></script>
      <!--custom js--> 
      <script src="../js/custom.js"></script>
   </body>
</html>