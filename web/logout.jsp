<%-- 
    Document   : logout
    Created on : Sep 19, 2017, 1:15:30 PM
    Author     : Md. Emran Hossain
--%>
<%
    session.setAttribute("idUser", null);
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
