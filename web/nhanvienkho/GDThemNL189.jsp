<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.NguyenLieu189, dao.NguyenLieuDAO189" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang thêm nguyên liệu</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-color: #f4f4f4;
            }
            .container {
                width: 400px;
                padding: 20px;
                border: 1px solid #000;
                background-color: #fff;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            .container h2 {
                font-weight: bold;
                margin-bottom: 20px;
            }

            .back-button {
                margin-bottom: 10px;
                text-align: left; /* Căn nút Quay lại sang trái */
            }
            .back-button button {
                padding: 8px 15px;
                background-color: #6c757d;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .back-button button:hover {
                background-color: #5a6268;
            }

            .form-group {
                margin-bottom: 15px;
                text-align: left;
                display: flex;
            }
            .form-group label {
                display: inline-block;
                width: 140px;
                font-weight: bold;
            }
            .form-group input {
                width: calc(100% - 130px);
                padding: 8px;
                border: 1px solid #000;
                border-radius: 4px;
            }
            .buttons {
                margin-top: 20px;
                display: flex;
                justify-content: center;
                gap: 15px;
            }
            .button {
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
                border: 1px solid #000;
                border-radius: 4px;
                background-color: #28a745;
                color: white;
            }
            .button:hover {
                background-color: #218838;
            }
            .error-message {
                color: red;
                font-weight: bold;
                text-align: center;
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <% 
            String errorMessage = null;
            NguyenLieuDAO189 nlDAO = new NguyenLieuDAO189();
            NguyenLieu189 nl = null;
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String tenNguyenLieu = request.getParameter("tenNguyenLieu");
                String donVi = request.getParameter("donVi");
                Float donGia = Float.parseFloat(request.getParameter("donGia"));
                nl = new NguyenLieu189(tenNguyenLieu, donVi, donGia);
                boolean kq = nlDAO.themNl(nl);
                if(kq) {
                    response.sendRedirect("GDChonNL189.jsp");
                }
                else {
                    errorMessage = "Lưu nguyên liệu không thành công. Vui lòng thử lại.";
                }
            }
        %>
        <div class="container">
            <div class="back-button">
                <button onclick="goBack()">Quay lại</button>
            </div>
            <h2>THÊM MỚI NGUYÊN LIỆU</h2>
            <% if (errorMessage != null) { %>
                <div class="error-message"><%= errorMessage %></div>
            <% errorMessage=null;} %>
            <form action="" method="post">
                <div class="form-group">
                    <label for="tenNguyenLieu">Tên nguyên liệu:</label>
                    <input type="text" id="tenNguyenLieu" name="tenNguyenLieu" required>
                </div>
                <div class="form-group">
                    <label for="donVi">Đơn vị:</label>
                    <input type="text" id="donVi" name="donVi" required>
                </div>
                <div class="form-group">
                    <label for="donGia">Đơn giá:</label>
                    <input type="number" id="donGia" name="donGia" required>
                </div>
                <div class="buttons">
                    <button type="submit" class="button">Thêm</button>
                </div>
            </form>
        </div>

        <script>

            function goBack() {
                window.history.back();
            }

        </script>
    </body>
</html>
