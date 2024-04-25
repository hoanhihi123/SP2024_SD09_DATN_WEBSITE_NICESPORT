
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>2 Bán hàng tại quầy</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
     <link rel="stylesheet" href="/admin/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="/admin/assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <%-- import axios     --%>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>


    <%-- Library jquery support pagination --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-pagination/1.2.7/jquery.pagination.min.js"></script>

    <%--    Khai bao thu vien jquery--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


</head>
<body>
<!-- Left Panel -->
<aside id="left-panel" class="left-panel ">
    <nav class="navbar navbar-expand-sm navbar-default">
        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="">
                    <a href="dashboard_2.html"><i class="menu-icon fa fa-laptop"></i>Dashboard </a>
                </li>
                <li class="menu-title">Bán hàng</li><!-- /.menu-title -->
                <li class="active">
                    <a href="/ban-hang/view" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-file-text-o"></i>Bán hàng tại quầy</a>
                </li>
                <li class="menu-title">Thống kê</li><!-- /.menu-title -->
                <li class="">
                    <a href="dashboard_2.html"><i class="menu-icon fa fa-bar-chart-o"></i>Thống kê doanh thu </a>
                </li>

                <li class="menu-title">Quản lý</li><!-- /.menu-title -->
                <li class="menu-item-has-children dropdown ">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>Quản lý giày</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="fa fa-puzzle-piece"></i><a href="/san-pham/hien-thi">Giày</a></li>
                        <li><i class="fa fa-gear"></i><a href="/chat-lieu/hien-thi">Chất liệu</a></li>
                        <li><i class="fa fa-eraser"></i><a href="/mau-sac/hien-thi">Màu sắc</a></li>
                        <li><i class="fa fa-id-badge"></i><a href="/thuong-hieu/hien-thi">Thương hiệu</a></li>
                        <li><i class="fa fa-arrows-h"></i><a href="/kich-thuoc/hien-thi">Kích cỡ</a></li>
                        <li><i class="fa fa-inbox"></i><a href="/kieu-dang/hien-thi" >Kiểu dáng</a></li>
                        <li><i class="fa fa-suitcase"></i><a href="#">Nhà sản xuất</a></li>
                        <li ><i class="fa fa-sun-o" ></i><a  href="/danh-muc/hien-thi">Dòng sản phẩm</a></li>
                    </ul>

                </li>
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-print" ></i>Quản lý hóa đơn</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="fa fa-puzzle-piece"></i><a href="ui-buttons.html">Xuất hóa đơn</a></li>
                        <li><i class="fa fa-id-badge"></i><a href="ui-badges.html">Quản lý hóa đơn</a></li>
                    </ul>
                </li>

                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-leaf" ></i>Quản lý khuyến mãi</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="fa fa-puzzle-piece"></i><a href="ui-buttons.html">Đợt giảm giá</a></li>
                        <li><i class="fa fa-id-badge"></i><a href="ui-badges.html">Phiếu giảm giá</a></li>
                    </ul>
                </li>

                <li class="">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-pencil-square-o" ></i>Quản lý khách hàng</a>
                </li>
                <li class="">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-users" ></i>Quản lý nhân viên</a>
                </li>


                <li class="">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-user" ></i>Quản lý tài khoản</a>
                </li>

            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside>
<!-- /#left-panel -->

<!-- Left Panel -->

<!-- Right Panel -->

<div id="right-panel" class="right-panel">

    <!-- Header-->
    <header id="header" class="header">
        <div class="top-left">
            <div class="navbar-header">
                <a class="navbar-brand" href="./"><img src="/admin/images/logo.png" alt="Logo"></a>
                <a class="navbar-brand hidden" href="./"><img src="/admin/images/logo2.png" alt="Logo"></a>
                <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
            </div>
        </div>
        <div class="top-right">
            <div class="header-menu">
                <div class="header-left">
                    <div class="for-message" style="margin-top: 15px;">
                        <p>Tên người dùng</p>
                    </div>
                </div>

                <div class="user-area dropdown float-right">
                    <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img class="user-avatar rounded-circle" src="/admin/images/admin.jpg" alt="User Avatar">
                    </a>

                    <div class="user-menu dropdown-menu">
                        <a class="nav-link" href="#"><i class="fa fa-user"></i>My Profile</a>

                        <a class="nav-link" href="#"><i class="fa fa-bell-o"></i>Notifications <span class="count">13</span></a>

                        <a class="nav-link" href="#"><i class="fa fa-cog"></i>Settings</a>

                        <a class="nav-link" href="#"><i class="fa fa-power-off"></i>Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </header><!-- /header -->
    <!-- Header-->

    <div class="breadcrumbs">
        <div class="breadcrumbs-inner">
            <div class="row m-0">
                <div class="col-sm-4">
                    <div class="page-header float-left">
                        <div class="page-title">
                            <h1>Dashboard</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="#">Dashboard</a></li>
                                <li><a href="#">Bán hàng tại quầy</a></li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="breadcrumbs">
        <!-- Nút để tạo tab mới -->
        <div class="row" style="margin-bottom: 20px;">
            <div class="col-lg-10"></div>
            <div class="col-lg-2" >
                <button id="createTabBtn" class="btn btn-primary"><i class="menu-icon fa fa-plus"></i> Tạo hóa đơn</button>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="home-tab" data-bs-toggle="tab" data-bs-target="#hoaDon1" type="button" role="tab" aria-controls="home" aria-selected="true">Hóa đơn 1
                            <span><a href=""  class="btn"><i class="menu-icon fa fa-times fa-lg" style="margin-left: 10px"></i></a></span>
                        </button>
                    </li>
                </ul>
            </div>
            <div class="col-lg-12">
                <div class="tab-content " id="myTabContent">
                    <div class=" row tab-pane fade show active" id="hoaDon1" role="tabpanel" aria-labelledby="home-tab">
                    <!-- Tab 1
                         -->

                        <div class="col-lg-12 container mt-4 " >
                            <div class="animated fadeIn ">
                                <div class="card ">
                                    <div class="card-header">
                                        <div class="row">
                                            <div class="col-lg-9">
                                                <strong class="card-title" style="font-size: 20px;">Danh sách sản phẩm trong hóa đơn</strong>
                                            </div>
                                            <div class="col-lg-3 text-right" >
                                                <strong class="card-title" >
                                                    <a href="#" class="btn btn-success" data-toggle="modal"
                                                       data-target="#chonSanPhamVaoHoaDonCho" onclick="updateDataFromCallAPI_sanPhamChiTiet();"> <i class="menu-icon fa  fa-check-square-o"></i> Chọn sản phẩm</a>
                                                </strong>
                                            </div>

                                        </div>


                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive row">
                                            <table class="table table-bordered table-hover no-wrap " >
                                                <thead>
                                                <tr style="text-align: center;">
                                                    <th scope="col">STT</th>
                                                    <th scope="col">Ảnh</th>
                                                    <th scope="col">Tên</th>
                                                    <th scope="col">Size - màu sắc</th>
                                                    <th scope="col">Đơn giá</th>
                                                    <th scope="col">Số lượng mua</th>
                                                    <th scope="col">Tổng tiền</th>
                                                    <th scope="col">xóa sản phẩm</th>
                                                </tr>
                                                </thead>
                                                <tbody id="danhSachSanPham_duocChonVaoHoaDon">


                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="row" style="margin-top: 20px;">
                                            <div class="col-lg-8">

                                            </div>
                                            <div class="col-lg-4">
                                                <div id="phanTrangChoSanPhamDuocChonVaoHoaDon">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- .animated -->
                        </div><!-- .content -->



                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class=" container col-lg-12" >
                    <div class="animated fadeIn row">
                        <div class="card col-lg-12">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-lg-7">
                                        <strong class="card-title" style="font-size: 20px;">Thông tin khách hàng</strong>
                                    </div>
                                    <div class="col-lg-5 text-right" style="margin-left: 0px;" >
                                        <strong class="card-title" >
                                            <a href="#" class="btn btn-primary" data-toggle="modal"
                                               data-target="#formThemMoiKhachHang"> <i class="menu-icon fa fa-plus"></i> Thêm mới</a>
                                            <a href="#" class="btn btn-success" data-toggle="modal"
                                               data-target="#chonThongTinKhachHang"> <i class="menu-icon fa  fa-check-square-o"></i> Chọn khách hàng</a>

                                        </strong>
                                    </div>

                                </div>


                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <span>Họ và tên:</span>
                                        <input type="text" id="hoVaTenKhachHangDuocChon" placeholder="Khách hàng vãng lai" class="form-control" readonly="true">
                                    </div>
                                    <div class="col-lg-3">
                                        <span>SĐT:</span>
                                        <input type="text" id="SDT_KhachHangDuocChon" placeholder="" class="form-control" readonly="true">
                                    </div>
                                    <div class="col-lg-3">
                                        <span>Email:</span>
                                        <input type="text" id="email_KhachHangDuocChon" placeholder="" class="form-control"  readonly="true">
                                    </div>
                                    <div class="col-lg-3">
                                        <button class="btn btn-secondary" style="margin-top: 24px;">Set mặc định</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- .animated -->
                </div><!-- .content -->

            </div>

            <div class="col-lg-12">
                <div class=" container col-lg-12" >
                    <div class="animated fadeIn row">
                        <div class="card col-lg-12">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <strong class="card-title" style="font-size: 20px;">Thông tin thanh toán</strong>
                                    </div>
                                </div>


                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <span>Hình thức thanh toán</span>
                                        <select name="" class="form-control">
                                            <option value="" class="form-control">Tiền mặt</option>
                                            <option value="" class="form-control">Chuyển khoản</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-6">
                                        <span>Mã giảm giá</span>

                                        <div class="row">
                                            <div class="col-lg-9">
                                                <input type="text" placeholder="Nhập mã giảm giá" class="form-control">
                                            </div>
                                            <a href="#" class="btn btn-success" data-toggle="modal"
                                               data-target="#chonMaGiamGia" onclick="chonMaGiamGia();"> <i class="menu-icon fa  fa-check-square-o" ></i> Chọn</a>
                                        </div>
                                    </div>
                                    <div class="col-lg-12" style="margin-top: 20px;">
                                        <div class="row">
                                            <span class="col-lg-4">Tổng tiền hàng: </span> <span class="col-lg-3" id="tongTienHang">6.500.000</span>
                                        </div>
                                    </div>
                                    <div class="col-lg-12" style="margin-top: 20px;">
                                        <div class="row">
                                            <span class="col-lg-4">Tiền được giảm: </span> <span class="col-lg-3" id="tienDuocGiam" >0</span>
                                        </div>
                                    </div>
                                    <div class="col-lg-12" style="margin-top: 20px;">
                                        <div class="row">
                                            <span class="col-lg-4">Tổng thanh toán: </span> <span class="col-lg-3" id="tongTienThanhToan">0</span>
                                        </div>
                                    </div>
                                    <div class="col-lg-12" style="margin-top: 20px;">
                                        <div class="row">
                                            <div class="col-lg-2">
                                                <button class="btn btn-primary" onclick="taoHoaDonThanhToan();">Thanh toán</button>
                                            </div>
                                            <div class="col-lg-2" style="margin-left:-40px;">
                                                <button class="btn btn-warning">Hủy hóa đơn</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- .animated -->
                </div><!-- .content -->

            </div>
        </div>


    </div>

    <div class="container">
        <div class="modal fade" id="chonSanPhamVaoHoaDonCho" tabindex="-1" role="dialog"
             aria-labelledby="createDiscountModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" style="max-width: 1200px;">
                <div class="modal-content" >
                    <div class="modal-header">
                        <h4 class="modal-title" id="createDiscountModalLabel" style="  margin-left: 10px; font-size: 25px;"><b>Thêm sản phẩm vào hóa đơn chờ</b></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="font-size: 50px; margin-top: -70px;" >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="content" >
                            <div class="animated fadeIn row">
                                <div class="card col-lg-12">
                                    <div class="card-header"  style="background-color: #F7F7F7; padding-bottom: 35px;">
                                        <form action="" class="row">
                                            <div class="col-lg-3">
                                                <span>Nhập tên</span>
                                                <input type="text" class="form-control" placeholder="Tìm theo tên, mô tả">
                                            </div>
                                            <div class="col-lg-3" >
                                                <span>Chọn màu sắc</span>
