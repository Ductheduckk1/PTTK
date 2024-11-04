<%-- 
    Document   : supplierbyday
    Created on : Nov 3, 2024, 2:59:05 PM
    Author     : HP
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.nhanvien.*" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thống Kê Nhà Cung Cấp Theo Ngày</title>
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
        <h2>Thống Kê Nhà Cung Cấp Theo Ngày</h2>

        <%
            // Nhận tham số ngày bắt đầu và ngày kết thúc từ form
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");

            // Khởi tạo DAO và lấy danh sách thống kê
            supplierDAO supplierDao = new supplierDAO();
            List<String> statisticsList = supplierDao.getListbyday(startDate, endDate);
        %>

        <!-- Bảng hiển thị kết quả thống kê -->
        <table>
            <thead>
                <tr>
                    <th>ID Nhà Cung Cấp</th>
                    <th>Tên Nhà Cung Cấp</th>
                    <th>Số Lần Nhập</th>
                </tr>
            </thead>
            <tbody>
                <% if (statisticsList != null && !statisticsList.isEmpty()) {
                        for (String record : statisticsList) {
                            String[] parts = record.split(" "); // Tách ID, tên nhà cung cấp và số lần nhập
                            int id = Integer.parseInt(parts[0]);
                            String name = record.substring(parts[0].length() + 1, record.lastIndexOf(" ")).trim();
                            String count = parts[parts.length - 1];
                %>
                <tr>
                    <td><%= id%></td>
                    <td><a href="supplierDetails.jsp?id=<%= id%>&startDate=<%= startDate%>&endDate=<%= endDate%>"><%= name%></a></td> <!-- Liên kết đến trang chi tiết nhà cung cấp -->
                    <td><%= count%></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="3">Không có dữ liệu nào cho khoảng thời gian này.</td>
                </tr>
                <% }%>
            </tbody>
        </table>
        <!-- Link quay lại trang trước -->
        <br>
        <a href="javascript:void(0);" onclick="goBack()">Quay lại</a>
        <script>
            function goBack() {
                // Kiểm tra xem có ít nhất một trang trong lịch sử
                if (document.referrer) {
                    window.location.href = document.referrer; // Quay lại trang trước
                } else {
                    // Nếu không có trang trước đó, quay về trang mặc định
                    window.location.href = "supplier.jsp"; // Thay thế bằng trang mặc định của bạn
                }
            }
        </script>
    </body>
</html>
