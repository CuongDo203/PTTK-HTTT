<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.NhanVien189, dao.NhaCungCapDAO189, model.NhaCungCap189, model.NguyenLieu189, model.NguyenLieuNhap189" %>
<%@page import="java.util.List, java.util.ArrayList, org.json.JSONArray, org.json.JSONObject" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang nhập nguyên liệu</title>
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
            .main-content {
                display: flex;
                align-items: flex-start;
            }
            .button-container {
                display: flex;
                flex-direction: column;
                margin-right: 20px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .button-container button {
                padding: 10px;
                margin-bottom: 10px;
                width: 150px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .button-container button:hover {
                background-color: #0056b3;
            }
            .info-table-container {
                flex: 1;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .info {
                margin-bottom: 10px;
                padding-bottom: 10px;
            }
            .table-container {
                width: 100%;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid #ccc;
                padding: 8px;
                text-align: center;
            }
            th {
                background-color: #f8f8f8;
            }
            .table-footer {
                text-align: right;
                padding: 8px;
                font-weight: bold;
            }
            .confirm-button {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }
            .confirm-button button {
                padding: 10px 20px;
                background-color: #28a745;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .confirm-button button:hover {
                background-color: #218838;
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
            .delete-text {
                font-size: 0.8em;
                color: #555;
            }
        </style>
    </head>
    <body>
        <%
            NhanVien189 nvk = (NhanVien189)session.getAttribute("nhanvienkho");
            NhaCungCap189 nccDuocChon = null;
            List<NguyenLieuNhap189> dsNLNhap = null;
            if(session.getAttribute("nccDuocChon") != null) {
                nccDuocChon = (NhaCungCap189)session.getAttribute("nccDuocChon");
            }
            
            float tongTien = 0;
            if(session.getAttribute("dsNLNhap") != null) {
                dsNLNhap = (List<NguyenLieuNhap189>)session.getAttribute("dsNLNhap");
                for(int i = 0; i < dsNLNhap.size(); i++) {
                    tongTien += (dsNLNhap.get(i).getGia() * dsNLNhap.get(i).getSoLuong());
                }
            }
           
            String action = request.getParameter("action");
            if(action != null && action.equalsIgnoreCase("themnl")){
                dsNLNhap = (List<NguyenLieuNhap189>)session.getAttribute("dsNLNhap");
            }
            else if(action != null && action.equalsIgnoreCase("themncc")) {
                if(request.getParameter("idNhaCungCap") != null) {
                    int idNccDuocChon = Integer.parseInt(request.getParameter("idNhaCungCap"));
                    List<NhaCungCap189> dsNcc = (List<NhaCungCap189>)session.getAttribute("dsNcc");
                    for(NhaCungCap189 ncc : dsNcc) {
                        if(ncc.getId() == idNccDuocChon){
                            nccDuocChon = ncc;
                            session.setAttribute("nccDuocChon", nccDuocChon);
                            break;
                        }
                    }
                }
            }
        %>
        <div class="container">
            <div class="back-button">
                <button onclick="goBack()">Quay lại</button>
            </div>
            <h2>NHẬP NGUYÊN LIỆU</h2>
            <div class="main-content">
                <div class="button-container">
                    <form action="GDChonNCC189.jsp" method="get">
                        <button>Chọn nhà cung cấp</button>
                    </form>
                    <form action="GDChonNL189.jsp" method="get">
                        <button>Chọn nguyên liệu</button>
                    </form>
                </div>
                <div class="info-table-container">
                    <div class="info">
                        <p>Nhân viên nhập kho: <%= nvk!=null ? nvk.getTen() : "" %></p>
                        <p>Bên cung cấp: <%= nccDuocChon != null ? nccDuocChon.getTen() : "" %></p>
                        <p>Địa chỉ: <%= nccDuocChon != null ? nccDuocChon.getDiaChi() : "" %></p>
                        <p>Số điện thoại: <%= nccDuocChon != null ? nccDuocChon.getSoDienThoai() : "" %></p>
                    </div>
                    <form id="confirmForm" action="GDNhapNL189.jsp" method="post">
                        <table>
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Tên</th>
                                    <th>Đơn vị</th>
                                    <th>Đơn giá</th>
                                    <th>Số lượng</th>
                                    <th>Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                if(dsNLNhap != null && !dsNLNhap.isEmpty()) {
                                    for(int i = 0; i < dsNLNhap.size(); i++) {%> 

                                <tr >
                                    <td><%= i+1 %></td>
                                    <td> <%= dsNLNhap.get(i).getNguyenLieu().getTen() %> </td>
                                    <td> <%= dsNLNhap.get(i).getNguyenLieu().getDonVi() %> </td>
                                    <td id="donGia<%= i %>"><%= dsNLNhap.get(i).getGia() %></td>
                                    <td><%= dsNLNhap.get(i).getSoLuong() %></td>
                                    <td id="price<%= i %>"><%= dsNLNhap.get(i).getGia() * dsNLNhap.get(i).getSoLuong() %></td>
                                </tr>
                                <%
                                    }
                                %>
                                <%
                                    }
                                %>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="5" class="table-footer">Tổng:</td>
                                    <td id="total-price"><%= tongTien %></td>
                                </tr>
                            </tfoot>
                        </table>
                        <input type="hidden" name="dsNLNhapQuantityData" id="dsNLNhapQuantityData">
                    </form>
                </div>
            </div>
            <div class="confirm-button">
                <button onclick="xuatHoaDon()">Xác nhận</button>
            </div>

            

        </div>
        <script>
            function goBack() {
                window.location.href = "GDChinhNVKho189.jsp";
            }

            function xuatHoaDon() {
                window.location.href = "GDInHoaDon189.jsp";
            }

        </script>
    </body>
</html>