<%--                                                <input type="text" class="form-control">--%>
                                                <select name="mauSac" class="form-control">
                                                    <option value="">Chọn màu sắc</option>
                                                    <option value="">Màu xanh</option>
                                                    <option value="">Màu trắng</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-3">
                                                <span>Chọn size</span>
<%--                                                <input type="text" class="form-control">--%>
                                                <select name="sizeGiay" class="form-control">
                                                    <option value="">Chọn size giày</option>
                                                    <option value="">36</option>
                                                    <option value="">37</option>
                                                </select>
                                            </div>

                                            <div class="col-lg-3" >
                                                <span>Chọn loại giày</span>
                                                <select name="" id="" class="form-control">
                                                    <option value="" class="form-control">Chọn loại giày</option>
                                                    <option value="" class="form-control">Giày chạy bộ</option>
                                                    <option value="" class="form-control">Giày thể thao</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-5"></div>
                                            <div class="col-lg-2 justify-content-center" style="margin-top: 15px;">
                                                <button class="form-control btn btn-primary" style="margin-top: 24px;">Tìm kiếm</button>

                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-body" style="">
                                        <p>Danh sách sản phẩm </p>
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-hover no-wrap" id="data-table" >
                                                <thead>
                                                <tr style="text-align: center;">
                                                    <th scope="col">STT</th>
                                                    <th scope="col">Ảnh</th>
                                                    <th scope="col">Tên</th>
                                                    <th scope="col">Size - màu sắc</th>
                                                    <th scope="col">Số lượng kho</th>
                                                    <th scope="col">Giá</th>
                                                    <th scope="col">Số lượng mua</th>
                                                    <th scope="col">Thao tác</th>
                                                </tr>
                                                </thead>
                                                <tbody id="table-body-chiTietSP">

                                                </tbody>
                                            </table>

                                            <div id="pagination-container-chiTietSP">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- .animated -->
                        </div><!-- .content -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="modal fade" id="chonThongTinKhachHang" tabindex="-1" role="dialog"
             aria-labelledby="createDiscountModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" style="max-width: 1200px;">
                <div class="modal-content" >
                    <div class="modal-header">
                        <h4 class="modal-title" id="createDiscountModalLabel" style="  margin-left: 10px; font-size: 25px;"><b>Chọn thông tin khách hàng</b></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="font-size: 50px; margin-top: -70px;" >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="content" >
                            <div class="animated fadeIn row">
                                <div class="card col-lg-12">
                                    <div class="card-header"  style="background-color: #F7F7F7; padding-bottom: 35px;">
                                        <div class="row justify-content-center">
                                            <div class="col-lg-5">
                                                <input type="text" id="searchBySDT" class="form-control" placeholder="Nhập SĐT của khách hàng">
                                            </div>
                                            <div class="col-lg-2" style="margin-top: -24px;">
                                                <button onclick="fetchDataToTable_and_pagination_findNumberPhoneOfCustomer();" class="form-control btn btn-primary" style="margin-top: 24px;">Tìm kiếm</button>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="card-body" style="">
                                        <p>Danh sách thông tin khách hàng </p>
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-hover no-wrap" >
                                                <thead>
                                                <tr style="text-align: center;">
                                                    <th scope="col">STT</th>
                                                    <th scope="col">Họ và tên</th>
                                                    <th scope="col">Giới tính</th>
                                                    <th scope="col">SĐT</th>
                                                    <th scope="col">Email</th>
                                                    <th scope="col">Thao tác</th>
                                                </tr>
                                                </thead>
                                                <tbody id="table-body-khachHang">


                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="row" style="margin-top: 20px;">
                                            <div class="col-lg-8">
                                                <button class="btn btn-primary" onclick="handleClearKhachHang();">Làm mới</button>
                                            </div>
                                            <div class="col-lg-4">
                                                <div id="pagination-container-khachHang">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- .animated -->
                        </div><!-- .content -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="modal fade" id="chonMaGiamGia" tabindex="-1" role="dialog"
             aria-labelledby="createDiscountModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" style="max-width: 1200px;">
                <div class="modal-content" >
                    <div class="modal-header">
                        <h4 class="modal-title" id="createDiscountModalLabel" style="  margin-left: 10px; font-size: 25px;"><b>Chọn mã giảm giá</b></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="font-size: 50px; margin-top: -70px;" >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="content" >
                            <div class="animated fadeIn row">
                                <div class="card col-lg-12">
                                    <div class="card-header"  style="background-color: #F7F7F7; padding-bottom: 20px;">

                                         <h3>Danh sách mã giảm giá phù hợp</h3>
                                    </div>
                                    <div class="card-body" style="">

                                        <div class="table-responsive">
                                            <table class="table table-bordered table-hover no-wrap" >
                                                <thead>
                                                    <tr style="text-align: center;">
                                                        <th scope="col">STT</th>
                                                        <th scope="col">Tên</th>
                                                        <th scope="col">Số lượng</th>
                                                        <th scope="col">Ngày bắt đầu</th>
                                                        <th scope="col">Ngày kết thúc</th>
                                                        <th scope="col">Giá trị giảm</th>
                                                        <th scope="col">Hình thức giảm</th>
                                                        <th scope="col">Giá tiền xét điều kiện</th>
                                                        <th scope="col">Thao tác</th>
                                                    </tr>

                                                </thead>
                                                <tbody id="table-body-phieuGiamGia">

                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="row" style="margin-top: 20px;">
                                            <div class="col-lg-8">
                                            </div>
                                            <div class="col-lg-4">
                                                <div id="pagination-container-phieuGiamGia">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- .animated -->
                        </div><!-- .content -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="modal fade" id="formThemMoiKhachHang" tabindex="-1" role="dialog"
             aria-labelledby="createDiscountModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" style="max-width: 800px;">
                <div class="modal-content" >
                    <div class="modal-header">
                        <h4 class="modal-title"  style="  margin-left: 10px; font-size: 25px;"><b>Tạo thông tin khách hàng mới</b></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="font-size: 50px; margin-top: -70px;" >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="content" >
                            <div class="animated fadeIn row">
                                <div class="card col-lg-12">
                                    <div class="card-header"  style="background-color: #F7F7F7; padding-top:10px;">
                                        <h3>Nhập thông tin khách hàng</h3>
                                    </div>
                                    <div class=" card-body" style="">
                                        <form class="row" method="post" action="">
                                            <div class="col-lg-6">
                                                <span>Tên khách hàng <i class="fa fa-asterisk" style="color: red; font-size: smaller;"></i></span>
                                                <input type="text" id="tenKhachHang" class="form-control">
                                            </div>
                                            <div class="col-lg-6">
                                                <span>Số điện thoại <i class="fa fa-asterisk" style="color: red; font-size: smaller;"></i></span>
                                                <input type="text" id="sdtKhachHang" class="form-control">
                                            </div>
                                            <div class="col-lg-12">
                                                <span>Email <i class="fa fa-asterisk" style="color: red; font-size: smaller;"></i></span>
                                                <input type="text" id="emailKhachHang" class="form-control">
                                            </div>
                                            <div class="col-lg-6" style="margin-top: 10px; margin-bottom: 10px;">
                                                <span style="margin-right: 10px;">Giới tính: <i class="fa fa-asterisk" style="color: red; font-size: smaller;"></i> </span>
                                                <input id="gioiTinh1" style="transform: scale(1.5); margin-right: 10px;" name="gioiTinh" checked="true" type="radio" value="1" > Nữ <span style="margin-right: 10px;"></span>
                                                <input id="gioiTinh2" style="transform: scale(1.5); margin-right: 10px;"  name="gioiTinh" checked="true" type="radio" value="1"> Nam <br>
                                            </div>
                                            <div class="col-lg-12">
                                                <span>Địa chỉ cụ thể <i class="fa fa-asterisk" style="color: red; font-size: smaller;"></i></span>
                                                <input type="text" id="diaChiCuTheKhachHang" class="form-control">
                                            </div>

                                            <div class="col-lg-4" style="margin-top: 10px;">
                                                <span>Tỉnh/Thành phố <i class="fa fa-asterisk" style="color: red; font-size: smaller;"></i></span>
                                                <select name="" id="province" class="form-control"></select>
                                            </div>
                                            <div class="col-lg-4" style="margin-top: 10px;">
                                                <span>Quận/huyện <i class="fa fa-asterisk" style="color: red; font-size: smaller;"></i></span>
                                                <select name="" id="district" class="form-control"></select>
                                            </div>
                                            <div class="col-lg-4" style="margin-top: 10px;">
                                                <span>Phường/xã <i class="fa fa-asterisk" style="color: red; font-size: smaller;"></i></span>
                                                <select name="" id="ward" class="form-control"></select>
                                            </div>

                                            <div class="col-lg-12 text-right" style="margin-top: 20px;">
                                                <button class="btn btn-success"> <i class="menu-icon fa fa-plus"></i> Thêm mới</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div><!-- .animated -->
                        </div><!-- .content -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="clearfix"></div>

    <footer class="site-footer">
        <div class="footer-inner bg-white">
            <div class="row">
                <div class="col-sm-6">
                    NiceStore 2024
                </div>
                <div class="col-sm-6 text-right">
                    Designed by <a href="https://colorlib.com">Team SD-09</a>
                </div>
            </div>
        </div>
    </footer>

    <input type="text" id="tabNameCurrent" hidden>

