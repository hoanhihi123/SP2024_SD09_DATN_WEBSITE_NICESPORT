package com.example.duantn.controller.admin;

import com.example.duantn.dto.Constant;
import com.example.duantn.model.*;
import com.example.duantn.request.ChiTietSanPham_themRequest;
import com.example.duantn.request.MuaHangTaiQuay;
import com.example.duantn.service.SanPhamCTService;
import com.example.duantn.service.impl.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.text.ParseException;
import java.util.*;

@Controller
@RequestMapping("/admin/quanLySanPham")   //  /admin/quanLySanPham/view-tao-sanPhamChiTiet
public class QLSanPhamController {

    @Autowired
    SanPhamServiceImpl sanPhamService;

    @Autowired
    ThuongHieuServiceImpl thuongHieuService;

    @Autowired
    NSXServiceImpl nsxService;

    @Autowired
    DanhMucServiceImpl danhMucService;

    @Autowired
    LoaiSanPhamServiceImpl loaiSanPhamService;

    @Autowired
    KieuDangServiceImpl kieuDangService;

    @Autowired
    ChatLieuServiceImpl chatLieuService;

    @Autowired
    MuiGiayServiceImpl muiGiayService;

    @Autowired
    DayGiayServiceImpl dayGiayService;

    @Autowired
    DeGiayServiceImpl deGiayService;

    @Autowired
    LotGiayServiceImpl lotGiayService;

    @Autowired
    ChiTietSPServiceImpl chiTietSPService;

    @Autowired
    MauSacServiceImpl mauSacService;


    @Autowired
    KichCoServiceImpl kichCoService;

    @GetMapping("/hien-thi")
    public String index(
            Model model,
            @RequestParam(name = "page", defaultValue = "0") int currentPage,
            HttpServletRequest request
    ) {
        model.addAttribute("sanPham", new SanPham());
        String textSearch = request.getParameter("textsearch");

        // phan trang
        Pageable pageable = PageRequest.of(currentPage, Constant.pageNumber);
        Page<SanPham> pageSanPham =  sanPhamService.layDanhSach(textSearch, pageable);
        List<SanPham> sanPhams = pageSanPham.getContent();

        // muon hien thi so trang
        model.addAttribute("tongSL",pageSanPham.getNumberOfElements());
        model.addAttribute("totalPage",pageSanPham.getTotalPages());
        model.addAttribute("dsSanPham", sanPhams);
        model.addAttribute("pageChoosedNumber",currentPage);
        return "admin/quanLySanPham/qLSanPham";
    }

    @GetMapping("/view-tao-sanPhamChiTiet")
    public String quanLySanPhamChiTiet(
            Model model,
            @RequestParam(name = "page",defaultValue = "0") int currentPage ,
            HttpServletRequest request ,
            @ModelAttribute("sanPhamChiTiet") ChiTietSanPham_themRequest chiTietSP_request
    ) {

        model.addAttribute("sanPhamChiTiet", new ChiTietSanPham());
        String textSearch = request.getParameter("textsearch");

        // phan trang
        Pageable pageable = PageRequest.of(currentPage, Constant.pageNumber);
        Page<SanPham> pageSanPham =  sanPhamService.layDanhSach(textSearch, pageable);
        List<SanPham> sanPhams = pageSanPham.getContent();

        // muon hien thi so trang
        model.addAttribute("tongSL",pageSanPham.getNumberOfElements());
        model.addAttribute("totalPage",pageSanPham.getTotalPages());
        model.addAttribute("dsSanPham", sanPhams);
        model.addAttribute("pageChoosedNumber",currentPage);
        return "admin/quanLySanPham/qlSanPhamChiTiet";
    }


    @PostMapping("/taoSanPhamChiTiet")
    public ResponseEntity<Map<String, Object>> taoSanPhamChiTiet(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
            , @RequestBody ChiTietSanPham_themRequest chiTietSP_request
            , @ModelAttribute("sanPhamChiTiet") ChiTietSanPham_themRequest chiTietSanPham
            ) throws IOException, ParseException {
        SanPham sanPhamThem = new SanPham();
        sanPhamThem.setId(chiTietSP_request.getIdSanPham());

        ThuongHieu thuongHieuThem = new ThuongHieu();
        thuongHieuThem.setId(chiTietSP_request.getIdThuongHieu());

        NSX nsxThem = new NSX();
        nsxThem.setId(chiTietSP_request.getIdNSX());

        DanhMuc danhMucThem = new DanhMuc();
        danhMucThem.setId(chiTietSP_request.getIdDanhMuc());

        LoaiSanPham loaiSanPhamThem = new LoaiSanPham();
        loaiSanPhamThem.setId(chiTietSP_request.getIdLoaiSanPham());

        KieuDang kieuDangThem = new KieuDang();
        kieuDangThem.setId(chiTietSP_request.getIdKieuDang());

        ChatLieu chatLieuThem = new ChatLieu();
        chatLieuThem.setId(chiTietSP_request.getIdChatLieu());

        MuiGiay muiGiayThem = new MuiGiay();
        muiGiayThem.setId(chiTietSP_request.getIdMuiGiay());

        DayGiay dayGiayThem = new DayGiay();
        dayGiayThem.setId(chiTietSP_request.getIdDayGiay());

        DeGiay deGiayThem = new DeGiay();
        deGiayThem.setId(chiTietSP_request.getIdDeGiay());

        LotGiay lotGiayThem = new LotGiay();
        lotGiayThem.setId(chiTietSP_request.getIdLotGiay());

        MauSac mauSacThem = new MauSac();
        mauSacThem.setId(chiTietSP_request.getIdMauSac());

        KichCo kichCoThem = new KichCo();
        kichCoThem.setId(chiTietSP_request.getIdSizeGiay());

        String duongDanAnh_chinh_tuyetDoi = chiTietSP_request.getDuongDanAnhChinh();
        System.out.println("Đường dẫn ảnh chính tuyệt đối : " + duongDanAnh_chinh_tuyetDoi);


        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");
        jsonResult.put("message","Thêm sản phẩm thành công");

        return ResponseEntity.ok(jsonResult);
    }


}
