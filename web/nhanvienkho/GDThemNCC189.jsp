<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.NhaCungCapDAO189, model.NhaCungCap189" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang thêm nhà cung cấp</title>
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
            }
            .container h2 {
                font-weight: bold;
                text-align: center;
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
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }
            .form-group label {
                width: 120px;
                font-weight: bold;
            }
            .form-group input {
                width: calc(100% - 110px);
                padding: 8px;
                border: 1px solid #000;
                border-radius: 4px;
            }
            .buttons {
                margin-top: 20px;
                text-align: center;
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
            NhaCungCapDAO189 nccDAO = new NhaCungCapDAO189();
            NhaCungCap189 ncc = null;
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String ten = request.getParameter("ten");
                String diaChi = request.getParameter("diaChi");
                String soDienThoai = request.getParameter("soDienThoai");
                
                ncc = new NhaCungCap189(ten, diaChi, soDienThoai);
                
                boolean kq = nccDAO.themNcc(ncc);
                if(kq) {
                    response.sendRedirect("GDChonNCC189.jsp");
                }
                else {
                    errorMessage = "Lưu nhà cung cấp không thành công. Vui lòng thử lại.";
                }
            }
        %>
        <div class="container">
            <div class="back-button">
                <button onclick="goBack()">Quay lại</button>
            </div>
            <h2>THÊM MỚI NHÀ CUNG CẤP</h2>
            <% if (errorMessage != null) { %>
                <div class="error-message"><%= errorMessage %></div>
            <% } %>
            <form action="GDThemNCC189.jsp" method="post">
                <div class="form-group">
                    <label for="ten">Tên:</label>
                    <input type="text" id="ten" name="ten" required>
                </div>
                <div class="form-group">
                    <label for="diaChi">Địa chỉ:</label>
                    <input type="text" id="diaChi" name="diaChi" required>
                </div>
                <div class="form-group">
                    <label for="soDienThoai">Số điện thoại:</label>
                    <input type="text" id="soDienThoai" name="soDienThoai" required>
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