</div><!-- /#right-panel -->

<!-- Right Panel -->

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="/admin/assets/js/main.js"></script>
<script src="/user/js/callAPIAdress.js"></script>


<%--Tạo dữ liệu và phân trang cho hóa đơn chờ --%>
<script>

    var pageLimit = 4; // Số lượng sản phẩm trên mỗi trang

    // lấy ra danh sách hóa dơn chờ
    function getListHoaDonCho() {
        console.log("chạy vào getListHoaDonCho()");
        $.ajax({
            url: "http://localhost:8080/api/ban-hang/getDanhSachHoaDonTheoTrangThai_hoaDonCho",
            type: "GET",
            success: function(data) {
                // kiểm tra data length xem có kết quả ko
                var isCheck = data.length;
                if(isCheck > 0){
                    console.log("Có hóa dơn chờ");
                    console.log(data);
                    // tạo ra các button tabpane mới với số lượng tương ứng = data.size
                    // set id của các tabpane tương ứng với idHoaDon chờ lấy được từ data trả về
                    // Lặp qua dữ liệu để lấy idHoaDonCho
                    var tabContainer = document.getElementById("myTab");
                    tabContainer.innerHTML = ""; // Xóa các tab cũ trước khi tạo mới

                    var lastIndex = data.length - 1;

                    data.forEach(function(item, index) {
                        var idHoaDonCho = item.id;
                        console.log(idHoaDonCho);

                        var tabId = "hoaDon" + (index + 1);
                        var tabName = "Hóa đơn " + (index + 1);

                        var li = document.createElement("li");
                        li.classList.add("nav-item");

                        var button = document.createElement("button");
                        button.classList.add("nav-link");

                        if (index === lastIndex) {
                            button.classList.add("active");
                        }

                        button.setAttribute("id", idHoaDonCho);
                        console.log("id được set : " + idHoaDonCho);
                        button.setAttribute("data-bs-toggle", "tab");
                        button.setAttribute("data-bs-target", "#" + tabId);
                        button.setAttribute("type", "button");
                        button.setAttribute("role", "tab");
                        button.setAttribute("aria-controls", tabId);
                        button.setAttribute("aria-selected", ((index + 1) === 1).toString());
                        button.textContent = tabName;

                        var span = document.createElement("span");
                        var div = document.createElement("div"); // Thay thế thẻ a bằng thẻ div
                        div.classList.add("btn");

                        var iElement = document.createElement("i");
                        iElement.classList.add("menu-icon", "fa", "fa-times", "fa-lg");
                        iElement.style.marginLeft = "10px";

                        // Thêm sự kiện click vào thẻ div
                        div.addEventListener("click", function() {
                            huyHoaDon(idHoaDonCho); // Gọi hàm huyHoaDon và truyền tham số là idHoaDonCho
                        });

                        div.appendChild(iElement);
                        span.appendChild(div);
                        button.appendChild(span);
                        li.appendChild(button);
                        tabContainer.appendChild(li);

                    });

                    // lấy idHoaDon_active
                    var idHoaDon_active = layIDCuaButtonTabPane_active();

                    if(idHoaDon_active!==null){
                        fetchDataAndFillTable_danhSachHoaDonCho();
                        phanTrangSanPhamCT_trongChonHoaDonCho(0,4,idHoaDon_active);
                    }

                    tongTienDonHang(idHoaDon_active).then(function(tongTien) {
                        console.log("Tổng tiền đơn hàng: " + tongTien);
                    }).catch(function(error) {
                        console.log("Đã xảy ra lỗi: " + error);
                    });

                }else{
                    console.log("Không có hóa đơn chờ nào");

                    // tạo 1 hóa đơn chờ trong DB
                    // lấy ra idHoaDonCho => thiết lập vào tabpane id cho button của tabpane
                    tuDongTao_1_hoaDonCho();

                    console.log("chạy xong tự tạo 1 hóa đơn chờ");
                }
            },
            error: function(error) {
                console.log("Error: " + error);
            }
        });
    }

    // hoaDonCho
    // tạo phân trang
    function createPagination_choDanhSach_HoaDonCho(totalPages) {
        console.log("Tạo phân trang cho danh sách hóa đơn chờ");
        var paginationContainer = $("<ul>").addClass("pagination justify-content-end");

        // hoaDonCho
        // Tạo các nút trang
        for (var i = 1; i <= totalPages; i++) {
            var pageItem = $("<li>").addClass("page-item");
            var pageLink = $("<a>").addClass("page-link").attr("href", "#").text(i);
            if (i === 1) {
                pageItem.addClass("active");
            }
            pageItem.append(pageLink);
            paginationContainer.append(pageItem);
        }

        // hoaDonCho
        // Thêm sự kiện click cho các nút trang
        paginationContainer.find(".page-link").not("[aria-disabled='true']").click(function (e) {
            e.preventDefault();
            // Lấy số trang tương ứng khi click
            var currentPage = parseInt($(this).text());
            // Xóa lớp active khỏi tất cả các thẻ <li>
            paginationContainer.find("li").removeClass("active");
            // Thêm lớp active cho thẻ <li> của trang được chọn
            $(this).parent().addClass("active");

            // lấy idHoaDon_active
            var idHoaDon_active = layIDCuaButtonTabPane_active();

            // Gọi hàm để lấy dữ liệu cho trang mới
            phanTrangSanPhamCT_trongChonHoaDonCho((currentPage-1), pageLimit,idHoaDon_active);
        });

        // hoaDonCho
        // Thêm phân trang vào DOM
        $("#phanTrangChoSanPhamDuocChonVaoHoaDon").empty().append(paginationContainer);
    }


    // hoaDonCho
    // lấy dữ liệu từ API để tính tổng số trang
    // => chạy hàm tạo phân trang cho danh sách sản phẩm
    function fetchDataAndFillTable_danhSachHoaDonCho() {
        console.log("Chạy vào fetchDataAndFillTable_danhSachHoaDonCho");
        // lấy idHoaDon_active
        var idHoaDon_active = layIDCuaButtonTabPane_active();
        console.log("IdHoaDon_active : " + idHoaDon_active);
        let data = {
            idHoaDon : idHoaDon_active
        };

        $.ajax({
            url: "http://localhost:8080/api/ban-hang/getDanhSachHoaDonCho_theoIDHoaDonActive",
            type: "POST",
            contentType: "application/json",
            data : JSON.stringify(data),
            dataType : "json", //Kieu du lieu tra ve tu controller la json

            success: function(data) {
                console.log("--------------- Danh sách hóa đơn chờ:  ", data);
                var totalPages = Math.ceil(data.length / pageLimit);
                console.log("Tổng số trang trong danh sách hóa đơn chờ : " + totalPages);
                // Tạo phân trang
                createPagination_choDanhSach_HoaDonCho(totalPages);

                // hiển thị mặc định trang đầu tiên là 1
                currentPage = 1;

                    // tinh tong tien don hang
                    var tongTienDonHang = 0;
                    tongTienDonHang(idHoaDon_active).then(function(tongTien) {
                        tongTienDonHang = tongTien;
                    }).catch(function(error) {
                        console.log("Đã xảy ra lỗi: " + error);
                    });

                    console.log("=>>>>>>>>>>>>>>>>>>> Tổng tiền đơn hàng ở fetch data danh sách hóa đơn chờ: " + tongTienDonHang);

            },
            error: function(error) {
                console.log("Error: " + error);
            }
        });
    }



    // hoaDonCho
    // đổ lại dữ liệu vào bảng sau khi chọn phân trang
    phanTrangSanPhamCT_trongChonHoaDonCho = function( currentPage , pageLimit, idHoaDong) {
        let data = {
            currentPage: currentPage ,
            pageLimit: pageLimit ,
            idHoaDon : idHoaDong
        };

        //$ === jQuery
        jQuery.ajax({
            url : "/ban-hang/phan-trang-hoaDonCho",
            type : "POST",
            contentType: "application/json",
            data : JSON.stringify(data),
            dataType : "json", //Kieu du lieu tra ve tu controller la json

            success : function(jsonResult) {

                var dsHoaDonChiTiet = jsonResult.danhSachHoaDonChiTiet;
                var khachHangCuaHoaDon = jsonResult.khachHangOfHoaDon;

                console.log("Chạy vào hàm : phanTrangSanPhamCT_trongChonHoaDonCho");
                console.log(dsHoaDonChiTiet);

                tongTienDonHang(idHoaDong).then(function(tongTien) {
                    console.log("Tổng tiền đơn hàng: " + tongTien);
                }).catch(function(error) {
                    console.log("Đã xảy ra lỗi: " + error);
                });

                // Điền dữ liệu vào bảng
                fillTableWithData_choHoaDonChiTiet(dsHoaDonChiTiet);
                fetchData_khachHang_lenFormThongTinKhachHang(khachHangCuaHoaDon.hoTen,khachHangCuaHoaDon.soDT, khachHangCuaHoaDon.email);
            },

            error : function(jqXhr, textStatus, errorMessage) {
                //alert(jsonResult.code + ': Luu thanh cong...!')
            }

        });
    }

    // do du lieu len bang danh sach hoa don chi tiet
    function fillTableWithData_choHoaDonChiTiet(data) {
        console.log("Chạy vào hàm fillTableWithData_choHoaDonChiTiet");
        console.log(data);
        // lấy ra content của tBody trong table => xóa content trong đó đi
        var tableBody = $("#danhSachSanPham_duocChonVaoHoaDon");
        tableBody.empty();

        // set lại nội dung cho tbody
        data.forEach(function(item, index) {
            var giaTriSanPham = item.chiTietSanPham.giaTriSanPham;
            var giaTriGiam = item.chiTietSanPham.giaTriGiam > 0 ? item.chiTietSanPham.giaTriGiam : 0;
            var hienThiGiaSanPham = giaTriGiam > 0 ? "<td><del>" + item.chiTietSanPham.giaTriSanPham +"</del> - "+ "<b>"+ giaTriGiam + "</b>" +  "</td>" : "<td>" + item.chiTietSanPham.giaTriSanPham + "</td>" ;

            var row =
                "<tr style='text-align: center;'>" +
                "<td>" + (index + 1) + "</td>" +
                "<td><img width='80px' src='" + item.chiTietSanPham.hinhAnh + "' alt=''></td>" +
                "<td>" + item.chiTietSanPham.sanPham.ten + "</td>" +
                "<td>Size: " + item.chiTietSanPham.kichCo.ten + " - màu: " + item.chiTietSanPham.mauSac.ten + "</td>" +
                hienThiGiaSanPham +
                "<td><input type='text' class='form-control' min='1' value='" + item.soLuong + "' style='width: 70px;' onchange='handleChangeSoLuongMua(this.value, \""+ item.soLuong + "\", \"" + item.chiTietSanPham.id + "\", \"" + item.chiTietSanPham.soLuong + "\")'></td>" +
                "<td>" + item.donGia + "</td>" +
                "<td><a href='#' class='btn btn-warning' onclick='xoaSanPhamKhoiHoaDonCT(\"" + item.hoaDon.id + "\", \"" + item.chiTietSanPham.id + "\", \"" + item.chiTietSanPham.sanPham.ten + "\");'><i class='menu-icon fa fa-trash-o'></i> Xóa</a></td>" +
                "</tr>";


            tableBody.append(row);
        });


    }

    function layIDCuaButtonTabPane_active() {
        // Lấy danh sách tất cả các button trong tab
        var buttons = document.querySelectorAll('.nav-link');

        // Duyệt qua từng button để tìm button có class active
        for (var i = 0; i < buttons.length; i++) {
            if (buttons[i].classList.contains('active')) {
                // Nếu button đó có class active, trả về id của nó
                return buttons[i].getAttribute('id');
            }
        }

        // Nếu không tìm thấy button nào có class active, trả về null
        return null;
    }

    // tự đọng tạo 1 hóa đơn chờ
    function  tuDongTao_1_hoaDonCho(){
        console.log("Chạy vào function thưc hiện tạo 1 hóa đơn chờ ");
        $.ajax({
            url: "http://localhost:8080/ban-hang/tuDongTao1HoaDonCho",
            type: "POST",
            success: function(data) {
                var idHoaDonCho_new = data.idHoaDon;
                console.log("Id hóa đơn chờ mới được tạo : " + idHoaDonCho_new);

                // Lấy tab hiện tại
                var currentTabPane = document.querySelector('.tab-pane.active');

                // Lấy ra button hiện tại
                var button = document.getElementById("home-tab");

                // Đặt id mới cho button
                var newButtonId = idHoaDonCho_new;
                button.setAttribute("id", newButtonId);

            },
            error: function(error) {
                console.log("Error: " + error);
            }
        });
    }

    // tạo tab
    function createTabs(tabCount, data) {
        var tabContainer = document.getElementById("myTab");
        tabContainer.innerHTML = ""; // Xóa các tab cũ trước khi tạo mới

        for (var i = 1; i <= tabCount; i++) {
            var tabId = "hoaDon" + i;
            var tabName = "Hóa đơn " + i;

            var li = document.createElement("li");
            li.classList.add("nav-item");

            var button = document.createElement("button");
            button.classList.add("nav-link");
            if (i === 1) {
                button.classList.add("active");
            }
            button.setAttribute("id", tabId + "-tab");
            button.setAttribute("data-bs-toggle", "tab");
            button.setAttribute("data-bs-target", "#" + tabId);
            button.setAttribute("type", "button");
            button.setAttribute("role", "tab");
            button.setAttribute("aria-controls", tabId);
            button.setAttribute("aria-selected", (i === 1).toString());
            button.textContent = tabName;

            var span = document.createElement("span");
            var a = document.createElement("a");
            a.setAttribute("href", "#");
            a.classList.add("btn");

            var iElement = document.createElement("i");
            iElement.classList.add("menu-icon", "fa", "fa-times", "fa-lg");
            iElement.style.marginLeft = "10px";

            a.appendChild(iElement);
            span.appendChild(a);
            button.appendChild(span);
            li.appendChild(button);
            tabContainer.appendChild(li);
        }
    }


    // hàm thực hiện mỗi lần load trang sẽ thực hiện các hàm bên trong
    document.addEventListener("DOMContentLoaded", function() {
        // lấy ra hóa đơn chờ
        getListHoaDonCho();

    });




    // lấy idHoaDon khi click vào myTab - thành công khi click vào nó
    document.getElementById("myTab").addEventListener("click", function(event) {

        var idHoaDon_active = layIDCuaButtonTabPane_active();
        // layDanhSachHoaDonChiTiet_theoIDHoaDon(idHoaDon_active);
        // console.log("id hóa dơn đang active : " + idHoaDon_active);

        fetchDataAndFillTable_danhSachHoaDonCho();
        phanTrangSanPhamCT_trongChonHoaDonCho(0,4,idHoaDon_active);
    });



