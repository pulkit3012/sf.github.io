<%-- 
    Document   : transferto1
    Created on : 14 Jun, 2021, 11:42:32 PM
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
        <form action="mesg.jsp">
       <%
    String C = request.getParameter("c");
    session.setAttribute("rec",C);
    //out.print(""+C);
    int m = session.getAttribute("pay").hashCode();
      //out.print(""+m);
         try
         {
            Connection conn = null;
            Statement st = null;
            Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ju?","root","root");
            st = conn.createStatement();
        String sql = "SELECT Current_balane FROM bank_details WHERE Name='"+C+"'";
           st.executeQuery(sql);
          
           ResultSet rs = st.executeQuery(sql);
             
              if(rs.next())
              {
                  int v = rs.getInt("Current_balane");
                  
                  int bala = v + m;
                //  out.print(""+bala);
            String sql1 = "UPDATE bank_details " +
                    "SET Current_balane = '"+bala+"' WHERE Name = '"+C+"'";
                 st.executeUpdate(sql1);
                 
                 request.getRequestDispatcher("mesg.jsp").forward(request, response);
              }
         }
         catch(Exception e)
         {
             out.print(""+e);
         }
    %>
        </form>
    </body>
</html>
