package com.example.duantn.controller.banTaiQuay;

import com.example.duantn.dto.Constant;
import com.example.duantn.model.*;
import com.example.duantn.request.MuaHangTaiQuay;
import com.example.duantn.request.PhanTrangRequest;
import com.example.duantn.request.SanPhamTrongGioHang;
import com.example.duantn.service.impl.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.text.ParseException;
import java.util.*;

@Controller
@RequestMapping("/ban-hang")   // /ban-hang/view
public class BanHangTaiQuayController {

    // , khachHang, GiamGia, SanPhamCT, HoaDon
    @Autowired
    ChiTietSPServiceImpl sanPhamCTService;

    @Autowired
    PhieuGiamGiaServiceImpl phieuGiamGiaService;

    @Autowired
    HoaDonServiceImpl hoaDonService;

    @Autowired
    HoaDonCTServiceImpl hoaDonCTService;

    @Autowired
    KhachHangServiceImpl khachHangService;


    @GetMapping("view")
    public String xemBanHangTaiQuay(
            Model model,
            HttpServletRequest httpServletRequest
    ){
        sanPhamCTService.xoaSanPhamChiTietTheoTrangThai(2);

        return "admin/banHangTaiQuay/banHang2";
    }

    @PostMapping("/phan-trang-sanPhamChiTiet")
    public ResponseEntity<Map<String, Object>> phanTrangSanPhamChiTiet(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
            , @RequestBody PhanTrangRequest phanTrang
            ) throws IOException {
        int currentPage = 0;
        int pageLimit = phanTrang.getPageLimit()==null?4:phanTrang.getPageLimit();
        currentPage = phanTrang.getCurrentPage()==null?0:phanTrang.getCurrentPage();
//        System.out.println("Current page: " + currentPage);

        Pageable pageable = PageRequest.of(currentPage, pageLimit);
        Page<ChiTietSanPham> pageChiTietSP =  sanPhamCTService.layDanhSach(pageable);
        List<ChiTietSanPham> chiTietSanPhams = pageChiTietSP.getContent();


        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");
        jsonResult.put("danhSachSanPhamChiTiet", chiTietSanPhams);

        return ResponseEntity.ok(jsonResult);
    }

    @PostMapping("/phan-trang-hoaDonCho")
    public ResponseEntity<Map<String, Object>> phanTrangChoHoaDonCho(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
            , @RequestBody PhanTrangRequest phanTrang
    ) throws IOException {
        UUID idHoaDon = phanTrang.getIdHoaDon();
        int currentPage = 0;
        int pageLimit = phanTrang.getPageLimit()==null?2:phanTrang.getPageLimit();
        currentPage = phanTrang.getCurrentPage()==null?0:phanTrang.getCurrentPage();

//        System.out.println("IdHoa don hien tại trong /phan-trang-hoaDonCho :  " + idHoaDon);

        Pageable pageable = PageRequest.of(currentPage, pageLimit);
        Page<HoaDonChiTiet> pageHoaDonChiTiet =  hoaDonCTService.layDanhSachHoaDonChiTiet_va_PhanTrang(idHoaDon, pageable);
        List<HoaDonChiTiet> hoaDonChiTiets = pageHoaDonChiTiet.getContent();


//        System.out.println("Danh sách hóa đơn lấy được trong phân trang : " + hoaDonChiTiets.size());
        // có idHoaDon => lấy ra hóa dơn
        // từ hóa dơn => lấy ra khách hàng
        // từ khách hàng => set thông tin khách hàng vào kết quả trả về
        HoaDon hoaDonCurrent = hoaDonService.chiTietTheoId(idHoaDon);
        KhachHang khachHangOfHoaDon = khachHangService.layThongTinKhachHang_voiSDT("0000000000");
        if(hoaDonCurrent!=null){
//            System.out.println("Hoa đơn current - /phan-trang-hoaDonCho " + hoaDonCurrent.toString());
             khachHangOfHoaDon = khachHangService.layKhachHangTheoId(hoaDonCurrent.getKhachHang().getId());
        }
//        System.out.println("Size of hoa đơn chi tiết - /phan-trang-hoaDonCho : " + hoaDonChiTiets.size());
        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");
        jsonResult.put("danhSachHoaDonChiTiet", hoaDonChiTiets);
        jsonResult.put("khachHangOfHoaDon", khachHangOfHoaDon);

        return ResponseEntity.ok(jsonResult);
    }

