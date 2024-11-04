<%-- 
    Document   : gdchinhnv
    Created on : Nov 3, 2024, 1:59:22 PM
    Author     : HP
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Trang chu nhan vien</title>
    </head>
    <body>
        <%
            Thanhvien nv = (Thanhvien) session.getAttribute("nhanvien");
            if (nv == null) {
                response.sendRedirect("dangnhap.jsp?err=timeout");
            }
        %>
        <h2> Trang chủ nhân viên </h2>
        <button onclick="window.location.href='xembaocao.jsp'">Xem báo cáo</button>
    </body>
</html>