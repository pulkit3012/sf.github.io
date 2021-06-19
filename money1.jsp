<%-- 
    Document   : money1
    Created on : 14 Jun, 2021, 2:48:19 PM
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
        <form action ="transferto.jsp">
       <%
                 try
                 {
                     
                     String q = session.getAttribute("Name").toString();
                     out.print(""+q);
                 // String sCommand = request.getParameter("command");  
                 // out.print("sCommand");
                   String pa = request.getParameter("n1");
                   int s = Integer.parseInt(pa);
                   out.print(""+s);
                   session.setAttribute("pay", s);
                
                   Connection conn = null;
                   Statement st = null;
                   Class.forName("com.mysql.jdbc.Driver");
      
                   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ju?","root","root");
       st = conn.createStatement();
                   String sql = "SELECT Current_balane FROM bank_details WHERE Name = '"+q+"'";       
       
     ResultSet rs = st.executeQuery(sql);
           
              
                       if(rs.next())
                       {
                      
                    int balance = rs.getInt("Current_balane");
                           
                  int current_bal = balance - s; 
                 out.print("your balance is:"+current_bal );
                      if(balance>=s)
                       {
                           
                       
                  String sql1 = "UPDATE bank_details " +
                          "SET Current_balane = '"+current_bal+"' WHERE Name = '"+q+"'";
                          st.executeUpdate(sql1);
                       
                 
                          
           request.getRequestDispatcher("transferto.jsp").forward(request, response);
                       }
                      else
                      {
                           request.setAttribute("alertMsg", "insufficient balance");
            
            
           request.getRequestDispatcher("view.jsp").include(request, response);
    
           String message = (String)request.getAttribute("alertMsg");
 

                %>

                    <script type="text/javascript">
                        var msg = "<%=message%>";
                        
                             alert(msg);
                  </script>
     <%       
                   
                      }
                       }
                       else
                       {
             request.getRequestDispatcher("money.jsp").include(request, response);
                       }
                       
             
                       
                 }
            catch(Exception e)
            {
                out.print(" "+e);
            }
            
            
            %>
        </form>
    </body>
</html>
