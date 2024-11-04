<%-- 
    Document   : doDangnhap
    Created on : Nov 1, 2024, 8:48:57 PM
    Author     : HP
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.ArrayList,dao.*,model.*"%>
<%
    String username = (String) request.getParameter("username");
    String password = (String) request.getParameter("password");
    Thanhvien tv = new Thanhvien();
    tv.setUsername(username);
    tv.setPassword(password);
    ThanhvienDAO dao = new ThanhvienDAO();
    boolean kq = dao.checkLogin(tv);
    if (kq && (tv.getVaitro().equalsIgnoreCase("KH"))) {
        session.setAttribute("khachhang", tv);
        response.sendRedirect("kh\\gdchinhkh.jsp");
    } else if (kq && (tv.getVaitro().equalsIgnoreCase("NVQL"))) {
        session.setAttribute("nhanvien", tv);
        response.sendRedirect("nv\\gdchinhnv.jsp");
    } else {
        response.sendRedirect("gdDangnhap.jsp?err=fail");
    }
%>