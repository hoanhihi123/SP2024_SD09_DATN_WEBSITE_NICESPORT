
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-file-text-o"></i>Bán hàng tại quầy</a>
                </li>
                <li class="menu-title">Thống kê</li><!-- /.menu-title -->
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart-o"></i>Thống kê doanh thu</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="fa fa-puzzle-piece"></i><a href="ui-buttons.html">Hàng ngày</a></li>
                        <li><i class="fa fa-id-badge"></i><a href="ui-badges.html">Hàng tháng</a></li>
                        <li><i class="fa fa-bars"></i><a href="ui-tabs.html">Hàng năm</a></li>
                    </ul>
                </li>
                <li class="menu-title">Quản lý</li><!-- /.menu-title -->
                <li class="menu-item-has-children dropdown ">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>Quản lý giày</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="fa fa-puzzle-piece"></i><a href="ui-buttons.html">Giày</a></li>
                        <li><i class="fa fa-gear"></i><a href="ui-badges.html">Chất liệu</a></li>
                        <li><i class="fa fa-eraser"></i><a href="ui-tabs.html">Màu sắc</a></li>
                        <li><i class="fa fa-id-badge"></i><a href="ui-badges.html">Thương hiệu</a></li>
                        <li><i class="fa fa-arrows-h"></i><a href="ui-tabs.html">Kích cỡ</a></li>
                        <li><i class="fa fa-inbox"></i><a href="ui-tabs.html" >Kiểu dáng</a></li>
                        <li><i class="fa fa-suitcase"></i><a href="ui-tabs.html">NSX</a></li>
                        <li ><i class="fa fa-sun-o" ></i><a  href="ui-tabs.html">Dòng sản phẩm</a></li>
                    </ul>

                </li>
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-print" ></i>Quản lý hóa đơn</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="fa fa-puzzle-piece"></i><a href="ui-buttons.html">Xuất hóa đơn</a></li>
                        <li><i class="fa fa-id-badge"></i><a href="ui-badges.html">Quản lý hóa đơn</a></li>
                    </ul>
                </li>

                <li class="">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-pencil-square-o" ></i>Quản lý khách hàng</a>
                </li>
                <li class="">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-users" ></i>Quản lý nhân viên</a>
                </li>
                <li class="">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-leaf" ></i>Quản lý khuyến mãi</a>
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
            <div class="col-lg-2" style="margin-right: -5px;">
                <button id="createTabBtn" class="btn btn-primary">Tạo hóa đơn</button>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#hoaDon1" type="button" role="tab" aria-controls="home" aria-selected="true">Hóa đơn 1</button>
                    </li>
                </ul>
            </div>
            <div class="col-lg-12">
                <div class="tab-content row" id="myTabContent">
                    <div class="tab-pane fade show active" id="hoaDon1" role="tabpanel" aria-labelledby="home-tab">
                    <!-- Tab 1
                         -->

                        <div class="content container col-lg-12" >
                            <div class="animated fadeIn row">
                                <div class="card col-lg-12">
                                    <div class="card-header">
                                        <div class="row">
                                            <div class="col-lg-10">
                                                <strong class="card-title" style="font-size: 20px;">Danh sách sản phẩm trong hóa đơn</strong>
                                            </div>
                                            <div class="col-lg-2" style="margin-left: -40px;">
                                                <strong class="card-title" >
                                                    <a href="#" class="btn btn-success" data-toggle="modal"
                                                       data-target="#chonSanPhamVaoHoaDonCho"> <i class="menu-icon fa fa-plus"></i> Thêm sản phẩm</a>
                                                </strong>
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
                                                                                        <input type="text" class="form-control">
                                                                                    </div>
                                                                                    <div class="col-lg-3">
                                                                                        <span>Nhập màu sắc</span>
                                                                                        <input type="text" class="form-control">
                                                                                    </div>
                                                                                    <div class="col-lg-3">
                                                                                        <span>Nhập giá</span>
                                                                                        <input type="text" class="form-control">
                                                                                    </div>
                                                                                    <div class="col-lg-3">
                                                                                        <span>Nhập size</span>
                                                                                        <input type="text" class="form-control">
                                                                                    </div>

                                                                                    <div class="col-lg-3" style="margin-top: 15px;">
                                                                                        <span>Chọn loại giày</span>
                                                                                        <select name="" id="" class="form-control">
                                                                                            <option value="" class="form-control">Chọn loại giày</option>
                                                                                            <option value="" class="form-control">Giày chạy bộ</option>
                                                                                            <option value="" class="form-control">Giày thể thao</option>
                                                                                        </select>
                                                                                    </div>


                                                                                    <div class="col-lg-2" style="margin-top: 15px;">
                                                                                        <button class="form-control btn btn-primary" style="margin-top: 24px;">Tìm kiếm</button>

                                                                                    </div>
                                                                                </form>


                                                                            </div>
                                                                            <div class="card-body" style="">
                                                                                <p>Danh sách sản phẩm </p>
                                                                                <div class="table-responsive">
                                                                                    <table class="table table-bordered table-hover no-wrap" >
                                                                                        <thead>
                                                                                        <tr style="text-align: center;">
                                                                                            <th scope="col">STT</th>
                                                                                            <th scope="col">Ảnh</th>
                                                                                            <th scope="col">Tên</th>
                                                                                            <th scope="col">Size - màu sắc</th>
                                                                                            <th scope="col">Số lượng kho</th>
                                                                                            <th scope="col">Giá</th>
                                                                                            <th scope="col">Số lượng mua</th>
                                                                                            <th scope="col">Chọn</th>
                                                                                        </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                                <c:forEach items="${dsSanPhamChiTiet}" var="sanPhamCT" varStatus="SPCT">
                                                                                                    <tr style="text-align: center;">
                                                                                                            <th scope="row">${SPCT.index+1}</th>
                                                                                                            <td > <img width="80px" src="${sanPhamCT.hinhAnh}" alt=""></td>
                                                                                                            <td >${sanPhamCT.sanPham.ten}</td>
                                                                                                            <td >Size: ${sanPhamCT.kichCo.ten} - màu: ${sanPhamCT.mauSac.ten}</td>
                                                                                                            <td>${sanPhamCT.soLuong}</td>
                                                                                                            <td>${sanPhamCT.giaTriSanPham}</td>
                                                                                                            <td ><input type="number" id="${sanPhamCT.id}" value="1" min="1" class="form-control" style="width: 50%; margin: 0px auto;"></td>
                                                                                                            <td > <a href="#" class="btn btn-success" onclick="addToBill('${sanPhamCT.id}');"> Chọn mua</a> </td>
                                                                                                    </tr>
                                                                                                </c:forEach>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                                <div class="row" style="margin-top: 20px;">
                                                                                    <div class="col-lg-8">

                                                                                    </div>
                                                                                    <div class="col-lg-4">
                                                                                        <nav aria-label="...">
                                                                                            <ul class="pagination justify-content-end">
                                                                                                <nav aria-label="...">
                                                                                                    <c:if test="${totalPage>0}">
                                                                                                        <ul class="pagination justify-content-end">
                                                                                                            <c:if test="${pageChoosedNumber > 0}">
                                                                                                                <li class="page-item">
                                                                                                                    <a class="page-link" href="/ban-hang/view?${pageChoosedNumber-1}" tabindex="-1" aria-disabled="true">Previous</a>
                                                                                                                </li>
                                                                                                            </c:if>

                                                                                                            <c:forEach begin="0" end="${totalPage - 1}" varStatus="loop">
                                                                                                                <c:choose>
                                                                                                                    <c:when test="${pageChoosedNumber==loop.index}">
                                                                                                                        <li class="page-item active" aria-current="page" >
                                                                                                                            <a name="page" class="page-link"   href="/ban-hang/view?page=${loop.index}">${loop.index + 1}</a>
                                                                                                                        </li>
                                                                                                                    </c:when>
                                                                                                                    <c:otherwise>
                                                                                                                        <li class="page-item" aria-current="page">
                                                                                                                            <a name="page" class="page-link" href="/ban-hang/view?page=${loop.index}">${loop.index + 1}</a>
                                                                                                                        </li>
                                                                                                                    </c:otherwise>
                                                                                                                </c:choose>
                                                                                                            </c:forEach>
                                                                                                            <c:if test="${pageChoosedNumber < (totalPage - 1)}">
                                                                                                                <li class="page-item">
                                                                                                                    <a class="page-link" href="/ban-hang/view?page=${pageChoosedNumber+1}">Next</a>
                                                                                                                </li>
                                                                                                            </c:if>
                                                                                                            <li class="page-item">
                                                                                                            </li>
                                                                                                        </ul>
                                                                                                    </c:if>
                                                                                                </nav>
                                                                                            </ul>
                                                                                        </nav>
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
                                        </div>


                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-hover no-wrap" >
                                                <thead>
                                                <tr style="text-align: center;">
                                                    <th scope="col">STT</th>
                                                    <th scope="col">Ảnh</th>
                                                    <th scope="col">Tên</th>
                                                    <th scope="col">Size - màu sắc</th>
                                                    <th scope="col">Số lượng mua</th>
                                                    <th scope="col">xóa sản phẩm</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr style="text-align: center;">
                                                    <th scope="row">1</th>
                                                    <td > <img width="80px" src="https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/40e9a096-e6cc-4c39-aec8-46a330f80681/invincible-3-road-running-shoes-jkhK7v.png" alt=""></td>
                                                    <td >Nike Invincible 3</td>
                                                    <td >Size: 34 - màu: trắng viền đen</td>
                                                    <td ><input type="number" value="1" min="1" class="form-control" style="width: 50%; margin: 0px auto;"></td>
                                                    <td > <a href="#" class="btn btn-warning"> <i class="menu-icon fa fa-trash-o" style="margin-right: 5px;"></i>Xóa</a> </td>
                                                </tr>
                                                <tr style="text-align: center;">
                                                    <th scope="row">1</th>
                                                    <td > <img width="80px" src="https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/40e9a096-e6cc-4c39-aec8-46a330f80681/invincible-3-road-running-shoes-jkhK7v.png" alt=""></td>
                                                    <td >Nike Invincible 3</td>
                                                    <td >Size: 34 - màu: trắng viền đen</td>
                                                    <td ><input type="number" value="1" min="1" class="form-control" style="width: 50%; margin: 0px auto;"></td>
                                                    <td > <a href="#" class="btn btn-warning"> <i class="menu-icon fa fa-trash-o" style="margin-right: 5px;"></i>Xóa</a> </td>
                                                </tr>
                                                <tr style="text-align: center;">
                                                    <th scope="row">1</th>
                                                    <td > <img width="80px" src="https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/40e9a096-e6cc-4c39-aec8-46a330f80681/invincible-3-road-running-shoes-jkhK7v.png" alt=""></td>
                                                    <td >Nike Invincible 3</td>
                                                    <td >Size: 34 - màu: trắng viền đen</td>
                                                    <td ><input type="number" value="1" min="1" class="form-control" style="width: 50%; margin: 0px auto;"></td>
                                                    <td > <a href="#" class="btn btn-warning"> <i class="menu-icon fa fa-trash-o" style="margin-right: 5px;"></i>Xóa</a> </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="row" style="margin-top: 20px;">
                                            <div class="col-lg-8">

                                            </div>
                                            <div class="col-lg-4">
                                                <nav aria-label="...">
                                                    <ul class="pagination justify-content-end">
                                                        <li class="page-item disabled">
                                                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                                        </li>
                                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                        <li class="page-item active" aria-current="page">
                                                            <a class="page-link" href="#">2</a>
                                                        </li>
                                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="#">Next</a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- .animated -->
                        </div><!-- .content -->

                        <div class="content container col-lg-12" style="margin-top: -60px;">
                            <div class="animated fadeIn row">
                                <div class="card col-lg-12">
                                    <div class="card-header">
                                        <div class="row">
                                            <div class="col-lg-11">
                                                <strong class="card-title" style="font-size: 20px;">Thông tin khách hàng</strong>
                                            </div>
                                            <div class="col-lg-1" style="margin-left: -30px;" >
                                                <strong class="card-title" >
                                                    <a href="#" class="btn btn-success" data-toggle="modal"
                                                       data-target="#chonThongTinKhachHang"> <i class="menu-icon fa fa-plus"></i> Chọn</a>
                                                </strong>
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
                                                                                <form action="" class="row justify-content-center">
                                                                                    <div class="col-lg-5">
                                                                                        <input type="text" class="form-control" placeholder="Nhập SĐT của khách hàng">
                                                                                    </div>
                                                                                    <div class="col-lg-2" style="margin-top: -24px;">
                                                                                        <button class="form-control btn btn-primary" style="margin-top: 24px;">Tìm kiếm</button>

                                                                                    </div>
                                                                                </form>


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
                                                                                            <th scope="col">Sinh nhật</th>
                                                                                            <th scope="col">SĐT</th>
                                                                                            <th scope="col">Email</th>
                                                                                            <th scope="col">Chọn</th>
                                                                                        </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                        <tr style="text-align: center;">
                                                                                            <th scope="row">1</th>
                                                                                            <td>Nguyễn Văn A</td>
                                                                                            <td>Nam</td>
                                                                                            <td>15/8/1990</td>
                                                                                            <td>0859755762</td>
                                                                                            <td>abc@gmail.com</td>
                                                                                            <td><a href="" class="btn btn-success">Chọn</a></td>
                                                                                        </tr>
                                                                                        <tr style="text-align: center;">
                                                                                            <th scope="row">2</th>
                                                                                            <td>Nguyễn Văn A</td>
                                                                                            <td>Nam</td>
                                                                                            <td>15/8/1990</td>
                                                                                            <td>0859755762</td>
                                                                                            <td>abc@gmail.com</td>
                                                                                            <td><a href="" class="btn btn-success">Chọn</a></td>
                                                                                        </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                                <div class="row" style="margin-top: 20px;">
                                                                                    <div class="col-lg-8">
                                                                                        <a href="" class="btn btn-success">Thêm mới khách hàng</a>
                                                                                    </div>
                                                                                    <div class="col-lg-4">
                                                                                        <nav aria-label="...">
                                                                                            <ul class="pagination justify-content-end">
                                                                                                <li class="page-item disabled">
                                                                                                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                                                                                </li>
                                                                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                                                                <li class="page-item active" aria-current="page">
                                                                                                    <a class="page-link" href="#">2</a>
                                                                                                </li>
                                                                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                                                                <li class="page-item">
                                                                                                    <a class="page-link" href="#">Next</a>
                                                                                                </li>
                                                                                            </ul>
                                                                                        </nav>
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
                                        </div>


                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <span>Họ và tên:</span>
                                                <input type="text" placeholder="Khách hàng vãng lai" class="form-control" readonly="true">
                                            </div>
                                            <div class="col-lg-3">
                                                <span>SĐT:</span>
                                                <input type="text" placeholder="" class="form-control" readonly="true">
                                            </div>
                                            <div class="col-lg-3">
                                                <span>Email:</span>
                                                <input type="text" placeholder="" class="form-control"  readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- .animated -->
                        </div><!-- .content -->

                        <div class="content container col-lg-12" style="margin-top: -60px;">
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
                                                <select name="" id="" class="form-control">
                                                    <option value="" class="form-control">Tiền mặt</option>
                                                    <option value="" class="form-control">Chuyển khoản</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-6">
                                                <span>Mã giảm giá</span>
                                                <!-- <strong class="card-title" >
                                                    <a href="#" class="btn btn-success" data-toggle="modal"
                                                    data-target="#chonThongTinKhachHang"> <i class="menu-icon fa fa-plus"></i> Chọn</a>
                                                </strong>
                                            </div>
                                            <div class="container">
                                                <div class="modal fade" id="chonThongTinKhachHang" tabindex="-1" role="dialog"
                                                    aria-labelledby="createDiscountModalLabel" aria-hidden="true"> -->
                                                <div class="row">
                                                    <div class="col-lg-9">
                                                        <input type="text" placeholder="Nhập mã giảm giá" class="form-control">
                                                    </div>
                                                    <a href="#" class="btn btn-success" data-toggle="modal"
                                                       data-target="#chonMaGiamGia"> Chọn</a>

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
                                                                                    <div class="card-header"  style="background-color: #F7F7F7; padding-bottom: 35px;">
                                                                                        <form action="" class="row justify-content-center">
                                                                                            <div class="col-lg-5">
                                                                                                <input type="text" class="form-control" placeholder="Nhập mã, tên mã giảm giá">
                                                                                            </div>
                                                                                            <div class="col-lg-2" style="margin-top: -24px;">
                                                                                                <button class="form-control btn btn-primary" style="margin-top: 24px;">Tìm kiếm</button>

                                                                                            </div>
                                                                                        </form>


                                                                                    </div>
                                                                                    <div class="card-body" style="">
                                                                                        <p>Danh sách mã giảm giá phù hợp</p>
                                                                                        <div class="table-responsive">
                                                                                            <table class="table table-bordered table-hover no-wrap" >
                                                                                                <thead>
                                                                                                <tr style="text-align: center;">
                                                                                                    <th scope="col">STT</th>
                                                                                                    <th scope="col">Mã</th>
                                                                                                    <th scope="col">Tên mã giảm giá</th>
                                                                                                    <th scope="col">Giá trị giảm</th>
                                                                                                    <th scope="col">Điều kiện giảm</th>
                                                                                                    <th scope="col">Thời gian kết thúc</th>
                                                                                                    <th scope="col">Chọn</th>
                                                                                                </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                                <tr style="text-align: center;">
                                                                                                    <th scope="row">1</th>
                                                                                                    <td>PGG001</td>
                                                                                                    <td>Giảm 30k cho tháng 3 với đơn từ 300k</td>
                                                                                                    <td>30.000</td>
                                                                                                    <td>Tổng hóa đơn tối thiểu 300k</td>
                                                                                                    <td>26/4/2024</td>
                                                                                                    <td><a href="" class="btn btn-success">Chọn</a></td>
                                                                                                </tr>
                                                                                                <tr style="text-align: center;">
                                                                                                    <th scope="row">2</th>
                                                                                                    <td>PGG001</td>
                                                                                                    <td>Giảm 30k cho tháng 3 với đơn từ 300k</td>
                                                                                                    <td>30.000</td>
                                                                                                    <td>Tổng hóa đơn tối thiểu 300k</td>
                                                                                                    <td>26/4/2024</td>
                                                                                                    <td><a href="" class="btn btn-success">Chọn</a></td>
                                                                                                </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </div>
                                                                                        <div class="row" style="margin-top: 20px;">
                                                                                            <div class="col-lg-8">
                                                                                            </div>
                                                                                            <div class="col-lg-4">
                                                                                                <nav aria-label="...">
                                                                                                    <ul class="pagination justify-content-end">
                                                                                                        <li class="page-item disabled">
                                                                                                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                                                                                        </li>
                                                                                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                                                                        <li class="page-item active" aria-current="page">
                                                                                                            <a class="page-link" href="#">2</a>
                                                                                                        </li>
                                                                                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                                                                        <li class="page-item">
                                                                                                            <a class="page-link" href="#">Next</a>
                                                                                                        </li>
                                                                                                    </ul>
                                                                                                </nav>
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
                                                </div>
                                            </div>
                                            <div class="col-lg-12" style="margin-top: 20px;">
                                                <div class="row">
                                                    <span class="col-lg-4">Tổng tiền hàng: </span> <span class="col-lg-3">6.500.000</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-12" style="margin-top: 20px;">
                                                <div class="row">
                                                    <span class="col-lg-4">Tiền được giảm: </span> <span class="col-lg-3">500.000</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-12" style="margin-top: 20px;">
                                                <div class="row">
                                                    <span class="col-lg-4">Tổng thanh toán: </span> <span class="col-lg-3">6.000.000</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-12" style="margin-top: 20px;">
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <button class="btn btn-primary">Xuất hóa đơn</button></div>
                                                    <div class="col-lg-9">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- .animated -->
                        </div><!-- .content -->

                    </div>

                    <div class="tab-pane fade" id="hoaDonCho2" role="tabpanel" aria-labelledby="profile-tab">Tab 2</div>
                    <div class="tab-pane fade" id="hoaDonCho3" role="tabpanel" aria-labelledby="contact-tab">Tab 3</div>
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

