package com.example.duantn.controller.banTaiQuay;

import com.example.duantn.dto.Constant;
import com.example.duantn.model.*;
import com.example.duantn.request.GioHang;
import com.example.duantn.request.MuaHangTaiQuay;
import com.example.duantn.request.PhanTrangRequest;
import com.example.duantn.request.SanPhamTrongGioHang;
import com.example.duantn.service.HoaDonService;
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
        // ds hoa don
        HttpSession session = httpServletRequest.getSession();

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
        HoaDon hoaDonCurrent = hoaDonService.detail(idHoaDon);
        KhachHang khachHangOfHoaDon = khachHangService.layKhachHangTheoId(hoaDonCurrent.getKhachHang().getId());

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
//        System.out.println("Current page: " + currentPage);


        Pageable pageable = PageRequest.of(currentPage, pageLimit);
        Page<PhieuGiamGia> pagePhieuGiamGia =  phieuGiamGiaService.layDanhSach(pageable);
        List<PhieuGiamGia> phieuGiamGias = pagePhieuGiamGia.getContent();


        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");
        jsonResult.put("danhSachPhieuGiamGia", phieuGiamGias);


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
}