    @PostMapping("/phan-trang-thongTinKhachHang")
    public ResponseEntity<Map<String, Object>> phanTrang_thongTinKhachHang(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
            , @RequestBody PhanTrangRequest phanTrang
    ) throws IOException {
        int currentPage = 0;
        int pageLimit = phanTrang.getPageLimit()==null?4:phanTrang.getPageLimit();
        currentPage = phanTrang.getCurrentPage()==null?0:phanTrang.getCurrentPage();
//        System.out.println("Current page: " + currentPage);

        Pageable pageable = PageRequest.of(currentPage, pageLimit);
        Page<KhachHang> pageKhachHang =  khachHangService.layDanhSach(pageable);
        List<KhachHang> khachHangs = pageKhachHang.getContent();




        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");
        jsonResult.put("danhSachKhachHang", khachHangs);


        return ResponseEntity.ok(jsonResult);
    }

    @PostMapping("/phan-trang-phieuGiamGia")
    public ResponseEntity<Map<String, Object>> phanTrang_phieuGiamGia(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
            , @RequestBody PhanTrangRequest phanTrang
    ) throws IOException {
        int currentPage = 0;
        int pageLimit = phanTrang.getPageLimit()==null?4:phanTrang.getPageLimit();
        currentPage = phanTrang.getCurrentPage()==null?0:phanTrang.getCurrentPage();

        Pageable pageable = PageRequest.of(currentPage, pageLimit);
        Page<PhieuGiamGia> pagePhieuGiamGia =  phieuGiamGiaService.layDanhSach_voiTongTienDonHang(pageable,phanTrang.getTongTienDonHang());
        List<PhieuGiamGia> phieuGiamGias = pagePhieuGiamGia.getContent();

        Double tongTienDonHang = phanTrang.getTongTienDonHang();
//        System.out.println("Tổng tiền đơn hàng - tại /phan-trang-phieuGiamGia : " + tongTienDonHang);

        List<PhieuGiamGia> dsPhieuGiamGiaHopLe = new ArrayList<>();
        int count = 0;
        if(tongTienDonHang!=null){
            for(PhieuGiamGia phieuGiamGia : phieuGiamGias){
                if(tongTienDonHang >= phieuGiamGia.getGiaTienXetDieuKien()){
                    dsPhieuGiamGiaHopLe.add(phieuGiamGia);
                    count++;
                }
            }
        }

//        System.out.println("Count - tại /phan-trang-phieuGiamGia : " + count);
//        System.out.println("Danh sách phiếu giảm giá hợp lệ - tại /phan-trang-phieuGiamGia : " + dsPhieuGiamGiaHopLe.size());

        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");
        jsonResult.put("danhSachPhieuGiamGia", dsPhieuGiamGiaHopLe);


        return ResponseEntity.ok(jsonResult);
    }

