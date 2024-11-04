<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.nhanvien.*" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Nhà Cung Cấp</title>
    <style>
        table {
            width: 50%;
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
        a {
            text-decoration: none;
            color: blue;
        }
    </style>
    <script>
        function toggleDateInputs() {
            const dateInputs = document.getElementById("dateInputs");
            dateInputs.style.display = dateInputs.style.display === "none" ? "block" : "none";
        }
    </script>
</head>
<body>
    <h2>Danh Sách Nhà Cung Cấp</h2>

    <!-- Nút "Thống kê theo ngày" -->
    <button onclick="toggleDateInputs()">Thống kê theo ngày</button>

    <!-- Form nhập ngày bắt đầu và kết thúc (ẩn theo mặc định) -->
    <div id="dateInputs" style="display: none; margin-top: 10px;">
        <form method="get" action="supplierbyday.jsp">
            <label for="startDate">Ngày bắt đầu:</label>
            <input type="date" id="startDate" name="startDate" required>

            <label for="endDate">Ngày kết thúc:</label>
            <input type="date" id="endDate" name="endDate" required>

            <button type="submit">Thống kê</button>
        </form>
    </div>

    <!-- Bảng hiển thị danh sách nhà cung cấp -->
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên Nhà Cung Cấp</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Khởi tạo DAO và lấy danh sách nhà cung cấp
                supplierDAO supplierDao = new supplierDAO();
                List<String> supplierList = supplierDao.getDanhsach();
                
                if (supplierList != null && !supplierList.isEmpty()) {
                    for (String supplier : supplierList) {
                        String[] parts = supplier.split(" "); // Tách ID và tên nhà cung cấp
                        int id = Integer.parseInt(parts[0]);
                        String name = supplier.substring(parts[0].length()).trim(); // Tên nhà cung cấp
            %>
                    <tr>
                        <td><%= id %></td> <!-- ID nhà cung cấp -->
                        <td>
                            <a href="supplierDetails.jsp?id=<%= id %>">
                                <%= name %>
                            </a>
                        </td> <!-- Tên nhà cung cấp -->
                    </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="2">Không có nhà cung cấp nào.</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
