<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.NguoiDungDAO189, model.NguoiDung189"%>
<%@page import="dao.NhanVienDAO189, model.NhanVien189, model.KhachHang189" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang đăng nhập</title>
        <style>
            /* Đặt nền và căn giữa */
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-color: #f0f2f5;
                font-family: Arial, sans-serif;
            }

            /* Khung đăng nhập */
            .login-container {
                width: 100%;
                max-width: 400px;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
                border-radius: 8px;
                text-align: center;
            }

            .login-container h2 {
                margin-bottom: 20px;
                color: #333;
            }

            .login-container label {
                display: block;
                text-align: left;
                font-weight: bold;
                margin-bottom: 5px;
                color: #333;
            }

            /* Ô nhập liệu */
            .login-container input[type="text"],
            .login-container input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            /* Nút đăng nhập */
            .login-container input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #4CAF50;
                border: none;
                color: white;
                font-weight: bold;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .login-container input[type="submit"]:hover {
                background-color: #45a049;
            }

            /* Thông báo lỗi */
            .error-message {
                color: red;
                margin-top: 15px;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <% 
                if (request.getParameter("err") != null && request.getParameter("err").equalsIgnoreCase("timeout")) {
            %>
            <p style="color: red">Hết phiên làm việc. Làm ơn đăng nhập lại!</p>
            <%
                } else if (request.getParameter("err") != null && request.getParameter("err").equalsIgnoreCase("fail")) {
            %> 
            <p style="color: red">Sai tên đăng nhập/mật khẩu!</p>           
            <%
                }
            %>
            <h2>Đăng nhập</h2>
            <form method="post">
                <label for="username">Tên người dùng:</label>
                <input type="text" id="username" name="username" required><br><br>

                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" required><br><br>

                <input type="submit" value="Đăng Nhập">
            </form>
            <%
                // Kiểm tra thông tin đăng nhập khi người dùng gửi yêu cầu
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    NguoiDung189 nd = new NguoiDung189();
                    nd.setTaiKhoan(username);
                    nd.setMatKhau(password);
                    NguoiDungDAO189 nguoiDungDAO = new NguoiDungDAO189();
                    boolean kq = nguoiDungDAO.kiemTraDangNhap(nd);
                    if (kq && (nd.getVaiTro().equalsIgnoreCase("khachhang"))) {
                        KhachHang189 kh = new KhachHang189(nd.getId(), nd.getTaiKhoan(), nd.getTen(), nd.getNgaySinh(), nd.getDiaChi(),
                        nd.getDienThoai(), nd.getVaiTro());
                        session.setAttribute("khachhang", kh);
                        response.sendRedirect("/restaurant/khachhang/GDChinhKH189.jsp");
                    }
                    else if(kq && (nd.getVaiTro().equalsIgnoreCase("nhanvien"))) {
                        NhanVienDAO189 nvDAO = new NhanVienDAO189();
//                        System.out.println("nd id: "+ nd.getId());
                        String vt = nvDAO.getViTri(nd.getId());
                        NhanVien189 nv = new NhanVien189(vt, 
                                                nd.getId(),
                                                nd.getTaiKhoan(),
                                                nd.getTen(),
                                                nd.getNgaySinh(),
                                                nd.getDiaChi(),
                                                nd.getDienThoai(),
                                                nd.getVaiTro());
                        
                        if(vt.equalsIgnoreCase("nvkho")){
                            session.setAttribute("nhanvienkho", nv);
                            response.sendRedirect("/restaurant/nhanvienkho/GDChinhNVKho189.jsp");
                        }
                    } else {
                        response.sendRedirect("nguoidung/dangnhap.jsp?err=fail");
                    }
                }
            %>
        </div>
    </body>
</html>