    @PostMapping("/capNhatThongTinHoaDon_apDungPhieuGiamGiaNao")
    public ResponseEntity<Map<String, Object>> capNhatThongTinPhieuGiamGia(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
            , @RequestBody MuaHangTaiQuay muaHangTaiQuay
    ) throws IOException {
        UUID idHoaDon = muaHangTaiQuay.getIdHoaDon();
        UUID idPhieuGiamGia = muaHangTaiQuay.getIdPhieuGiamGia();

        hoaDonService.capNhatPhieuGiamGiaApDungCho_hoaDonCho(idHoaDon, idPhieuGiamGia);

        // tinh tong tien duoc giam
        HoaDon hoaDonCurrent = hoaDonService.detail(idHoaDon);
        Double tongTienDonHang = hoaDonCurrent.getTongTienThanhToan();
            Double tongTienDonHangSauGiam = 0.0;

            PhieuGiamGia phieuGiamGia = phieuGiamGiaService.detail(idPhieuGiamGia);
            if(phieuGiamGia.getHinhThucGiam().equalsIgnoreCase("tiền mặt")){
                tongTienDonHangSauGiam = tongTienDonHang - phieuGiamGia.getGiaTriGiam();
            }else {
                tongTienDonHangSauGiam = tongTienDonHang - tongTienDonHang*(phieuGiamGia.getGiaTriGiam()/100);
            }
            
            Double tienDuocGiam = tongTienDonHang - tongTienDonHangSauGiam;

            hoaDonCurrent.setTongTienDuocGiamGia(tienDuocGiam);

            hoaDonService.update(idHoaDon, hoaDonCurrent);

        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");
        jsonResult.put("tongTienDonHang", hoaDonCurrent.getTongTienThanhToan());
        jsonResult.put("tienDuocGiam", tienDuocGiam);
        jsonResult.put("tongTienDonHangSauGiam", tongTienDonHangSauGiam);

        return ResponseEntity.ok(jsonResult);
    }

    @PostMapping("/capNhatTongTienDonHang_cuaHoaDonCurrent")
    public ResponseEntity<Map<String, Object>> capNhatTongTienDonHangHoaDonCurrent(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
            , @RequestBody PhanTrangRequest phanTrangRequest
    ) throws IOException {
        List<HoaDonChiTiet> dsHoaDonChiTiet = hoaDonCTService.layDanhSachHoaDonChiTiet_theoIdHoaDon(phanTrangRequest.getIdHoaDon());
        UUID idHoaDon = phanTrangRequest.getIdHoaDon();

        Double tongTienDonHang = 0.0;
        Double  tongTienSauGiam = 0.0;
        Double tienDuocGiam = 0.0;
            for(HoaDonChiTiet hoaDonChiTiet : dsHoaDonChiTiet){
                if (hoaDonChiTiet.getChiTietSanPham().getGiaTriGiam() > 0 && hoaDonChiTiet.getChiTietSanPham().getGiaTriGiam() != null) {
                    tongTienDonHang += (hoaDonChiTiet.getChiTietSanPham().getGiaTriGiam() * hoaDonChiTiet.getSoLuong());
                } else {
                    tongTienDonHang += (hoaDonChiTiet.getChiTietSanPham().getGiaTriSanPham() * hoaDonChiTiet.getSoLuong());
                }
            }

            HoaDon hoaDonCurrent = hoaDonService.chiTietTheoId(phanTrangRequest.getIdHoaDon());
            if(hoaDonCurrent!=null){
//                System.out.println("Hoa đơn current - capNhatTongTienDonHang_cuaHoaDonCurrent :  " + hoaDonCurrent.toString());
                hoaDonCurrent.setTongTienThanhToan(tongTienDonHang);
                if(hoaDonCurrent.getTongTienDuocGiamGia()==null){
                    hoaDonCurrent.setTongTienDuocGiamGia(0.0);
                }

            //            System.out.println("Hoa don current : " + hoaDonCurrent.toString());

                hoaDonService.capNhat(hoaDonCurrent);


            //        System.out.println("Tổng tiền đơn hàng : " + tongTienDonHang);
                tienDuocGiam = hoaDonCurrent.getTongTienDuocGiamGia();
                tongTienSauGiam  = tongTienDonHang - tienDuocGiam;
            }

        // tại sao phần tổng tiền sau giảm ko được tính


        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");
        jsonResult.put("tongTienDonHang", tongTienDonHang);
        if(hoaDonCurrent!=null) {
            jsonResult.put("tienDuocGiam", tienDuocGiam);
            jsonResult.put("tongTienDonHangSauGiam", tongTienSauGiam);
        }


//        System.out.println("Tổng tiền đơn hàng - " + tongTienDonHang);
//        System.out.println("Tiền được giảm - " + tienDuocGiam);
//        System.out.println("Tổng tiền sau giảm - " + tongTienSauGiam);
        return ResponseEntity.ok(jsonResult);
    }

