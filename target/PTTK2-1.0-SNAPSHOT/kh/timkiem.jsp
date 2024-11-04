<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.List" %>
<%@ page import="dao.khachhang.*" %> 
<%
    TimkiemDAO dao = new TimkiemDAO();
    String keyword = request.getParameter("keyword");
    List<String> foodList = dao.getDanhsach(keyword);
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tìm Kiếm Món Ăn</title>
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
</head>
<body>
    <h2>Tìm Kiếm Món Ăn</h2>

    <!-- Form tìm kiếm -->
    <form method="get" action="timkiem.jsp">
        <input type="text" name="keyword" placeholder="Nhập tên món ăn" value="<%= keyword != null ? keyword : "" %>">
        <button type="submit">Tìm kiếm</button>
    </form>

    <h3>Danh Sách Món Ăn:</h3>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên món ăn</th>
            </tr>
        </thead>
        <tbody>
            <% if (foodList != null && !foodList.isEmpty()) { %>
                <% for (String foodItem : foodList) { %>
                    <% String[] parts = foodItem.split(" "); // Tách ID và tên món ăn %>
                    <tr>
                        <td><%= parts[0] %></td> <!-- ID món ăn -->
                        <td><a href="foodDetail.jsp?id=<%= parts[0] %>"><%= foodItem.substring(parts[0].length()).trim() %></a></td> <!-- Tên món ăn -->
                    </tr>
                <% } %>
            <% } else { %>
                <tr>
                    <td colspan="2">Không tìm thấy món ăn nào.</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>