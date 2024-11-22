<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.NhanVien189, model.NguyenLieu189, dao.NguyenLieuDAO189, model.NguyenLieuNhap189" %>
<%@page import="java.util.List, java.util.ArrayList" %>
<%@page import = "org.json.JSONArray, org.json.JSONObject" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang tìm nguyên liệu</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                width: 70vw;
                background-color: white;
                border: 1px solid #ccc;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin-top: 300px;
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

            .form-search {
                width: 80%;
            }

            .table-container-1 {
                height: 300px;
                overflow: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            table:hover {
                cursor: pointer;
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
            .section-title {
                margin-top: 20px;
                font-weight: bold;
            }
            .ok-button {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }
            .ok-button button {
                padding: 10px 20px;
                background-color: #28a745;
                border: 1px solid #ccc;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
            }
            .ok-button button:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <% 
            NguyenLieuDAO189 nlDAO = new NguyenLieuDAO189();
            List<NguyenLieu189> dsNguyenLieu = null;
            List<NguyenLieuNhap189> dsNguyenLieuNhap = (List<NguyenLieuNhap189>) session.getAttribute("dsNLNhap");
            if(dsNguyenLieuNhap == null) {
                dsNguyenLieuNhap = new ArrayList<>();
            }
            String tenNl = request.getParameter("tennguyenlieu");
            if(tenNl != null) {
                dsNguyenLieu = nlDAO.timNLTheoTen(tenNl);
            }
            else {
                dsNguyenLieu = nlDAO.getDsNguyenLieu();
            }
            
            
            if("POST".equalsIgnoreCase(request.getMethod())) {
                String action = request.getParameter("action");
                if(action != null && action.equalsIgnoreCase("them")) {
                    int idNLThem = Integer.parseInt(request.getParameter("id"));
                    for (NguyenLieu189 nl : dsNguyenLieu) {
                        boolean daTonTai = false;
                        for(NguyenLieuNhap189 nln : dsNguyenLieuNhap) {
                            if(nln.getNguyenLieu().equals(nl)) {
                                daTonTai = true;
                                break;
                            }
                        }
                        if(!daTonTai && nl.getId() == idNLThem) {
                            NguyenLieuNhap189 nln = new NguyenLieuNhap189();
                            nln.setNguyenLieu(nl);
                            nln.setGia(nl.getDonGia());
                            dsNguyenLieuNhap.add(nln);
                            break;
                        }
                    }
                    session.setAttribute("dsNLNhap", dsNguyenLieuNhap);
                    StringBuilder html = new StringBuilder();
                    for(int i = 0; i < dsNguyenLieuNhap.size(); i++) {
                        Integer soLuong = dsNguyenLieuNhap.get(i).getSoLuong();
                        html.append("<tr>")
                            .append("<td>").append(i + 1).append("</td>")
                            .append("<td>").append(dsNguyenLieuNhap.get(i).getNguyenLieu().getTen()).append("</td>")
                            .append("<td>").append(dsNguyenLieuNhap.get(i).getNguyenLieu().getDonVi()).append("</td>")
                            .append("<td id=\"donGia").append(i).append("\">")
                            .append(dsNguyenLieuNhap.get(i).getNguyenLieu().getDonGia()).append("</td>")
                            .append("<td><input type=\"number\" min=\"1\" value=\"")
                            .append((soLuong != null && soLuong>0) ? soLuong : 1) // Kiểm tra giá trị của soLuong
                            .append("\" name=\"quantity\" class=\"quantity\"></td>")
                            .append("<td><button onclick=\"xoaNL('")
                            .append(dsNguyenLieuNhap.get(i).getNguyenLieu().getId())
                            .append("')\">click để xóa</button></td>")
                            .append("</tr>");
                    }
                    response.setContentType("text/html;charset=UTF-8");
                    response.getWriter().write(html.toString());
                    return;
                }
                else if(action != null && action.equalsIgnoreCase("xoa")) {
                    int idNLXoa = Integer.parseInt(request.getParameter("id"));
                    for(int i = 0; i < dsNguyenLieuNhap.size(); i++) {
                        if (dsNguyenLieuNhap.get(i).getNguyenLieu().getId() == idNLXoa) {
                            dsNguyenLieuNhap.remove(i); 
                            break;
                        }
                    }
                    session.setAttribute("dsNLNhap", dsNguyenLieuNhap);
                    StringBuilder html = new StringBuilder();
                    for(int i = 0; i < dsNguyenLieuNhap.size(); i++) {
                        Integer soLuong = dsNguyenLieuNhap.get(i).getSoLuong();
                        html.append("<tr>")
                            .append("<td>").append(i + 1).append("</td>")
                            .append("<td>").append(dsNguyenLieuNhap.get(i).getNguyenLieu().getTen()).append("</td>")
                            .append("<td>").append(dsNguyenLieuNhap.get(i).getNguyenLieu().getDonVi()).append("</td>")
                            .append("<td id=\"donGia").append(i).append("\">")
                            .append(dsNguyenLieuNhap.get(i).getNguyenLieu().getDonGia()).append("</td>")
                            .append("<td><input type=\"number\" min=\"1\" value=\"")
                            .append((soLuong != null && soLuong>0) ? soLuong : 1) // Kiểm tra giá trị của soLuong
                            .append("\" name=\"quantity\" class=\"quantity\"></td>")
                            .append("<td><button onclick=\"xoaNL('")
                            .append(dsNguyenLieuNhap.get(i).getNguyenLieu().getId())
                            .append("')\">click để xóa</button></td>")
                            .append("</tr>");
                    }
                    response.setContentType("text/html;charset=UTF-8");
                    response.getWriter().write(html.toString());
                    return;
                }
                else if(action != null && action.equalsIgnoreCase("chonxong")) {
                    String slTheoNguyenLieu = request.getParameter("dsNLNhapSoLuong");
                    if(slTheoNguyenLieu != null) {
                        JSONArray jsonArray = new JSONArray(slTheoNguyenLieu);
                        for (int i = 0; i < jsonArray.length(); i++) { 
                            JSONObject obj = jsonArray.getJSONObject(i);
                            int soLuong = obj.getInt("soLuong");
                            if(soLuong < 1) {
                            %>
                                <script>
                                    alert("Số lượng ít nhất là 1!");
                                    window.history.back();
                                </script>
                            <%
                                return;
                            }
                            dsNguyenLieuNhap.get(i).setSoLuong(soLuong);
                        }
                    }
                    session.setAttribute("dsNLNhap", dsNguyenLieuNhap);
                    response.sendRedirect("GDNhapNL189.jsp?action=themnl");
                }
            }
            
        %>
        <div class="container">
            <div class="back-button">
                <button onclick="goBack()">Quay lại</button>
            </div>
            <h2>TÌM NGUYÊN LIỆU</h2>
            <div class="search-container">
                <form class="form-search" method="get" > 
                    <input type="text" id="material-name" name="tennguyenlieu" placeholder="Nhập tên nguyên liệu">
                    <button>Tìm kiếm</button>
                </form>
                <button onclick="goToGDThemNL()">Thêm mới</button>
            </div>
            <div class="table-container-1">
                <table id="list-materials">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên nguyên liệu</th>
                            <th>Đơn vị</th>
                            <th>Đơn giá</th>
                            <th>Chọn</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(dsNguyenLieu != null && !dsNguyenLieu.isEmpty()) {
                                for(int i = 0; i < dsNguyenLieu.size(); i++) {%> 

                        <tr >
                            <td><%= i+1 %></td>
                            <td> <%= dsNguyenLieu.get(i).getTen() %> </td>
                            <td> <%= dsNguyenLieu.get(i).getDonVi() %> </td>
                            <td> <%= dsNguyenLieu.get(i).getDonGia() %> </td>
                            <td><button onclick="themNL('<%= dsNguyenLieu.get(i).getId() %>')">click để chọn</button></td>
                        </tr>
                        <%
                            }
                        %>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div class="section-title">Danh sách nguyên liệu nhập</div>
            <div class="table-container-1">
                <table id="selected-materials">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên nguyên liệu</th>
                            <th>Đơn vị</th>
                            <th>Đơn giá</th>
                            <th>Số lượng</th>
                            <th>Xóa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        if(dsNguyenLieuNhap != null && !dsNguyenLieuNhap.isEmpty()) {
                            for(int i = 0; i < dsNguyenLieuNhap.size(); i++) {
                            Integer soLuong = dsNguyenLieuNhap.get(i).getSoLuong();
                        %> 

                        <tr>
                            <td><%= i+1 %></td>
                            <td> <%= dsNguyenLieuNhap.get(i).getNguyenLieu().getTen() %> </td>
                            <td> <%= dsNguyenLieuNhap.get(i).getNguyenLieu().getDonVi() %> </td>
                            <td id="donGia<%= i %>"> <%= dsNguyenLieuNhap.get(i).getNguyenLieu().getDonGia() %> </td>
                            <td><input type="number" min="1" value="<%= (soLuong != null && soLuong>0) ? soLuong : 1 %>" name="quantity" class="quantity"></td>
                            <td class="info-text"><button onclick="xoaNL('<%= dsNguyenLieuNhap.get(i).getNguyenLieu().getId() %>')">
                                    click để xóa
                                </button></td>
                        </tr>
                        <%
                            }
                        %>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <form id="confirmForm" action="GDChonNL189.jsp?action=chonxong" method="post">
                    <input type="hidden" name="dsNLNhapSoLuong" id="dsNLNhapSoLuong">
                </form>
            </div>
            <div class="ok-button">
                <button onclick="chonXongNguyenLieu()">OK</button>     <!--GDNhapNL189.jsp?action=themnl-->
            </div>
        </div>
        <script>
            function goBack() {
                window.location.href = "GDNhapNL189.jsp?action=back";
            }

            function timNLTheoTen(event) {
                event.preventDefault();
                const tenNguyenLieu = $("#material-name").val();
                $.ajax({
                    url: "GDChonNL189.jsp",
                    method: "GET",
                    data: {tennguyenlieu: tennguyenlieu},
                    dataType: "html",
                    success: function (response) {
                        $("#list-materials tbody").empty();
                        $("#list-materials tbody").append(response);
                    },
                    error: function (xhr, status, error) {
                        console.error("Error:", error);
                    }
                });
                return false;
            }

            function themNL(id) {
                $.ajax({
                    url: "GDChonNL189.jsp",
                    method: "POST",
                    data: {action: "them", id: id},
                    dataType: "html", // Nhận dữ liệu là HTML thay vì JSON
                    success: function (response) {
                        $("#selected-materials tbody").empty();
                        $("#selected-materials tbody").append(response);
                    },
                    error: function (xhr, status, error) {
                        console.error("Error:", error);
                    }
                });
            }

            function xoaNL(id) {
                $.ajax({
                    url: "GDChonNL189.jsp",
                    method: "POST",
                    data: {action: "xoa", id: id},
                    dataType: "html",
                    success: function (response) {
                        $("#selected-materials tbody").empty();
                        $("#selected-materials tbody").append(response);
                    },
                    error: function (xhr, status, error) {
                        console.error("Error:", error);
                    }
                });
            }

            function chonXongNguyenLieu() {
                const dsNLSoLuong = [];
                document.querySelectorAll('.quantity').forEach((input, index) => {
                    const quantity = parseInt(input.value) || 0;
                    const nguyenLieu = {
                        ten: document.getElementById('donGia' + index).closest('tr').children[1].innerText,
                        soLuong: quantity
                    };
                    dsNLSoLuong.push(nguyenLieu);
                });
                document.getElementById("dsNLNhapSoLuong").value = JSON.stringify(dsNLSoLuong);
                document.getElementById("confirmForm").submit();
            }

            function goToGDThemNL() {
                window.location.href = "GDThemNL189.jsp";
            }

        </script>
    </body>
</html>
