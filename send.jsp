<%-- 
    Document   : send
    Created on : 12 Jun, 2021, 7:31:37 PM
    Author     : Dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     
        
              <style>
            body{
                margin:0;
            }
            .header{
                background-color: #de5285;
                padding: 20px;
                text-align: center;
            }
            .img{
                width: 200px;
                height: 180px;
            }
                        
            ul{
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #565656;
            }
            li{
                float:left;
            }
            li a{
                display:block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }
            li a:hover:not(.active) {
                 background-color: #565656;
            }

            .active{
               background-color: #565656;
             }
             
li a, .dropbtn {
  display: inline-block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
  background-color: #111;
}

li.dropdown {
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1;}

.dropdown:hover .dropdown-content {
  display: block;
}
  .b{
       margin-top:  0;
       margin-left: 0;
       padding: 0;
       width: 250px;
       height: 250px;
   }
       
   
.button {
  display: inline-block;
  padding: 15px 25px;
  font-size: 20px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: white;
  background-color: #de5285;
  border: none;
  border-radius: 10px;
  box-shadow: 0 8px #999;
}

.button:hover {background-color: #de5285}

.button:active {
  background-color: #de5285;
  box-shadow: 0 4px #666;              
  transform: translateY(4px);
}
.box{
    text-align: center;
    height: 30px;
    font-size: 20px;
}
.footer{
                background-color: #de5285;
                padding: 10px;
                align: left;
            }
            .contact{
                width: 30px;
                height: 20px;
               
            }
            .phone{
                width: 30px;
                height: 20px;
            }
            .mail{
                width: 30px;
                height: 20px;
            }
            .address{
                width: 30px;
                height: 20px;
            }
        </style>
        </head>
    <body>
   
        <form action="money.jsp" style="text-align:center;">
          <div class="header">
    <h1><img class="img" align="center" src="https://media-exp1.licdn.com/dms/image/C560BAQFgHU3sTF4LfQ/company-logo_200_200/0/1519895156650?e=2159024400&v=beta&t=1iqBaESC2l4UUW7JjEjq0R_HQhwRTaaqyQG1k46q4bs"></h1>        
            <h3>Online Banking System</h3>
            
      </div>
         <ul>
            <li><a class="active" href="#home">Home</a></li>
            
           
            <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Contact</a>
    <div class="dropdown-content">
        <h4>Contact</h4>
        <p><b>Chief Manager</b>:- Mr. XYz<br>  xyzkkk4@gmail.com<br>  9999988888</p>
        <p><b>Manager </b>:- Mr. stu<br>  stu32hy@gmail.com<br>   8888855554</p>
        <p><b>Deputy Manager</b>:- Mr. gyu<br>   gyu678@gmail.com<br>  4411775566</p>
       
    </div>
            <li><a href="about.jsp">About</a></li>
         </ul> 
        <%
            try
            {
        String sCommand = request.getParameter("command");
            session.setAttribute("Name",sCommand);
             // out.println(sCommand);
                
               Connection con = null;
               Statement st = null;
               Class.forName("com.mysql.jdbc.Driver");
               con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ju?","root","root");
               st = con.createStatement();
             String sql = "SELECT * from bank_details WHERE Name ='"+sCommand+"'";
             st.executeQuery(sql);
   ResultSet rs = st.executeQuery(sql);
     
               while(rs.next())
              {
            
                  String n = rs.getString("Name");
                    String e = rs.getString("Email");
                      int c = rs.getInt("Current_balane");
                  %>
                    <form action="" style="text-align:center">
            <b><label style="text-align: center; font-size: 25px; color: #990073">Customer Account Details</label></b><br><br>
            <br><br>       <b>    <label style="font-size:15px"> Name:</label></b>
            <input type="text" name="t1" value="<%= ""+n%> " ><br><br>
            <b><label style="font-size: 15px"> Email:</label></b>
            <input type="text" name="t2" value="<%= ""+e%> "><br><br>
            <b><label style="font-size: 15px">Current balance:</label></b>
            <input type="text" name="t3" value="<%= ""+c%> "><br><br>
           <br><br><br>      
           <button class="button"><a href="money.jsp" style="color:white;">Next</a></button>
                  
         <%   }
            }
            catch(Exception e)
            {
                out.print(""+e);
            }
           
            %>
             </form>
            <br>    <br><br><br><br>     <div class="footer">
            <img class="contact" src="phone.png"><b>+919413335004  ||   +919309369438</b><br>
            <img class="phone" src="contact.jpg"><b>0141-23039777</b><br>
            <img class="mail" src="mail.png"><b>pbnbank2021@gmail.com</b><br>
            <img class="address" src="address.png"><b>Head office:--plot-234,kalyan vihar,jaipur(302019)</b>
       
        </div>
    </body>
</html>
