<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.MonAn189, dao.MonAnDAO189" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chi tiết món ăn</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-color: #f0f0f0;
            }
            .container {
                width: 50vw;
                height: 70vh;
                padding: 20px;
                background-color: white;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                position: relative;
            }
            .container h2 {
                margin-top: 0;
                margin-bottom: 20px;
            }
            .back-button {
                display: flex;
                margin-bottom: 20px;
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
                /*max-width: 100px;*/
            }
            .back-button:hover {
                background-color: #0056b3;
            }
            .info {
                text-align: left;
                margin: 20px;
            }
            .info p {
                margin: 10px 0;
            }
            .label {
                font-weight: bold;
            }
        </style>
    </head>

    <body>
        <%
            MonAnDAO189 monAnDAO = new MonAnDAO189();
            MonAn189 monAn = null;
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                System.out.println(id);
                monAn = monAnDAO.getTtMonAn(id);
            }
            catch(Exception e) {
                System.out.println(e);
            }
        %>
        <div class="container">
            <button onclick="goBack()" class="back-button">Quay lại</button> 
            <h2>Thông tin chi tiết món ăn <%= monAn.getTen() %></h2>
            <div class="info">
                <p><span class="label">Tên món ăn:</span> <%= monAn.getTen() %></p>
                <p><span class="label">Giá:</span> <%= monAn.getDonGia() %>  VND</p>
                <p><span class="label">Mô tả:</span> <%= monAn.getMoTa() %> </p>
            </div>
        </div>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </body>
</html>