</script>


<script>
    // Sử dụng JavaScript để đặt giá trị của trường ngày thành ngày hôm nay
    document.getElementById('dateToday').valueAsDate = new Date();


</script>

<script>
    // tạo tab mới khi bấn click button tạo hóa đơn mới
    document.getElementById("createTabBtn").addEventListener("click", function() {
        var tabCount = document.querySelectorAll("#myTab .nav-link").length;
        var tabContainer = document.getElementById("myTab");

        if (tabCount >= 5) {
            alert("Số lượng tab hóa đơn đã đạt đến giới hạn tối đa là 5.");
            return;
        }

        $.ajax({
            url: "http://localhost:8080/ban-hang/tuDongTao1HoaDonCho",
            type: "POST",
            success: function(data) {
                var idHoaDonCho = data.idHoaDon;
                // console.log("Id hóa đơn chờ thêm mới vào tabpane mới : " + idHoaDonCho);

                var tabId = "hoaDon" + (tabCount + 1);
                var tabName = "Hóa đơn " + (tabCount + 1);

                var li = document.createElement("li");
                li.classList.add("nav-item");

                var button = document.createElement("button");
                button.classList.add("nav-link");

                // Lặp qua tất cả các tab và loại bỏ class "active"
                var navLinks = document.querySelectorAll("#myTab .nav-link");
                navLinks.forEach(function(navLink) {
                    navLink.classList.remove("active");
                });

                // Thêm class "active" cho tab mới
                button.classList.add("active");
                button.setAttribute("id", idHoaDonCho );

                // console.log("Id hóa đơn chờ được set vào TABPANE : " + idHoaDonCho);
                button.setAttribute("data-bs-toggle", "tab");
                button.setAttribute("data-bs-target", "#" + tabId);
                button.setAttribute("type", "button");
                button.setAttribute("role", "tab");
                button.setAttribute("aria-controls", tabId);
                button.setAttribute("aria-selected", ((tabCount + 1)).toString());
                button.textContent = tabName;

                var span = document.createElement("span");
                var div = document.createElement("div"); // Thay thế thẻ a bằng thẻ div

                div.classList.add("btn");

                var iElement = document.createElement("i");
                iElement.classList.add("menu-icon", "fa", "fa-times", "fa-lg");
                iElement.style.marginLeft = "10px";

                // Thêm sự kiện click vào thẻ div
                div.addEventListener("click", function() {
                    huyHoaDon(idHoaDonCho); // Gọi hàm huyHoaDon và truyền tham số là idHoaDonCho
                });

                div.appendChild(iElement);
                span.appendChild(div);
                button.appendChild(span);
                li.appendChild(button);
                tabContainer.appendChild(li);


                var idHoaDon_active = layIDCuaButtonTabPane_active();

                fetchDataAndFillTable_danhSachHoaDonCho();
                phanTrangSanPhamCT_trongChonHoaDonCho(0,4,idHoaDon_active);

            },
            error: function(error) {
                console.log("Error: " + error);
            }
        });
    });

    // lấy idHoaDon khi click vào myTab - thành công khi click vào nó
    // document.getElementById("myTab").addEventListener("click", function(event) {
    //     var idHoaDon_active = layIDCuaButtonTabPane_active();
    //     console.log("id hóa dơn đang active : " + idHoaDon_active);
    // });

    // lấy id của button tabpane đang active => thành công
    function layIDCuaButtonTabPane_active() {
        var activeTabBtn = document.querySelector("#myTab .nav-link.active");
        if (activeTabBtn) {
            return activeTabBtn.getAttribute("id");
        }
        return null;

        // làm sao để set active cho tab đang active ?
        // chuyển active giữa các tab => oke
        // tab hiển thị hiện tại khi load trang => lấy ra tabpane đang active => load ra sản phẩm ra hóa dơn chi tiết

    }


</script>