<script>
    // Sử dụng JavaScript để đặt giá trị của trường ngày thành ngày hôm nay
    document.getElementById('dateToday').valueAsDate = new Date();

    function currentTab(){


    }

    function addToBill(sanPhamId) {

        // lấy ra tên tabpane đang được chọn để setSession, thêm sản phẩm vào hoaDonCho cho chuẩn của tabPane đó
        var activeTab = document.querySelector(".tab-pane.fade.show.active");
        if (activeTab) {
            var tabName = activeTab.getAttribute("id");
            var tabNameInput = document.getElementById("tabNameCurrent");
            tabNameInput.value = tabName;
            // console.log("Current Tab Name:", tabName);
            // console.log("Current Tab Name current hidden:", tabNameInput);
        } else {
            console.log("No active tab found.");
        }

        // Lấy giá trị của số lượng mua từ trường nhập liệu
        var soLuongMua = document.getElementById(sanPhamId).value;
        let idSanPhamCTDuocChon = sanPhamId;
        var tabNameCurrentPage = document.getElementById("tabNameCurrent").value;

        // console.log("ID sản phẩm:", sanPhamId);
        // console.log("Số lượng mua:", soLuongMua);
        // console.log("tabNameCurrentPage : " + tabNameCurrentPage);


        //id="sizeGiayDuocChon"
        let data = {
            idSanPhamCT: idSanPhamCTDuocChon, //lay theo id
            soLuong: soLuongMua ,
            tenHoaDon: tabNameCurrentPage
        };

        $ === jQuery
        jQuery.ajax({
            url : "/ban-hang/add-to-hoaDonCho",
            type : "POST",
            contentType: "application/json",
            data : JSON.stringify(data),
            dataType : "json", //Kieu du lieu tra ve tu controller la json

            success : function(jsonResult) {
                / alert(jsonResult.code + ": " + jsonResult.message); /
                let totalProducts = jsonResult.totalCartProducts;
                let totalPrice = jsonResult.totalPriceResult;
                let soLuongMuaVuotQua = jsonResult.soLuongMuaVuotQua;
                $("#totalCartProductsId").html(totalProducts);
                // $("#totalPriceInCart").html(totalPrice);
                if(soLuongMuaVuotQua===true){
                    alert("Số lượng trong kho không đủ, vui lòng chọn sản phẩm khác hoặc liên hệ với chúng tôi để đặt hàng sớm nhất.");
                }
            },

            error : function(jqXhr, textStatus, errorMessage) {
                //alert(jsonResult.code + ': Luu thanh cong...!')
            }

        });
    }

