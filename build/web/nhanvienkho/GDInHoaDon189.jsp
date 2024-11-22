<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.NhanVien189, model.NguyenLieu189, model.NhaCungCap189, model.NguyenLieuNhap189, model.HoaDonNhapNL189" %>
<%@page import="java.util.List, java.util.Date, java.sql.Timestamp, java.text.SimpleDateFormat, java.util.Objects" %>
<%@page import="dao.HoaDonNhapNLDAO189, dao.NguyenLieuNhapDAO189" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang in hóa đơn</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .container {
                width: 50%;
                margin: auto;
                border: 1px solid #000;
                padding: 20px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }
            h2 {
                text-align: center;
            }
            .info-section, .table-section, .buttons {
                margin-top: 20px;
            }
            .info-section p {
                margin: 5px 0;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 8px;
                text-align: center;
            }
            .total-row {
                font-weight: bold;
            }
            .buttons {
                display: flex;
                justify-content: center;
                gap: 20px;
                margin-top: 20px;
            }
            .buttons button {
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <% 
        if (session.getAttribute("luuThanhCong") != null && (boolean) session.getAttribute("luuThanhCong")) { 
        %>
        <script>
            alert("Nhập nguyên liệu thành công!");
            window.location.href = "GDChinhNVKho189.jsp";
        </script>
        <% session.removeAttribute("luuThanhCong"); %> 
        <% 
            }
        %>
        <% 
            NhanVien189 nvk = (NhanVien189)session.getAttribute("nhanvienkho");
            NhaCungCap189 nccDuocChon = (NhaCungCap189)session.getAttribute("nccDuocChon");
            List<NguyenLieuNhap189> dsNLNhap = (List<NguyenLieuNhap189>)session.getAttribute("dsNLNhap");
            Timestamp ngay = new Timestamp(System.currentTimeMillis());
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
            if(nccDuocChon == null || nvk == null || dsNLNhap == null || dsNLNhap.size() == 0) {
                %>
                <script>
                    alert("Vui lòng chọn đủ thông tin!");
                    window.history.back();
                </script>
                <%
                return;
            }
            float tongTien = 0;
            if(dsNLNhap != null) {
                for(NguyenLieuNhap189 nl : dsNLNhap) {
                    tongTien += (nl.getSoLuong() * nl.getGia());
                }
            }
            
            HoaDonNhapNLDAO189 hdDAO = new HoaDonNhapNLDAO189();
            NguyenLieuNhapDAO189 nlnhapDAO = new NguyenLieuNhapDAO189();
            String action = request.getParameter("action");
            if(action != null && action.equalsIgnoreCase("luu")) {
                HoaDonNhapNL189 hdnhap = new HoaDonNhapNL189();
                hdnhap.setThanhTien(tongTien);
                hdnhap.setNgayTao(ngay);
                hdnhap.setNhaCungCap(nccDuocChon);
                hdnhap.setNhanVien(nvk);
                hdnhap.setDsNguyenLieuNhap(dsNLNhap);
                hdnhap = hdDAO.luuHoaDon(hdnhap);
                if(hdnhap!=null) {
                    for(NguyenLieuNhap189 nl : dsNLNhap) {
                        nl.setHoaDon(hdnhap);
                    }
                    boolean kq = nlnhapDAO.luuDsNguyenLieu(dsNLNhap);
                    if(kq) {
                        session.setAttribute("luuThanhCong", true);
                        response.sendRedirect("GDInHoaDon189.jsp");
                    }
                }
            }
        %>
        <div class="container">
            <h2>HÓA ĐƠN NHẬP NGUYÊN LIỆU</h2>

            <div class="info-section">
                <p>Ngày: <span> <%= sdf.format(ngay) %> </span></p>
                <p>Nhân viên nhập kho: <span><%= nvk.getTen() %></span></p>
                <p>Bên cung cấp: <span> <%= nccDuocChon.getTen() %> </span></p>
                <p>Địa chỉ: <span><%= nccDuocChon.getDiaChi() %></span></p>
                <p>Số điện thoại: <span><%= nccDuocChon.getSoDienThoai() %></span></p>
            </div>

            <div class="table-section">
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
                            <td> <%= dsNLNhap.get(i).getGia() %> </td>
                            <td> <%= dsNLNhap.get(i).getSoLuong() %> </td>
                            <td> <%= dsNLNhap.get(i).getSoLuong() * dsNLNhap.get(i).getGia() %> </td>
                        </tr>
                        <%
                            }
                        %>
                        <%
                            }
                        %>
                    </tbody>
                    <tfoot>
                        <tr class="total-row">
                            <td colspan="5">Tổng:</td>
                            <td><%= tongTien %></td>
                        </tr>
                    </tfoot>
                </table>
            </div>

            <div class="buttons">
                <button type="button" onclick="goBack()">Hủy</button>
                <button type="button" onclick="xuatHoaDon()">Xuất hóa đơn</button>
            </div>
        </div>
        <script>
            function goBack() {
                window.history.back();
            }

            function xuatHoaDon() {
                window.location.href = "GDInHoaDon189.jsp?action=luu";
            }
        </script>
    </body>
</html>