<%--<script src="/admin/assets/js/fillDataFromAPI.js"></script>--%>

<%-- phân trang sản phẩm chi tiết --%>
<script>
    <%-- đổ dữ liệu và phân trang SanPhamChiTiet   --%>
    // xử lý phân trang final khi lấy dữ liệu được call từ API
    // Hàm gọi API và xử lý dữ liệu
    // var page = 1;
    var pageLimit = 4; // Số lượng sản phẩm trên mỗi trang

    // sanPhamChiTiet
    // tạo phân trang
    function createPagination_choDanhSachSPCT(totalPages) {
        var paginationContainer = $("<ul>").addClass("pagination justify-content-end");

        // Tạo các nút trang
        for (var i = 1; i <= totalPages; i++) {
            var pageItem = $("<li>").addClass("page-item");
            var pageLink = $("<a>").addClass("page-link").attr("href", "#").text(i);
            if (i === 1) {
                pageItem.addClass("active");
            }
            pageItem.append(pageLink);
            paginationContainer.append(pageItem);
        }

        // sanPhamChiTiet
        // Thêm sự kiện click cho các nút trang
        paginationContainer.find(".page-link").not("[aria-disabled='true']").click(function (e) {
            e.preventDefault();
            // Lấy số trang tương ứng khi click
            var currentPage = parseInt($(this).text());
            // Xóa lớp active khỏi tất cả các thẻ <li>
            paginationContainer.find("li").removeClass("active");
            // Thêm lớp active cho thẻ <li> của trang được chọn
            $(this).parent().addClass("active");

            // Gọi hàm để lấy dữ liệu cho trang mới
            phanTrangSanPhamCT_trongChonSanPham((currentPage-1), pageLimit);
        });

        // sanPhamChiTiet
        // Thêm phân trang vào DOM
        $("#pagination-container-chiTietSP").empty().append(paginationContainer);
    }

    // sanPhamChiTiet
    // lấy dữ liệu từ API để tính tổng số trang
    // => chạy hàm tạo phân trang cho danh sách sản phẩm
    function fetchDataAndFillTable_danhSachSPCT() {
        $.ajax({
            url: "http://localhost:8080/api/ban-hang/getDanhSachSanPham",
            type: "GET",
            success: function(data) {

                var totalPages = Math.ceil(data.length / pageLimit);

                // Tạo phân trang
                createPagination_choDanhSachSPCT(totalPages);

                // hiển thị mặc định trang đầu tiên là 1
                currentPage = 1;
            },
            error: function(error) {
                console.log("Error: " + error);
            }
        });
    }

    // sanPhamChiTiet
    // Function để điền dữ liệu vào bảng
    function fillTableWithData_choSanPhamCT(data) {
        // lấy ra content của tBody trong table => xóa content trong đó đi
        var tableBody = $("#table-body-chiTietSP");
        tableBody.empty();

        // set lại nội dung cho tbody
        data.forEach(function(item, index) {
            var giaTriSanPham = item.giaTriSanPham;
            var giaTriGiam = item.giaTriGiam > 0 ? item.giaTriGiam : 0;
            var hienThiGiaSanPham = giaTriGiam > 0 ? "<td><del>" + item.giaTriSanPham +"</del> - "+ "<b>"+ giaTriGiam + "</b>" +  "</td>" : "<td>" + item.giaTriSanPham + "</td>" ;
            var row =
                "<tr style='text-align: center;'>" +
                "<td>" + (index + 1) + "</td>" +
                "<td><img width='80px' src='" + item.hinhAnh + "' alt=''></td>" +
                "<td>" + item.sanPham.ten + "</td>" +
                "<td>Size: " + item.kichCo.ten + " - màu: " + item.mauSac.ten + "</td>" +
                "<td>" + item.soLuong + "</td>" +
                hienThiGiaSanPham +
                "<td><input type='number' data-id='" + item.id + "' value='1' min='1' class='form-control' style='width: 50%; margin: 0px auto;'></td>" +
                "<td><a href='#' class='btn btn-success' onclick='themSanPhamVaoHoaDonHienTai(\"" + item.id + "\", this.parentNode.previousElementSibling.querySelector(\"input\").value);'>Chọn mua</a></td>" +
                "</tr>";
            tableBody.append(row);
        });

    }

    // sanPhamChiTiet
    // đổ lại dữ liệu vào bảng sau khi chọn phân trang
    phanTrangSanPhamCT_trongChonSanPham = function( currentPage , pageLimit) {
        let data = {
            currentPage: currentPage ,
            pageLimit: pageLimit
        };

        //$ === jQuery
        jQuery.ajax({
            url : "/ban-hang/phan-trang-sanPhamChiTiet",
            type : "POST",
            contentType: "application/json",
            data : JSON.stringify(data),
            dataType : "json", //Kieu du lieu tra ve tu controller la json

            success : function(jsonResult) {

                var danhSachSanPhamChiTiet = jsonResult.danhSachSanPhamChiTiet;
                // console.log(danhSachSanPhamChiTiet);

                // Điền dữ liệu vào bảng
                fillTableWithData_choSanPhamCT(danhSachSanPhamChiTiet);
            },

            error : function(jqXhr, textStatus, errorMessage) {
                //alert(jsonResult.code + ': Luu thanh cong...!')
            }

        });
    }


    // thực hiện những hàm này khi click button thêm sản phẩm
    function updateDataFromCallAPI_sanPhamChiTiet(){
        // fill data to table list product detail
        fetchDataAndFillTable_danhSachSPCT();
        // pagination for list product detail
        phanTrangSanPhamCT_trongChonSanPham();
    }




    <%--/ đổ dữ liệu và phân trang SanPhamChiTiet   --%>

    // hàm thực hiện mỗi lần load trang sẽ thực hiện các hàm bên trong
    document.addEventListener("DOMContentLoaded", function() {
        // fill data to table list product detail
        fetchDataAndFillTable_danhSachSPCT();
        // pagination for list product detail
        phanTrangSanPhamCT_trongChonSanPham();
    });

</script>

<%--đổ dữ liệu và phân trang cho khách hàng --%>
<script>
    <%-- đổ dữ liệu và phân trang KhachHang   --%>
    // khach hang
    // đổ lại dữ liệu vào bảng sau khi chọn phân trang
    phanTrangSanPhamCT_trongChonKhachHang = function( currentPage , pageLimit) {
        let data = {
            currentPage: currentPage ,
            pageLimit: pageLimit
        };

        //$ === jQuery
        jQuery.ajax({
            url : "/ban-hang/phan-trang-thongTinKhachHang",
            type : "POST",
            contentType: "application/json",
            data : JSON.stringify(data),
            dataType : "json", //Kieu du lieu tra ve tu controller la json

            success : function(jsonResult) {

                var danhSachKhachHang = jsonResult.danhSachKhachHang;
                // console.log(danhSachKhachHang);

                // Điền dữ liệu vào bảng
                fillTableWithData_choKhachHang(danhSachKhachHang);
            },

            error : function(jqXhr, textStatus, errorMessage) {
                //alert(jsonResult.code + ': Luu thanh cong...!')
            }

        });
    }

    // khach hang
    // tạo ra phân trang và tạo sự kiện xử lý phân trang khi click
    function createPagination_choDanhSachKhachHang(totalPages) {
        var paginationContainer = $("<ul>").addClass("pagination justify-content-end");

        // Tạo các nút trang
        for (var i = 1; i <= totalPages; i++) {
            var pageItem = $("<li>").addClass("page-item");
            var pageLink = $("<a>").addClass("page-link").attr("href", "#").text(i);
            if (i === 1) {
                pageItem.addClass("active");
            }
            pageItem.append(pageLink);
            paginationContainer.append(pageItem);
        }

        // Thêm sự kiện click cho các nút trang
        paginationContainer.find(".page-link").not("[aria-disabled='true']").click(function (e) {
            e.preventDefault();
            // Lấy số trang tương ứng khi click
            var currentPage = parseInt($(this).text());
            // Xóa lớp active khỏi tất cả các thẻ <li>
            paginationContainer.find("li").removeClass("active");
            // Thêm lớp active cho thẻ <li> của trang được chọn
            $(this).parent().addClass("active");

            // Gọi hàm để lấy dữ liệu cho trang mới
            phanTrangSanPhamCT_trongChonKhachHang((currentPage-1), pageLimit);
        });

        // Thêm phân trang vào DOM
        $("#pagination-container-khachHang").empty().append(paginationContainer);
    }

    // khach hang
    // lấy dữ liệu từ API để tính tổng số trang
    // => chạy hàm tạo phân trang cho danh sách sản phẩm
    function fetchDataAndFillTable_danhSachKhachHang() {
        $.ajax({
            url: "http://localhost:8080/api/ban-hang/getDanhSachKhachHang",
            type: "GET",
            success: function(data) {

                var totalPages = Math.ceil(data.length / pageLimit);

                // Tạo phân trang
                createPagination_choDanhSachKhachHang(totalPages);

                // hiển thị mặc định trang đầu tiên là 1
                currentPage = 1;
            },
            error: function(error) {
                console.log("Error: " + error);
            }
        });
    }

    // khachHang
    // Function để điền dữ liệu vào bảng
    function fillTableWithData_choKhachHang(data) {
        // lấy ra content của tBody trong table => xóa content trong đó đi
        var tableBody = $("#table-body-khachHang");
        tableBody.empty();

        // set lại nội dung cho tbody
        data.forEach(function(item, index) {
            var gioiTinh = item.gioiTinh === 0 ? "Nam":"Nữ";
            var row =
                "<tr style='text-align: center;'>" +
                "<td>" + (index + 1) + "</td>" +
                "<td>" +   item.hoTen + " </td>" +
                "<td>" +  gioiTinh + "</td>" +
                "<td>" +  item.soDT + "</td>" +
                "<td>" +  item.email + "</td>" +
                "<td><a href='#' class='btn btn-success' onclick='layIDKhachHangDuocChon(\"" + item.id + "\");'>Chọn </a></td>" +
                "</tr>";
            tableBody.append(row);
        });
    }
    <%--/ đổ dữ liệu và phân trang KhachHang   --%>

    // hàm thực hiện mỗi lần load trang sẽ thực hiện các hàm bên trong
    document.addEventListener("DOMContentLoaded", function() {
        // fill data to table list product detail
        fetchDataAndFillTable_danhSachKhachHang();
        // pagination for list product detail
        phanTrangSanPhamCT_trongChonKhachHang();
    });