</script>

<script>
    document.getElementById("createTabBtn").addEventListener("click", function() {
        // Số lượng tab hiện có
        var tabCount = document.querySelectorAll("#myTab .nav-link").length;

        if (tabCount >= 5) {
            alert("Số lượng tab hóa đơn đã đạt đến giới hạn tối đa là 5.");
            return;
        }

        // Tạo một tab mới
        var newTabId = "hoaDon" + (tabCount + 1);
        var firstTabContent = document.getElementById("hoaDon1").innerHTML;

        var newTabPane = document.createElement("div");
        newTabPane.classList.add("tab-pane", "fade");
        newTabPane.id = newTabId;
        newTabPane.setAttribute("role", "tabpanel");
        newTabPane.innerHTML = firstTabContent;

        var newTabBtn = document.createElement("button");
        newTabBtn.classList.add("nav-link");
        newTabBtn.setAttribute("data-bs-toggle", "tab");
        newTabBtn.setAttribute("data-bs-target", "#" + newTabId);
        newTabBtn.setAttribute("role", "tab");
        newTabBtn.textContent = "Hóa đơn " + (tabCount + 1);

        newTabBtn.addEventListener("click", function() {
            var tabContent = document.querySelector(newTabBtn.getAttribute("data-bs-target"));
            tabContent.classList.add("show", "active");
        });

        var tabList = document.getElementById("myTab");
        var newTabItem = document.createElement("li");
        newTabItem.classList.add("nav-item");
        newTabItem.appendChild(newTabBtn);
        tabList.appendChild(newTabItem);

        var tabContent = document.getElementById("myTabContent");
        tabContent.appendChild(newTabPane);

        // Kích hoạt tab mới
        newTabBtn.click();
    });
</script>

</body>
</html>