    // api tự động tạo 1 hóa đơn chờ khi ko có hóa đơn chờ nào trong hệ thống
    @PostMapping("/tuDongTao1HoaDonCho")
    public ResponseEntity<?> tuDongTao1HoaDonCho(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
    ) throws IOException, ParseException {

        // lấy ra idKhachHangLe của Mã khách hàng là khách hàng lẻ
        KhachHang khachHangLe = khachHangService.layThongTinKhachHang_voiSDT("0000000000");

        HoaDon hoaDon_status_waitForPay = new HoaDon();
        hoaDon_status_waitForPay.setTrangThai(0);
        hoaDon_status_waitForPay.setKhachHang(khachHangLe);
        hoaDon_status_waitForPay.setLoaiHoaDon("Mua hàng tại quầy");
        hoaDon_status_waitForPay.setNgayMua(Constant.getDateNow());
        hoaDon_status_waitForPay.setNgayTao(Constant.getDateNow());

        HoaDon hoaDonTaoMoi = hoaDonService.themMoi(hoaDon_status_waitForPay);

        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");
        jsonResult.put("idHoaDon", hoaDonTaoMoi.getId());

        return ResponseEntity.ok(jsonResult);
    }

    // api lấy danh sách khách hàng theo sdt
    @PostMapping("/getListKhachHangBySDT")
    public ResponseEntity<Map<String, Object>> layDanhSachKhachHang_theoSDT(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
            , @RequestBody MuaHangTaiQuay muaHangTaiQuay
    ) throws IOException {
        List<KhachHang> dsKhachHang = khachHangService.layDanhSachKhachHang_theoSDT(muaHangTaiQuay.getSdt_KhachHang());

        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");
        jsonResult.put("danhSachKhacHang", dsKhachHang);

        return ResponseEntity.ok(jsonResult);
    }

    // api cập nhật idKhachHang trong hóa đơn chờ
    @PostMapping("/capNhatIdKhachHangTrongHoaDonChoDuocChon")
    public ResponseEntity<?> updateIDCustomerInBillWait(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
            , @RequestBody MuaHangTaiQuay muaHangTaiQuay
    ) throws IOException {
        // lấy ra thông tin khách hàng
        KhachHang khachHang = khachHangService.chiTietTheoId(muaHangTaiQuay.getIdKhachHangChon());

        HoaDon hoaDonCurrent = hoaDonService.chiTietTheoId(muaHangTaiQuay.getIdHoaDon());
        hoaDonCurrent.setTenKH(khachHang.getHoTen());
        hoaDonCurrent.setSoDT(khachHang.getSoDT());
        hoaDonCurrent.setEmail(khachHang.getEmail());

        hoaDonService.capNhat(hoaDonCurrent);

        hoaDonService.capNhatThongTinHoaDon_laThongTinKhachHang(muaHangTaiQuay.getIdHoaDon(), muaHangTaiQuay.getIdKhachHangChon());

        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");
        jsonResult.put("khachHangDuocChon", khachHang);

        return ResponseEntity.ok(jsonResult);
    }

    // api xóa sản phẩm khỏi hóa đơn chi tiết
    @PostMapping("/xoaSanPhamKhoiHoaDonChiTiet")
    public ResponseEntity<Map<String, Object>> xoaSanPhamKhoiHoaDonChiTiet(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
            , @RequestBody MuaHangTaiQuay muaHangTaiQuay
    ) throws IOException {

        hoaDonCTService.xoaSanPhamCTKhoiHoaDonChiTiet(muaHangTaiQuay.getIdHoaDon(), muaHangTaiQuay.getIdSanPhamCT());

        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");
        jsonResult.put("xacNhanXoa", true);

        return ResponseEntity.ok(jsonResult);
    }

