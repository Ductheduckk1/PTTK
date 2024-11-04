<%-- 
    Document   : foodDetail
    Created on : Nov 2, 2024, 10:45:57 AM
    Author     : HP
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.Map" %>
<%@ page import="dao.khachhang.*,model.*" %> 
<%
    int foodId = Integer.parseInt(request.getParameter("id"));
    Map<String, String> foodDetails = null;
    foodDetailDAO foodDetailDAO = new foodDetailDAO();
    foodDetails = foodDetailDAO.getFoodDetails(foodId);


%>

<<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết món ăn</title>
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
        <h1>Chi tiết món ăn</h1>
        <ul class="food-details">
            <% if (foodDetails != null && !foodDetails.isEmpty()) { %>
                <li>
                    <span class="food-name">Mã món ăn:</span>
                    <p class="food-description"><%= foodDetails.get("id") %></p>
                </li>
                <li>
                    <span class="food-name">Tên món ăn:</span>
                    <p class="food-description"><%= foodDetails.get("name") %></p>
                </li>
                <li>
                    <span class="food-name">Mô tả:</span>
                    <p class="food-description"><%= foodDetails.get("description") %></p>
                </li>
                <li>
                    <span class="food-name">Giá:</span>
                    <p class="food-description"><%= foodDetails.get("price") %> VND</p>
                </li>
            <% } else { %>
                <li>Không tìm thấy thông tin món ăn.</li>
            <% } %>
        </ul>
        <a href="timkiem.jsp" class="back-link">Quay lại</a>
    </div>
</body>
</html>
