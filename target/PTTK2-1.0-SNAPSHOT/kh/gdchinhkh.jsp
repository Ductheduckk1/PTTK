<%-- 
    Document   : gdchinhkh
    Created on : Nov 1, 2024, 8:52:45 PM
    Author     : HP
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Trang chu khach hang</title>
    </head>
    <body>
        <%
            Thanhvien sv = (Thanhvien) session.getAttribute("khachhang");
            if (sv == null) {
                response.sendRedirect("dangnhap.jsp?err=timeout");
            }
        %>
        <h2> Trang chủ khách hàng </h2>
        <button onclick="window.location.href='timkiem.jsp'">Tìm kiếm món ăn</button>
    </body>
</html>