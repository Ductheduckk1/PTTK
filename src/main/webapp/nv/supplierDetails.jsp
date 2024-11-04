<%-- 
    Document   : supplierDetails
    Created on : Nov 3, 2024, 3:09:54 PM
    Author     : HP
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.nhanvien.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Nhập Hàng Nhà Cung Cấp</title>
    <style>
        table {
            width: 60%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Chi Tiết Nhập Hàng</h2>

    <%
        // Nhận tham số ID nhà cung cấp và ngày bắt đầu, ngày kết thúc
        int supplierId = Integer.parseInt(request.getParameter("id"));
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        // Khởi tạo DAO
        supplierDAO supplierDao = new supplierDAO();

        // Lấy danh sách nhập hàng cho nhà cung cấp theo ID
        List<String> purchaseDetails = supplierDao.getDetails(supplierId, startDate, endDate);
    %>

    <!-- Bảng hiển thị chi tiết nhập hàng -->
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Ngày nhập</th>
                <<th>Xem chi tiết</th>
            </tr>
        </thead>
        <tbody>
            <% if (purchaseDetails != null && !purchaseDetails.isEmpty()) {
                for (String detail : purchaseDetails) {
                    String[] parts = detail.split(" "); // Tách ngày, số lượng và ghi chú
                    String id = parts[0];
                    String date = parts[1];
                    
            %>
                <tr>
                    <td><%= id %></td>
                    <td><%= date %></td>
                    <td><a href="xemhoadon.jsp?id=<%= id %>">Xem Chi Tiết</a></td>
                </tr>
            <%
                }
            } else {
            %>
                <tr>
                    <td colspan="3">Không có dữ liệu nào cho nhà cung cấp này.</td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <!-- Link quay lại trang thống kê -->
    <br>
    <a href="supplier.jsp?startDate=<%= startDate %>&endDate=<%= endDate %>">Quay lại</a>
</body>
</html>

