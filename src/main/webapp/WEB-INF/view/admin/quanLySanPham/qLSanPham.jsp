<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!doctype html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Quản lý sản phẩm - N </title>
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
    <style>
        .messageError{
            color: red;
        }
    </style>
</head>
<body>
<!-- Left Panel -->
<jsp:include page="/WEB-INF/view/admin/layout/left_menu_admin.jsp"></jsp:include>
<!-- /Left Panel -->

<!-- Right Panel -->

<div id="right-panel" class="right-panel">
    <!-- Header-->
    <jsp:include page="/WEB-INF/view/admin/layout/header_admin.jsp"></jsp:include>
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
                                <li><a href="#">Quản lý giày</a></li>
                                <li class="active">Giày</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="content" style="margin-top: 0px;">
        <div class="animated fadeIn">
            <div class="card col-lg-12">
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-9">
                            <strong class="card-title" ><h3>Danh sách sản phẩm</h3></strong>
                        </div>
                        <div class="col-lg-3 justify-content-end" >
                            <a href="/admin/quanLySanPham/view-tao-sanPhamChiTiet" class="btn btn-primary"> <i class="menu-icon fa fa-plus"></i> Thêm mới sản phẩm</a>
                        </div>
                    </div>
                    <br>
                    <form action="/san-pham/hien-thi" method="get">
                        <div class="row " style=" margin-left: 0px;">
                            <div class="col-lg-10">
                                <input  class="form-control " id="textsearch" name="textsearch" type="text" placeholder="Nhập tên, mã, mô tả muốn tìm kiếm" >
                            </div>
                            <div class="col-lg-2 justify-content-end" >
                                <button class="btn btn-secondary" type="submit" >
                                    <i class="menu-icon fa fa-search"></i> Tìm kiếm</button>
                            </div>
                            <div class="col-lg-5 justify-content-end" style="margin-top: 20px;">
                                <span>Trạng thái:</span> <br>
                                <div style="margin-top: 5px;">
                                    <input type="radio" name="trangThaiSanPhamCheck" checked/>  <span style="margin-right: 15px;" > Tất cả </span>
                                    <input type="radio" name="trangThaiSanPhamCheck" />  <span style="margin-right: 15px;" > Ngưng hoạt động</span>
                                    <input type="radio" name="trangThaiSanPhamCheck" /> <span style="margin-right: 15px;" > Hoạt động</span>
                                </div>
                            </div>
                            <div class="col-lg-3 justify-content-end" style="margin-top: 20px;">
                                <span>Danh mục:</span> <br>
                                <div style="margin-top: 5px;">
                                    <select name="" id="" class="form-control">
                                        <option value="">Chọn danh mục</option>
                                        <option value="">Giày nam</option>
                                        <option value="">Giày nữ</option>
                                        <option value="">Giày unisex</option>
                                    </select>

                                </div>
                            </div>

                            <div class="col-lg-3 justify-content-end" style="margin-top: 20px;">
                                <span>Thương hiệu:</span> <br>
                                <div style="margin-top: 5px;">
                                    <select name=""  class="form-control">
                                        <option value="">Chọn thương hiệu</option>
                                        <option value="">Nike</option>
                                        <option value="">Converse</option>
                                        <option value="">Adidas</option>
                                    </select>

                                </div>
                            </div>
                        </div>

                    </form>

                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <form action="/san-pham/xoaTheoLuaChon" method="get">
                            <table class="table table-bordered table-hover no-wrap">
                                <thead>
                                <tr style="text-align: center;">
                                    <%--                                    <th scope="col">Lựa chọn</th>--%>
                                    <th scope="col">STT</th>
                                    <th scope="col">Tên giày</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Danh mục</th>
                                    <th scope="col">Thương hiệu</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col" colspan="2" >Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
<%--                                <c:forEach items="${dsSanPham}" var="sanPham" varStatus="sanpham">--%>
<%--                                    <tr>--%>
<%--                                        <th scope="row">${sanpham.index +1}</th>--%>
<%--                                        <td > ${sanPham.ma}</td>--%>
<%--                                        <td > ${sanPham.ten}</td>--%>
<%--                                        <td > ${sanPham.moTa}</td>--%>
<%--                                        <td > ${sanPham.nguoiTao}</td>--%>
<%--                                        <td > ${sanPham.nguoiSua}</td>--%>
<%--                                        <td > ${sanPham.ngayTao}</td>--%>
<%--                                        <td > ${sanPham.ngaySua}</td>--%>
<%--                                        <td > ${sanPham.trangThai == 1 ? 'Hoạt động': 'Ngưng hoạt động'}</td>--%>
<%--                                        <td > <a href="/san-pham/view-sua/${sanPham.id}" class="btn btn-success">Xem <i class="menu-icon fa fa-pencil-square-o"></i></a> </td>--%>
<%--                                        <td > <a href="/san-pham/xoa/${sanPham.id}" class="btn btn-warning"--%>
<%--                                                 onclick="return confirm('Bạn chắc chắn muốn xóa mũi giày ${sanPham.ten} ?')"> <i class="menu-icon fa fa-trash-o"></i> Xóa</a> </td>--%>
<%--                                    </tr>--%>
<%--                                </c:forEach>--%>
                                </tbody>

                            </table>

                            <%--                            <button class="btn btn-warning">Xóa theo lựa chọn</button>--%>
                        </form>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-lg-4">
                        </div>
                        <div class="col-lg-8"  style="text-align: center;">
                            <nav aria-label="...">
                                <c:if test="${totalPage>0}">
                                    <ul class="pagination justify-content-end">
                                        <c:if test="${pageChoosedNumber > 0}">
                                            <li class="page-item">
                                                <a class="page-link" href="/san-pham/hien-thi?${pageChoosedNumber-1}" tabindex="-1" aria-disabled="true">Previous</a>
                                            </li>
                                        </c:if>

                                        <c:forEach begin="0" end="${totalPage - 1}" varStatus="loop">
                                            <c:choose>
                                                <c:when test="${pageChoosedNumber==loop.index}">
                                                    <li class="page-item active" aria-current="page" >
                                                        <a name="page" class="page-link"   href="/san-pham/hien-thi?page=${loop.index}">${loop.index + 1}</a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item" aria-current="page">
                                                        <a name="page" class="page-link" href="/san-pham/hien-thi?page=${loop.index}">${loop.index + 1}</a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test= "${pageChoosedNumber < (totalPage-1)}">
                                            <li class="page-item">
                                                <a class="page-link" href="/san-pham/hien-thi?page=${pageChoosedNumber+1}">Next</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </c:if>
                            </nav>
                        </div>
                    </div>

                </div>
            </div>
        </div><!-- .animated -->
    </div><!-- .content -->


    <div class="clearfix"></div>

    <!-- footer -->
    <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp"></jsp:include>
    <!--/ footer -->




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



</script>

</body>
</html>

