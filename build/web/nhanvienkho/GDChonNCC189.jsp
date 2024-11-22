<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.NhaCungCap189, dao.NhaCungCapDAO189, model.NhanVien189" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang tìm nhà cung cấp</title>
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
                width: 60vw;
                height: 70vh;
                background-color: white;
                border: 1px solid #ccc;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .container h2 {
                text-align: center;
                margin-bottom: 20px;
            }
            .back-button {
                margin-bottom: 10px;
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
            .search-container {
                display: flex;
                justify-content: space-between;
                margin-bottom: 15px;
            }
            
            .search-container form {
                display: flex;
                justify-content: space-between;
                min-width: 80%;
            }
            
            .search-container input[type="text"] {
                width: 80%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .search-container button {
                padding: 8px 15px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .search-container button:hover {
                background-color: #0056b3;
            }

            .table-container {
                height: 300px;
                overflow: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }
            table, th, td {
                border: 1px solid #ccc;
                padding: 8px;
                text-align: center;
            }
            th {
                background-color: #f8f8f8;
                position: sticky;
                top: 0;
            }
            .info-text {
                font-size: 0.9em;
                color: #555;
            }
        </style>
    </head>
    <body>
        <%
            
            NhaCungCapDAO189 nccDAO = new NhaCungCapDAO189();
            List<NhaCungCap189> dsNcc = null;
            String tenNcc = request.getParameter("tenncc");
            if(tenNcc != null) {
                dsNcc = nccDAO.timNccTheoTen(tenNcc);
                
            }
            else {
                dsNcc = nccDAO.getDsNhaCungCap();
            }
            session.setAttribute("dsNcc", dsNcc);
        %>
        <div class="container">
            <div class="back-button">
                <button onclick="goBack()">Quay lại</button>
            </div>
            <h2>TÌM NHÀ CUNG CẤP</h2>

            <div class="search-container">
                <form method="get">
                    <input type="text" name="tenncc" placeholder="Tìm kiếm...">
                    <button type="submit">Tìm kiếm</button>
                </form>
                <button onclick="goToGDThemNcc()">Thêm mới</button>
            </div>

            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên nhà cung cấp</th>
                            <th>Địa chỉ</th>
                            <th>Số điện thoại</th>
                            <th>Chọn</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (dsNcc != null && !dsNcc.isEmpty()) { 
                            int index = 1;
                            for (NhaCungCap189 ncc : dsNcc) { %>
                        <tr >
                            <td><%= index++ %></td>
                            <td><%= ncc.getTen() %></td>
                            <td><%= ncc.getDiaChi() %></td>
                            <td><%= ncc.getSoDienThoai() %></td>
                            <td><button onclick="xuLyChon1Ncc('<%= ncc.getId() %>', '<%= ncc.getTen() %>')">click để chọn</button></td>
                        </tr>
                        <%   } 
                    } else { %>
                        <tr>
                            <td colspan="5" style="text-align: center;">Không tìm thấy nhà cung cấp nào</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        <script>
            function goBack() {
                window.location.href = "GDNhapNL189.jsp";
            }

            function xuLyChon1Ncc(id, name) {
                const result = confirm("Bạn muốn chọn nhà cung cấp: " + name);
                if (result)
                    window.location.href = "GDNhapNL189.jsp?action=themncc&&idNhaCungCap=" + id;
            }

            function goToGDThemNcc() {
                window.location.href = "GDThemNCC189.jsp";
            }
        </script>
    </body>
</html>
