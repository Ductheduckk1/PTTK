<%-- 
    Document   : xemhoadon
    Created on : Nov 3, 2024, 3:43:55 PM
    Author     : HP
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.Map" %>
<%@ page import="dao.nhanvien.*,model.*" %> 
<%
    int Id = Integer.parseInt(request.getParameter("id"));
    Map<String, String> Details = null;
    hoadonDAO dao = new hoadonDAO();
    Details = dao.getDetails(Id);

%>

<<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết hóa đơn</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .container {
                max-width: 800px;
                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }
            .food-details {
                list-style-type: none;
                padding: 0;
            }
            .food-details li {
                padding: 10px 0;
                border-bottom: 1px solid #ddd;
            }
            .food-details li:last-child {
                border-bottom: none;
            }
            .food-name {
                font-weight: bold;
                color: #444;
            }
            .food-description {
                color: #666;
                margin-top: 5px;
            }
            .back-link {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #4CAF50;
                text-decoration: none;
                font-weight: bold;
            }
            .back-link:hover {
                color: #388E3C;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Chi tiết hóa đơn</h1>
            <ul class="food-details">
                <% if (Details != null && !Details.isEmpty()) {%>
                <li>
                    <span class="food-name">Mã hóa đơn:</span>
                    <p class="food-description"><%= Details.get("id")%></p>
                </li>
                <li>
                    <span class="food-name">Tên mặt hàng:</span>
                    <p class="food-description"><%= Details.get("name")%></p>
                </li>
                <li>
                    <span class="food-name">Số lượng:</span>
                    <p class="food-description"><%= Details.get("quantity")%></p>
                </li>
                <li>
                    <span class="food-name">Tổng tiền:</span>
                    <p class="food-description"><%= Details.get("tongtien")%> </p>
                </li
                <li>
                    <span class="food-name">Nhà cung cấp:</span>
                    <p class="food-description"><%= Details.get("s_name")%> </p>
                </li>
                <li>
                    <span class="food-name">Nhân viên kho:</span>
                    <p class="food-description"><%= Details.get("tv_name")%></p>
                </li>
                <% } else { %>
                <li>Không tìm thấy thông tin món ăn.</li>
                    <% }%>
            </ul>
            <a href="javascript:void(0);" onclick="goBack()">Quay lại</a>

        </div>
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