</script>

<%--đổ dữ liệu và phân trang cho phiếu giảm giá --%>
<script>
    <%-- đổ dữ liệu và phân trang PhieuGiamGia   --%>
        // phieu giam gia
        // đổ lại dữ liệu vào bảng sau khi chọn phân trang
        phanTrangSanPhamCT_trongChonPhieuGiamGia = function( currentPage , pageLimit, tongTienDonHang) {
            console.log("Tổng tiefn đơn hàng " + tongTienDonHang + " tại phanTrangSanPhamCT_trongChonPhieuGiamGia");

            let data = {
                currentPage: currentPage ,
                pageLimit: pageLimit ,
                tongTienDonHang : tongTienDonHang
            };

            //$ === jQuery
            jQuery.ajax({
                url : "/ban-hang/phan-trang-phieuGiamGia",
                type : "POST",
                contentType: "application/json",
                data : JSON.stringify(data),
                dataType : "json", //Kieu du lieu tra ve tu controller la json

                success : function(jsonResult) {

                    var danhSachPhieuGiamGia = jsonResult.danhSachPhieuGiamGia;
                    // console.log(danhSachPhieuGiamGia);

                    // Điền dữ liệu vào bảng
                    fillTableWithData_chonPhieuGiamGia(danhSachPhieuGiamGia);
                },

                error : function(jqXhr, textStatus, errorMessage) {
                    //alert(jsonResult.code + ': Luu thanh cong...!')
                }

            });
        }

        // phieu giam gia
        // tạo ra phân trang và tạo sự kiện xử lý phân trang khi click
        function createPagination_choDanhSacPhieuGiamGia(totalPages) {
            var paginationContainer = $("<ul>").addClass("pagination justify-content-end");

            // Tạo các nút trang
            for (var i = 1; i <= totalPages; i++) {
                var pageItem = $("<li>").addClass("page-item");
                var pageLink = $("<a>").addClass("page-link").attr("href", "#").text(i);
                if (i === 1) {
                    pageItem.addClass("active");
                }
                pageItem.append(pageLink);
                paginationContainer.append(pageItem);
            }

            // Thêm sự kiện click cho các nút trang
            paginationContainer.find(".page-link").not("[aria-disabled='true']").click(function (e) {
                e.preventDefault();
                // Lấy số trang tương ứng khi click
                var currentPage = parseInt($(this).text());
                // Xóa lớp active khỏi tất cả các thẻ <li>
                paginationContainer.find("li").removeClass("active");
                // Thêm lớp active cho thẻ <li> của trang được chọn
                $(this).parent().addClass("active");

                var idHoaDon_active = layIDCuaButtonTabPane_active();
                tongTienDonHang(idHoaDon_active).then(function(tongTien) {
                    // Gọi hàm để lấy dữ liệu cho trang mới
                    if(tongTien>0 && tongTien!==null){
                        phanTrangSanPhamCT_trongChonPhieuGiamGia((currentPage-1), pageLimit,tongTien);
                    }
                }).catch(function(error) {
                    console.log("Đã xảy ra lỗi: " + error);
                });

            });

            // Thêm phân trang vào DOM
            $("#pagination-container-phieuGiamGia").empty().append(paginationContainer);
        }

        // phieu giam gia
        // lấy dữ liệu từ API để tính tổng số trang
        // => chạy hàm tạo phân trang cho danh sách sản phẩm
        function fetchDataAndFillTable_danhSachPhieuGiamGia(tongTienHoaDon) {

            let data = {
                tongTienDonHang: tongTienHoaDon
            };

            $.ajax({
                url: "http://localhost:8080/api/ban-hang/getDanhSachPhieuGiamGia",
                type : "POST",
                contentType: "application/json",
                data : JSON.stringify(data),
                dataType : "json", //Kieu du lieu tra ve tu controller la json

                success : function(jsonResult) {

                    var totalPages = Math.ceil(jsonResult.length / pageLimit);
                    console.log("Tổng số trang của phiếu giảm giá : " + totalPages);

                    // Tạo phân trang
                    createPagination_choDanhSacPhieuGiamGia(totalPages);

                    // hiển thị mặc định trang đầu tiên là 1
                    currentPage = 1;
                },
                error: function(error) {
                    console.log("Error: " + error);
                }
            });
        }

        // phieu giam gia
        // Function để điền dữ liệu vào bảng
        function fillTableWithData_chonPhieuGiamGia(data) {
            // lấy ra content của tBody trong table => xóa content trong đó đi
            var tableBody = $("#table-body-phieuGiamGia");
            tableBody.empty();

            // set lại nội dung cho tbody
            data.forEach(function(item, index) {
                var gioiTinh = item === 0 ? "Nam":"Nữ";
                var row =
                    "<tr style='text-align: center;'>" +
                    "<td>" + (index + 1) + "</td>" +
                    "<td>" +  item.ten + "</td>" +
                    "<td>" +  item.soLuong + "</td>" +
                    "<td>" +  item.ngayBatDauApDung + "</td>" +
                    "<td>" +  item.ngayKetThucApDung + "</td>" +
                    "<td>" +  item.giaTriGiam + "</td>" +
                    "<td>" +  item.hinhThucGiam + "</td>" +
                    "<td>" +  item.giaTienXetDieuKien + "</td>" +
                    "<td><a href='#' class='btn btn-success' onclick='layIDPhieuGiamGiaDuocChon(\"" + item.id + "\");'>Chọn </a></td>" +
                    "</tr>";
                tableBody.append(row);
            });
        }
    <%--/ đổ dữ liệu và phân trang phieu giảm giá  --%>

    // hàm thực hiện mỗi lần load trang sẽ thực hiện các hàm bên trong



</script>


