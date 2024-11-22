<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.MonAn189, dao.MonAnDAO189" %>
<%@page import="java.util.List, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang tìm món ăn</title>
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
                width: 80vw;
                height: 80vh;
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

            .search-bar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .container input[type="text"] {
                width: calc(100% - 140px);
                padding: 10px;
                margin-right: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .container button {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                background-color: #007bff;
                color: white;
                cursor: pointer;
            }
            .container button:hover {
                background-color: #0056b3;
            }
            .table-container {
                max-height: 50vh; /* Đặt chiều cao tối đa của bảng */
                overflow-y: auto; /* Hiển thị thanh cuộn dọc nếu nội dung vượt quá */
                margin-top: 20px;
            }
            .container table {
                width: 100%;
                border-collapse: collapse;
            }
            .container table, .container th, .container td {
                border: 1px solid #ccc;
            }
            .container th, .container td {
                padding: 10px;
                text-align: left;
            }
            .container th {
                background-color: #f8f8f8;
                position: sticky;
                top: 0; /* Giữ cố định dòng tiêu đề khi cuộn */
                z-index: 1;
            }
        </style>
    </head>
    <% 
        MonAnDAO189 monAnDAO = new MonAnDAO189();
        String tenMon = request.getParameter("tenmon");
        List<MonAn189> dsMonAn = new ArrayList<>();
        if(tenMon!=null) {
            dsMonAn = monAnDAO.getDsMonAnTheoTen(tenMon);
        }
    %>
    <body>
        <div class="container"> 
            <button onclick="goBack()">Quay lại</button> 
            <h2>Tìm món ăn</h2>
            <form method="get">
                <div class="search-bar">
                    <input type="text" placeholder="Nhập tên món ăn" name="tenmon"> 
                    <button type="submit">Tìm kiếm</button> 
                </div>
            </form>
            <h2>Danh sách món ăn</h2>
            <div class="table-container">
                <table> 
                    <thead> 
                        <tr> 
                            <th>TT</th> 
                            <th>Tên</th> 
                            <th>Giá</th> 
                            <th>Xem chi tiết</th>
                        </tr> 
                    </thead> 
                    <tbody> 
                        <% if (tenMon != null && dsMonAn != null && !dsMonAn.isEmpty()) { 
                        int index = 1;
                        for (MonAn189 monAn : dsMonAn) { %>
                        <tr >
                            <td><%= index++ %></td>
                            <td><%= monAn.getTen() %></td>
                            <td><%= monAn.getDonGia() %> VND</td>
                            <td style="display: flex; justify-content: center"><button onclick="goToDetail('<%= monAn.getId() %>')">click để xem</button></td>
                        </tr>
                        <%   } 
                    } else { %>
                        <tr>
                            <td colspan="4" style="text-align: center;">Không tìm thấy món ăn nào</td>
                        </tr>
                        <% } %>
                    </tbody> 
                </table> 
            </div>
        </div>
        <script>
            function goBack() {
                window.location.href = "GDChinhKH189.jsp";
            }
            function goToDetail(id) {
                // Chuyển hướng đến trang chi tiết món ăn với tham số id
                window.location.href = "GDChiTietMonAn189.jsp?id=" + id;
            }
        </script>
    </body>
</html>