    // api xoa hoa don cho va hoa don chi tiet cua hoa don cho
    @PostMapping("/xoaHoaDonCho_vaHoaDonChiTiet")
    public ResponseEntity<Map<String, Object>> xoaHoaDonCho_vaHoaDonChiTiet(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
            , @RequestBody MuaHangTaiQuay muaHangTaiQuay
    ) throws IOException {
        System.out.println("ID hóa đơn được chọn xóa : " + muaHangTaiQuay.getIdHoaDon());
        hoaDonCTService.xoaHoaDonChiTietBangIDHoaDon(muaHangTaiQuay.getIdHoaDon());
        hoaDonService.xoaHoaDonBangIdHoaDon(muaHangTaiQuay.getIdHoaDon());

        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");
        jsonResult.put("xacNhanXoa", true);

        return ResponseEntity.ok(jsonResult);
    }

    @PostMapping("/taoHoaDonThanhToanTaiQuay")
    public ResponseEntity<Map<String, Object>> taoHoaDonThanhToanTaiQuay(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
            , @RequestBody MuaHangTaiQuay muaHangTaiQuay
    ) throws IOException, ParseException {
        UUID idHoaDon = muaHangTaiQuay.getIdHoaDon();
        // cap nhat trang thai hoa don va hoa don chi tiet
        HoaDon hoaDonCurrent = hoaDonService.chiTietTheoId(idHoaDon);
        hoaDonCurrent.setTrangThai(1);
        hoaDonCurrent.setNgayThanhToan(Constant.getDateNow());
        hoaDonCurrent.setNgaySua(Constant.getDateNow());
        hoaDonCurrent.setHinhThucTT("Tiền mặt");

        if(hoaDonCurrent.getKhachHang().getId()!=null){
            KhachHang khachHangCurrent = khachHangService.layKhachHangTheoId(hoaDonCurrent.getKhachHang().getId());
            hoaDonCurrent.setKhachHang(khachHangCurrent);
            hoaDonCurrent.setTenKH(khachHangCurrent.getHoTen());
            hoaDonCurrent.setSoDT(khachHangCurrent.getSoDT());
            hoaDonCurrent.setEmail(khachHangCurrent.getEmail());
        }

        hoaDonService.capNhat(hoaDonCurrent);

        List<HoaDonChiTiet> dsHoaDonChiTietCuaHoaDonHienTai = new ArrayList<>();
        dsHoaDonChiTietCuaHoaDonHienTai = hoaDonCTService.layDanhSachHoaDonChiTiet_theoIdHoaDon(idHoaDon);
        for(HoaDonChiTiet hoaDonChiTiet : dsHoaDonChiTietCuaHoaDonHienTai){
            hoaDonChiTiet.setTrangThai(1);
            hoaDonCTService.capNhat(hoaDonChiTiet);
        }

        if(hoaDonCurrent.getPhieuGiamGia()!=null){
            // cap nhat so luong voucher áp dụng
            PhieuGiamGia phieuGiamGia = phieuGiamGiaService.detail(hoaDonCurrent.getPhieuGiamGia().getId());
            phieuGiamGia.setSoLuong(phieuGiamGia.getSoLuong()-1);

            phieuGiamGiaService.capNhat(phieuGiamGia);
        }

        // cập nhật số lượng trong kho khi mua tại quầy ngay khi thanh toán
        for (HoaDonChiTiet sanPhamChiTietTrongHoaDon : dsHoaDonChiTietCuaHoaDonHienTai) {
            // cập nhật số lượng sản phẩm trong DB
            sanPhamCTService.capNhatSoLuongSauKhiDatHang(sanPhamChiTietTrongHoaDon.getSoLuong(), sanPhamChiTietTrongHoaDon.getChiTietSanPham().getId());
        }


        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");

        return ResponseEntity.ok(jsonResult);
    }
}
