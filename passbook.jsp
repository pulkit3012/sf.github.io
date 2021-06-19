<%-- 
    Document   : passbook
    Created on : 14 Jun, 2021, 11:19:00 PM
    Author     : Dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Time"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                background-color: #333;
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
                 background-color: #111;
            }

            .active{
               background-color: #990073;
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
  background-color: #99073;
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
   
        <form action="index.jsp" style="text-align:center;">
       <% 
        try   
            {
                
                
            Connection conn = null;
            Statement st = null;
            Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ju?","root","root");
        st = conn.createStatement();
            
                           int p = session.getAttribute("pay").hashCode();
                    String q = session.getAttribute("Name").toString();
                String x = session.getAttribute("rec").toString();
              //  out.print(""+x);
                LocalDate d = LocalDate.now();
                  LocalTime t = LocalTime.now();
    
           
        String sql = "INSERT INTO pass VALUES('"+q+"','"+x+"','"+p+"','"+d+"','"+t+"')";
        st.execute(sql);
        
            ResultSet rs = st.executeQuery("SELECT * FROM pass");  %>
          <table  border=1 width=50% >
              <center>
            <tr>
                <th>Sender_Name</th>
                <th>Reciever_Name</th>
                     <th>Paid_Amount</th>
                 <th>Date</th>
                 <th>Time</th>
            </tr>
 
      
      <%
            while(rs.next())
           {
                String t1 = rs.getString("Time");
              //  out.print(" "+t1);
                String d1 = rs.getString("Date");
                // out.print(" "+d1);
                int p1 = rs.getInt("paid_Amount");
                 //out.print(" "+p1);
                String r1 = rs.getString("Reciever_Name");
                 //out.print(" "+r1);
                String s1 = rs.getString("Sender_Name");
                // out.print(" "+s1);
                 
  out.print("<tr><td>"+s1+"</td><td>"+r1+"</td><td>"+p1+"</td><td>"+d1+"</td><td>"+t1+"</td></tr>");
            }
    
            }
            catch(Exception e)
            {
                out.print(""+e);
            }
          
    %>
          </table>
      </center>
          <button class="button">Home</button> 
        </form>
     <div class="footer">
            <img class="contact" src="phone.png"><b>+919413335004  ||   +919309369438</b><br>
            <img class="phone" src="contact.jpg"><b>0141-23039777</b><br>
            <img class="mail" src="mail.png"><b>pbnbank2021@gmail.com</b><br>
            <img class="address" src="address.png"><b>Head office:--plot-234,kalyan vihar,jaipur(302019)</b>
        </div>
     
    </body>
</html>
