<%-- 
    Document   : xembaocao
    Created on : Nov 3, 2024, 2:04:54 PM
    Author     : HP
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Xem báo cáo</title>
    </head>
    <body>
        <%
            Thanhvien nv = (Thanhvien) session.getAttribute("nhanvien");
            if (nv == null) {
                response.sendRedirect("dangnhap.jsp?err=timeout");
            }
        %>
        <h2> Xem báo cáo</h2>
        <button onclick="window.location.href='supplier.jsp'">Xem báo cáo nhà cung cấp</button>
    </body>
</html>