<script>

    // hàm xử lý thêm sản phẩm vào hóa đơn hiện tại => và kiểm tra số lượng có bị vượt quá trước khi thêm hay không ?
    function themSanPhamVaoHoaDonHienTai(idSanPhamChiTiet, soLuongMua) {
        var idHoaDon_active = layIDCuaButtonTabPane_active();
        console.log("Id sản phẩm chi tiết được chọn : " + idSanPhamChiTiet);
        console.log("IdHoaDon_active : " + idHoaDon_active);

        kiemTraSoLuongMuaHopLeKhong(idHoaDon_active, idSanPhamChiTiet, soLuongMua)
            .then(result => {
                if (result.ketQuaKiemTra === false) { // trường hợp thêm sản phẩm bị vượt quá trong hóa đơn
                    // trường hợp vượt quá số lượng trong kho : gợi ý số lượng có thể mua được
                    if(result.soLuongDaChonVaoHoaDon>0){ // trường hợp dã thêm sản phẩm vào hóa đơn
                        if(result.soLuongCoTheThemVaoHoaDon===0){
                            alert("Số lượng sản phẩm trong kho không đủ bán \n\nSố lượng sản phẩm này bạn đã thêm vào hóa đơn: " + result.soLuongDaChonVaoHoaDon + "\nSố lượng bạn có thể thêm vào hóa đơn: " + result.soLuongCoTheThemVaoHoaDon + "\n\nVui lòng chọn sản phẩm khác" );
                            return;
                        }

                        var muaSanPham = confirm("Số lượng mua vượt quá số lượng trong kho \n Số lượng đã chọn vào hóa đơn " + result.soLuongDaChonVaoHoaDon + "\n Bạn có thể mua thêm : " + result.soLuongCoTheThemVaoHoaDon + " \n Bạn có muốn mua không ?" );
                        if (!muaSanPham) {
                            console.log("Tôi không mua thêm");
                            return;
                        }else{
                            // thêm sản phẩm vào hóa đơn = cập nhật số lượng sản phẩm trong hóa đơn chi tiết
                            themSanPham_VaoHoaDonChiTiet(idHoaDon_active, idSanPhamChiTiet, result.soLuongCoTheThemVaoHoaDon)
                                .then(result => {
                                    if (result.ketQuaSauThemThanhCong) {
                                        alert("Thêm sản phẩm vào hóa đơn thành công  "); // - check 1
                                        // fetch data ra bill current
                                        // layDanhSachHoaDonChiTiet_theoIDHoaDon(idHoaDon_active);
                                        fetchDataAndFillTable_danhSachHoaDonCho();
                                        phanTrangSanPhamCT_trongChonHoaDonCho(0,4,idHoaDon_active);

                                    } else {
                                        alert("Thêm sản phẩm vào hóa đơn thất bại");
                                    }
                                })
                                .catch(error => {
                                    console.log("Đã xảy ra lỗi khi thêm sản phẩm vào hóa đơn chi tiết - check 1 : " + error);
                                });

                            console.log("Tôi muốn mua thêm");
                        }

                    }else{  // trường hợp chưa thêm sản phẩm vào hóa đơn
                        if(result.soLuongCoTheThemVaoHoaDon===0){
                            alert("Số lượng sản phẩm trong kho không đủ bán \n\nSố lượng sản phẩm này bạn đã thêm vào hóa đơn: " + result.soLuongDaChonVaoHoaDon + "\nSố lượng bạn có thể thêm vào hóa đơn: " + result.soLuongCoTheThemVaoHoaDon + "\n\nVui lòng chọn sản phẩm khác" );
                            // fetch data ra bill current
                            // layDanhSachHoaDonChiTiet_theoIDHoaDon(idHoaDon_active);
                            fetchDataAndFillTable_danhSachHoaDonCho();
                            phanTrangSanPhamCT_trongChonHoaDonCho(0,4,idHoaDon_active);
                            return;
                        }

                        var muaSanPham = confirm("Số lượng mua vượt quá số lượng trong kho \n"+"\n Bạn có thể mua : " + result.soLuongCoTheThemVaoHoaDon + " sản phẩm \n Bạn có muốn mua không ?" );
                        if (!muaSanPham) {
                            console.log("Tôi không mua thêm");

                            return;
                        }else{
                            // thêm mới sản phẩm vào hóa đơn chi tiêt

                            console.log("Tôi muốn mua thêm");
                            themSanPham_VaoHoaDonChiTiet(idHoaDon_active, idSanPhamChiTiet, result.soLuongCoTheThemVaoHoaDon)
                                .then(result => {
                                    if (result.ketQuaSauThemThanhCong) {

                                        alert("Thêm sản phẩm vào hóa đơn thành công "); // - check 2
                                        // fetch data ra bill current
                                        // layDanhSachHoaDonChiTiet_theoIDHoaDon(idHoaDon_active);
                                        fetchDataAndFillTable_danhSachHoaDonCho();
                                        phanTrangSanPhamCT_trongChonHoaDonCho(0,4,idHoaDon_active);

                                    } else {

                                        alert("Thêm sản phẩm vào hóa đơn thất bại");
                                    }
                                })
                                .catch(error => {
                                    console.log("Đã xảy ra lỗi khi thêm sản phẩm vào hóa đơn chi tiết - check 2 : " + error);
                                });
                        }
                    }
                }else{
                    var muaSanPham = confirm("Bạn muốn mua " + soLuongMua + " sản phẩm ?");
                    if (!muaSanPham) {
                        console.log("Tôi không mua ");
                        return;
                    }else{
                        // thêm mới sản phẩm vào hóa đơn chi tiêt
                        console.log("Tôi muốn mua ");

                        themSanPham_VaoHoaDonChiTiet(idHoaDon_active, idSanPhamChiTiet, soLuongMua)
                            .then(result => {
                                if (result.ketQuaSauThemThanhCong) {
                                    alert("Thêm sản phẩm vào hóa đơn thành công "); // - không vượt quá số lượng trong kho

                                    // fetch data ra bill current
                                    // layDanhSachHoaDonChiTiet_theoIDHoaDon(idHoaDon_active);
                                    fetchDataAndFillTable_danhSachHoaDonCho();
                                    phanTrangSanPhamCT_trongChonHoaDonCho(0,4,idHoaDon_active);
                                } else {
                                    alert("Thêm sản phẩm vào hóa đơn thất bại");
                                }
                            })
                            .catch(error => {
                                console.log("Đã xảy ra lỗi khi thêm sản phẩm vào hóa đơn chi tiết - không vượt quá số lượng trong kho : " + error);
                            });
                    }
                }
                // console.log("Thực hiện thêm sản phẩm vào hóa đơn chi tiết - hợp lệ");
            })
            .catch(error => {
                console.log("Đã xảy ra lỗi khi kiểm tra số lượng mua: " + error);
            });
    }

    function kiemTraSoLuongMuaHopLeKhong(idHoaDon, idSanPhamCT, soLuongMua) {
        return new Promise((resolve, reject) => {
            let data = {
                idHoaDon: idHoaDon,
                idSanPhamCT: idSanPhamCT,
                soLuong_sanPhamMua: soLuongMua
            };

            jQuery.ajax({
                url: "http://localhost:8080/api/ban-hang/kiemTraSoLuongMuaBiVuotQuaKhong",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(data),
                dataType: "json",
                success: function(data) {
                    resolve({
                        ketQuaKiemTra: data.ketQuaKiemTraSL_muaHopLe,
                        soLuongDaChonVaoHoaDon: data.soLuongDaChonVaoHoaDon,
                        soLuongCoTheThemVaoHoaDon: data.soLuongCoTheThemVaoHoaDon
                    });
                },
                error: function(error) {
                    reject(error);
                }
            });
        });
    }

    function themSanPham_VaoHoaDonChiTiet(idHoaDon, idSanPhamCT, soLuongMua) {
        return new Promise((resolve, reject) => {
            let data = {
                idHoaDon: idHoaDon,
                idSanPhamCT: idSanPhamCT,
                soLuong_sanPhamMua: soLuongMua
            };

            jQuery.ajax({
                url: "http://localhost:8080/api/ban-hang/themSanPhamVaoHoaDonChiTiet",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(data),
                dataType: "json",
                success: function(data) {
                    resolve({
                        ketQuaSauThemThanhCong: data.ketQuaThemSPVaoHoaDonCT
                    });
                },
                error: function(error) {
                    reject(error);
                }
            });
        });
    }



    // lấy danh sách hóa đơn chi tiết theo idHoaDon
    function layDanhSachHoaDonChiTiet_theoIDHoaDon(idHoaDon) {
        return new Promise((resolve, reject) => {
            let data = {
                idHoaDon: idHoaDon
            };

            jQuery.ajax({
                url: "http://localhost:8080/api/ban-hang/layDanhSachHoaDon_theoIDHoaDon",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(data),
                dataType: "json",
                success: function(data) {
                    console.log("Danh sách hóa đơn theo id hóa đơn - kết quả :");
                    console.log(data);

                    // chỉ đổ được dữ liệu: danh sách các sản phẩm trong hóa đơn chi tiết theo id Hóa Đơn
                    // chưa xử lý được phân trang đoạn này
                    fillTableWithData_choHoaDonChiTiet(data.dsHoaDonChiTiet);


                },
                error: function(error) {
                    reject(error);
                }
            });
        });
    }
</script>

