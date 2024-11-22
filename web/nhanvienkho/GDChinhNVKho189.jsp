<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.NhanVien189" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ nhân viên kho</title>
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-color: #f0f2f5;
                font-family: Arial, sans-serif;
            }

            .container {
                text-align: center;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
                border-radius: 8px;
            }

            /* Label cho chữ "Trang chủ" */
            .label-home {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 20px;
                color: #333;
            }

            /* Button cho "Tìm thông tin món ăn" */
            .btnNhapNL, .btn-logout {
                padding: 10px 20px;
                font-size: 16px;
                width: 200px;
                background-color: #4CAF50;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-bottom: 10px;
            }
            
            .btn-logout {
                background-color: #b0b0b0;
            }
            
            .btn-logout:hover {
                background-color: #9e9e9e;
            }
            
            .btnNhapNL:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <%
            NhanVien189 nvk = (NhanVien189)session.getAttribute("nhanvienkho");
            String action = request.getParameter("action");
            if(action == null || action.trim().length() ==0) {
                session.removeAttribute("nccDuocChon");
                session.removeAttribute("dsNLDuocChon");
                session.removeAttribute("dsNLNhap");
            }
        %>
        <div class="container">
            <div class="label-home">Trang chủ nhân viên kho, chào mừng <%= nvk.getTen() %></div>
            <form action="GDNhapNL189.jsp" method="get">
                <input type="submit" class="btnNhapNL" value="Nhập nguyên liệu">
            </form>
            <form action="/restaurant" method="get">
                <input type="submit" class="btn-logout" value="Đăng xuất">
            </form>
        </div>
    </body>
</html>