<script>
    // giả sử sdt mỗi tài khoản là duy nhất
    function fetchDataToTable_and_pagination_findNumberPhoneOfCustomer(){
        var searchByPhoneNumber = document.getElementById("searchBySDT").value;
        // console.log("SDT search : " + phoneNumber);

        // truyền data = number lấy ra Object Customer
        return new Promise((resolve, reject) => {
            let data = {
                sdt_KhachHang : searchByPhoneNumber
            };

            jQuery.ajax({
                url: "http://localhost:8080/ban-hang/getListKhachHangBySDT",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(data),
                dataType: "json",
                success: function(data) {
                    console.log(" kết quả trả về của hàm findNumberPhoneOfCustomer :");
                    console.log(data);

                    var totalPages = Math.ceil(data.danhSachKhacHang.length / pageLimit);
                    var paginationContainer = $("<ul>").addClass("pagination justify-content-end");

                    // Tạo các nút phân trang khách hàng
                    for (var i = 1; i <= totalPages; i++) {
                        var pageItem = $("<li>").addClass("page-item");
                        var pageLink = $("<a>").addClass("page-link").attr("href", "#").text(i);
                        if (i === 1) {
                            pageItem.addClass("active");
                        }
                        pageItem.append(pageLink);
                        paginationContainer.append(pageItem);
                    }

                    // Thêm sự kiện click cho các nút trang
                    paginationContainer.find(".page-link").not("[aria-disabled='true']").click(function (e) {
                        e.preventDefault();
                        // Lấy số trang tương ứng khi click
                        var currentPage = parseInt($(this).text());
                        // Xóa lớp active khỏi tất cả các thẻ <li>
                        paginationContainer.find("li").removeClass("active");
                        // Thêm lớp active cho thẻ <li> của trang được chọn
                        $(this).parent().addClass("active");

                        // Gọi hàm để lấy dữ liệu cho trang mới
                        console.log("Console - searchByPhone " + searchByPhoneNumber);
                        // phanTrangSanPhamCT_trong_findKhachHang((currentPage-1), 4,searchByPhoneNumber);
                    });

                    fillTableWithData_choKhachHang(data.danhSachKhacHang);

                    // Thêm phân trang vào DOM
                    $("#pagination-container-khachHang").empty().append(paginationContainer);
                },
                error: function(error) {
                    reject(error);
                }
            });
        });
    }




    // fetch lại dữ liệu lên bảng danh sách khách hàng
    // set dữ liệu rỗng cho ô search
    function handleClearKhachHang(){
        console.log("Chạy vào hàm xử lý handleClearKhachHang")

        // fill data to table list product detail
        fetchDataAndFillTable_danhSachKhachHang();
        // pagination for list product detail
        phanTrangSanPhamCT_trongChonKhachHang();

        // set lại dữ liệu lên nhập sdt khách hàng
        document.getElementById("searchBySDT").value = "";

    }

    // hàm set thông tin khách hàng được chọn vào hóa đơn
    function setInfoCustomerToBill(idHoaDon, idKhachHang){
        let data = {
            idHoaDon: idHoaDon,
            idKhachHang: idKhachHang
        };

        jQuery.ajax({
            url: "http://localhost:8080/ban-hang/setIdKhachHangVaoHoaDonCho",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: "json",
            success: function(data) {
                console.log("Kết quả của hàm - hàm set thông tin khách hàng được chọn vào hóa đơn :");
                console.log(data);

                alert("set idKhachHang vào hóa đơn thành công");
            },
            error: function(error) {
                reject(error);
            }
        });
    }

    // hàm lấy ra id khách hàng được chọn
    function layIDKhachHangDuocChon(idKhachHang){
        var idKhachHangDuocChon = idKhachHang;
        var idHoaDon_active = layIDCuaButtonTabPane_active();

        var xacNhanChon = confirm("Bạn muốn chọn khách hàng này đúng không ?");
        if(xacNhanChon){
            // console.log("Id khách hàng được chọn : " + idKhachHang);

            // hàm xử lý cập nhật Id khách hàng vào hóa đơn chờ
            let data = {
                idKhachHangChon : idKhachHangDuocChon ,
                idHoaDon : idHoaDon_active
            };

            jQuery.ajax({
                url: "http://localhost:8080/ban-hang/capNhatIdKhachHangTrongHoaDonChoDuocChon",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(data),
                dataType: "json",
                success: function(data) {
                    // console.log(data.khachHangDuocChon);

                    fetchData_khachHang_lenFormThongTinKhachHang(data.khachHangDuocChon.hoTen, data.khachHangDuocChon.soDT, data.khachHangDuocChon.email);
                },
                error: function(error) {
                    reject(error);
                }
            });

        }else{
            // console.log("Xác nhận ko lấy khách hàng này");
        }
    }

    // ham set lai du lieu form khachHang moi khi chuyen tab hoa don
    function fetchData_khachHang_lenFormThongTinKhachHang(hoTenKH, soDT, email){
        document.getElementById("hoVaTenKhachHangDuocChon").value= hoTenKH;
        document.getElementById("SDT_KhachHangDuocChon").value= soDT ;
        document.getElementById("email_KhachHangDuocChon").value= email ;
    }

    // ham xoa san pham khoi hoa don bang idHoaDon, idSanPhamChiTiet

    function xoaSanPhamKhoiHoaDonCT(idHoaDon, idSanPhamCT, tenSanPhamCT){
        console.log("Chạy tới hàm xoaSanPhamKhoiHoaDonCT");
        // console.log("Id hóa đơn: "+ idHoaDon);
        // console.log("Id sản phẩm CT: " + idSanPhamCT);
        // console.log("Tên sản phẩm CT: " + tenSanPhamCT);

        var xacNhanChon = confirm("Bạn muốn xóa sản phẩm "+ tenSanPhamCT +" ?");
        if(xacNhanChon){
            // hàm xử lý xóa sản phẩm khỏi hóa đơn chi tiết tương ứng
            let data = {
                idHoaDon : idHoaDon ,
                idSanPhamCT : idSanPhamCT
            };

            jQuery.ajax({
                url: "http://localhost:8080/ban-hang/xoaSanPhamKhoiHoaDonChiTiet",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(data),
                dataType: "json",
                success: function(data) {
                    if(data.xacNhanXoa === true){
                        fetchDataAndFillTable_danhSachHoaDonCho();
                        phanTrangSanPhamCT_trongChonHoaDonCho(0,4,idHoaDon);

                        alert('Xóa dữ liệu thành công');
                        getListHoaDonCho();

                    }
                },
                error: function(error) {
                    reject(error);
                }
            });

        }else{
            // console.log("Xác nhận không xóa sản phẩm này");
        }

    }

    // xóa hóa đơn chờ và hóa đơn chờ chi tiết tương ứng
    function huyHoaDon(idHoaDon){
        console.log(">>>>>>>>>>>>>>>>>>>>>> Id hóa đơn được chọn xóa : " + idHoaDon);

        let data = {
            idHoaDon : idHoaDon
        };

        var xacNhanXoa = confirm("Bạn muốn chắc chắn muốn xóa hóa đơn chờ này ?");
        if(xacNhanXoa){
            jQuery.ajax({
                url: "http://localhost:8080/ban-hang/xoaHoaDonCho_vaHoaDonChiTiet",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(data),
                dataType: "json",
                success: function(data) {
                    // xoa thanh cong
                    var idHoaDon_active = layIDCuaButtonTabPane_active();
                    console.log("Id hóa dơn active sau khi xóa hóa đơn chờ : " + idHoaDon_active);

                    getListHoaDonCho();
                    alert('Xóa hóa đơn chờ thành công');

                },
                error: function(error) {
                    reject(error);
                }
            });

        }
    }

    function layIDCuaButtonTabFirst() {
        // Lấy danh sách tất cả các button trong tab
        var buttons = document.querySelectorAll('.nav-link');

        // Duyệt qua từng button để tìm button có class active
        for (var i = 0; i < buttons.length; i++) {
            return buttons[0].getAttribute('id');
        }

        // Nếu không tìm thấy button nào có class active, trả về null
        return null;
    }

    // lấy ra danh sách hóa đơn chờ active tính tổng tiền
    // để set dữ liệu vào tổng tiền và tính lại mỗi khi thay đổi số lượng sản phẩm trong hóa đơn chờ
    function tongTienDonHang(idHoaDon_active) {
        console.log(">>>>>>>>>>>>> vào hàm tongTienDonHang()");
        if(idHoaDon_active!==null){
            let data = {
                idHoaDon: idHoaDon_active
            };
            return new Promise(function(resolve, reject) {
                $.ajax({
                    url: "http://localhost:8080/ban-hang/capNhatTongTienDonHang_cuaHoaDonCurrent",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(data),
                    dataType: "json", //Kieu du lieu tra ve tu controller la json

                    success: function(data) {
                        var tongTienDonHang = data.tongTienDonHang;
                        var tienDuocGiamResult = data.tienDuocGiam;
                        var tongTienSauGiam = data.tongTienDonHangSauGiam;

                        var tongTienHang2 = document.getElementById("tongTienHang");
                        tongTienHang2.textContent = tongTienDonHang;

                        var tienDuocGiam = document.getElementById("tienDuocGiam");
                        tienDuocGiam.textContent = tienDuocGiamResult;

                        var tongTienThanhToan = document.getElementById("tongTienThanhToan");
                        tongTienThanhToan.textContent = tongTienSauGiam;

                        console.log("=>>>>>>>>>>>>>>>>>>> Tổng tiền đơn hàng o tinh tong tien hang : " + tongTienDonHang);
                        resolve(tongTienDonHang); // Trả về tổng tiền đơn hàng qua promise
                    },
                    error: function(error) {
                        console.log("Error: " + error);
                        reject(error); // Trả về lỗi nếu có lỗi xảy ra
                    }
                });
            });
        }
    }

    function layIDPhieuGiamGiaDuocChon(idPhieuGiamGia){
        var idHoaDon_active = layIDCuaButtonTabPane_active();
        var idPhieuGiamGiaDuocChon = idPhieuGiamGia;

        console.log(".>........Phieu giam gia duoc chon : " + idPhieuGiamGiaDuocChon);

        // cap nhat thong tin phieu giam gia
        let data = {
            idPhieuGiamGia :   idPhieuGiamGiaDuocChon,
            idHoaDon : idHoaDon_active
        };

        $.ajax({
            url: "http://localhost:8080/ban-hang/capNhatThongTinHoaDon_apDungPhieuGiamGiaNao",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: "json", //Kieu du lieu tra ve tu controller la json

            success: function(data) {
                chonMaGiamGia();
                alert('Áp dụng phiếu giảm giá thành công');
            },
            error: function(error) {
                console.log("Error: " + error);
                reject(error); // Trả về lỗi nếu có lỗi xảy ra
            }
        });


    }

    function chonMaGiamGia(){
        console.log("Chạy vào hàm chonMaGiamGia() ");
        var idHoaDon_active = layIDCuaButtonTabPane_active();

        // Sử dụng promise để lấy tổng tiền đơn hàng
        tongTienDonHang(idHoaDon_active).then(function(tongTien) {
            console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Tổng tiền đơn hàng - trong load trang phieuGiamGia: " + tongTien);
            if(tongTien !== null && tongTien > 0) {
                fetchDataAndFillTable_danhSachPhieuGiamGia(tongTien);

                // var idHoaDon_active = layIDCuaButtonTabPane_active();
                // pagination for list product detail
                phanTrangSanPhamCT_trongChonPhieuGiamGia(0, 4, tongTien);
            }
        }).catch(function(error) {
            console.log("Đã xảy ra lỗi: " + error);
        });
    }


    function taoHoaDonThanhToan(){
        var idHoaDon_active = layIDCuaButtonTabPane_active();
        tongTienDonHang(idHoaDon_active).then(function(tongTien) {
            // console.log("Tổng tiền tính được khi ở hàm taoHoaDonThanhToan" + tongTien);

            if(tongTien===0){
                alert("Vui lòng chọn sản phẩm vào hóa đơn để thưc hiện thanh toán");
                return;
            }else{
                if(confirm('Bạn muốn thực hiện thanh toán ? ')){
                    console.log(">>>>>>>>> Thực hiện Tạo hóa đơn thanh toán tại quầy ");
                    // lấy idHoaDon => chạy vào 1 hàm xử lý tạo hóa đơn thanh toán
                    var idHoaDon_active = layIDCuaButtonTabPane_active();
                    thucHienTaoHoaDonThanhToan(idHoaDon_active);

                }else{
                    console.log("Không tạo hóa đơn");
                }
            }
        }).catch(function(error) {
            console.log("Đã xảy ra lỗi: " + error);
        });





    }

    // tạo hóa đơn thanh toán
    function thucHienTaoHoaDonThanhToan(idHoaDonCurrent){
        let data = {
            idHoaDon :   idHoaDonCurrent
        };

        $.ajax({
            url: "http://localhost:8080/ban-hang/taoHoaDonThanhToanTaiQuay",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: "json", //Kieu du lieu tra ve tu controller la json

            success: function(data) {
                alert('Tạo hóa đơn thanh toán tại quầy thành công');
                getListHoaDonCho();
            },
            error: function(error) {
                console.log("Error: " + error);
            }
        });
    }

    function handleChangeSoLuongMua( soLuongMuaMoi,  soLuongCu, idSanPhamCT, soLuongTrongKho) {
        console.log("Hàm xử lý thay đổi số lượng mua ");
        console.log("Số lượng mua mới : " + soLuongMuaMoi);
        console.log("Số lượng mua cũ : " + soLuongCu);
        console.log("ID sản phẩm chi tiết : " + idSanPhamCT);
        console.log("Số lượng trong kho : " + soLuongTrongKho);

        // kiểm tra dữ liệu cơ bản trước khi cập nhật số lượng trong hóa đơn
        var xacNhanThemSoLuong = confirm('Bạn muốn sửa số lượng sản phẩm này ?');
        if(xacNhanThemSoLuong){
            var checkDieuKienSoLuong = soLuongMuaMoi<=soLuongTrongKho;
            console.log("checkDieuKienSoLuong :  " + checkDieuKienSoLuong);
            console.log("Số lượng mua mới : " + soLuongMuaMoi);
            console.log("Số lượng trong kho : " + soLuongTrongKho);
            if(checkDieuKienSoLuong===true){
                console.log('Số lượng hợp lệ để cập nhật - số lượng trong kho của sản phẩm : ' + soLuongTrongKho + ' - số lượng mua mới ' + soLuongMuaMoi);
            }else{
                if(confirm('Trong kho còn ' + (soLuongTrongKho-soLuongCu) + ' sản phẩm bạn có thể mua \n bạn có muốn lấy hết không ?')){
                    console.log('Cập nhật số lượng thành công');
                }else{
                    console.log('Không cập nhật số lượng');
                }
            }

        }else{
            return;
        }




    }

</script>


</body>
</html>
