package com.example.duantn.controller.admin;

import com.example.duantn.dto.Constant;
import com.example.duantn.model.*;
import com.example.duantn.request.ChiTietSanPham_themRequest;
import com.example.duantn.request.SanPhamRequest;
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
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/admin/quanLySanPham")   //  /admin/quanLySanPham/viewSuaSanPhamChiTiet/
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
    HinhAnhGiaysService hinhAnhGiaysService;


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
    public String taoSanPhamChiTiet(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
            ,  ChiTietSanPham_themRequest chiTietSP_request
            , @ModelAttribute("sanPhamChiTiet") ChiTietSanPham_themRequest chiTietSanPham
            , @RequestParam("duongDanAnhChinh") MultipartFile fileAnhChinh
            , @RequestParam("duongDanAnhCon") MultipartFile[] cacFileAnhCon
            ) throws IOException, ParseException {
        SanPham sanPhamThem = new SanPham();
        sanPhamThem = sanPhamService.chiTietTheoId(chiTietSP_request.getIdSanPham());

        ThuongHieu thuongHieuThem = new ThuongHieu();
        thuongHieuThem = thuongHieuService.chiTietTheoId(chiTietSP_request.getIdThuongHieu());

        NSX nsxThem = new NSX();
        nsxThem = nsxService.chiTietTheoId(chiTietSP_request.getIdNSX());

        DanhMuc danhMucThem = new DanhMuc();
        danhMucThem = danhMucService.chiTietTheoId(chiTietSP_request.getIdDanhMuc());

        LoaiSanPham loaiSanPhamThem = new LoaiSanPham();
        loaiSanPhamThem = loaiSanPhamService.chiTietTheoId(chiTietSP_request.getIdLoaiSanPham());

        KieuDang kieuDangThem = new KieuDang();
        kieuDangThem = kieuDangService.chiTietTheoId(chiTietSP_request.getIdKieuDang());

        ChatLieu chatLieuThem = new ChatLieu();
        chatLieuThem = chatLieuService.chiTietTheoId(chiTietSP_request.getIdChatLieu());

        MuiGiay muiGiayThem = new MuiGiay();
        muiGiayThem = muiGiayService.chiTietTheoId(chiTietSP_request.getIdMuiGiay());

        DayGiay dayGiayThem = new DayGiay();
        dayGiayThem = dayGiayService.chiTietTheoId(chiTietSP_request.getIdDayGiay());

        DeGiay deGiayThem = new DeGiay();
        deGiayThem = deGiayService.chiTietTheoId(chiTietSP_request.getIdDeGiay());

        LotGiay lotGiayThem = new LotGiay();
        lotGiayThem = lotGiayService.chiTietTheoId(chiTietSP_request.getIdLotGiay());

        MauSac mauSacThem = new MauSac();
        mauSacThem = mauSacService.chiTietTheoId(chiTietSP_request.getIdMauSac());

        KichCo kichCoThem = new KichCo();
        kichCoThem = kichCoService.chiTietTheoId(chiTietSP_request.getIdSizeGiay());

            // lưu đường dẫn ảnh vào project : để khi lấy dữ liệu từ DB ra có thể hiển thị được ảnh lên
            String urlSaveImageChinh_resource = "C:/Users/DELL/Documents/DuAnTotNghiep_2024/DATN_Final/SP2024_SD09_DATN_WEBSITE_NICESPORT/src/main/resources/static/user/assets/imagesgiay/" + fileAnhChinh.getOriginalFilename();

            File luuAnhVaoResource = new File(urlSaveImageChinh_resource);
            fileAnhChinh.transferTo(luuAnhVaoResource);
            // đường dẫn ảnh => lưu vào DB
            String urlAnhChinh_toSaveDB = "/user/assets/imagesgiay/" + fileAnhChinh.getOriginalFilename();
            System.out.println("url save to DB : " + urlAnhChinh_toSaveDB );
            // in ra đường dẫn ảnh chính
            System.out.println("Đường dẫn ảnh chính : " + urlSaveImageChinh_resource);

//            for(MultipartFile anhCon : cacFileAnhCon){
//                String urlDuongDanAnhCon = anhCon.getOriginalFilename();
//                System.out.println("Đường dẫn ảnh con : " + urlDuongDanAnhCon);
//            }

            ChiTietSanPham chiTietSanPhamThemMoi = new ChiTietSanPham();
            chiTietSanPhamThemMoi.setSanPham(sanPhamThem);
            chiTietSanPhamThemMoi.setThuongHieu(thuongHieuThem);
            chiTietSanPhamThemMoi.setNsx(nsxThem);
            chiTietSanPhamThemMoi.setDanhMuc(danhMucThem);
            chiTietSanPhamThemMoi.setLoaiSanPham(loaiSanPhamThem);
            chiTietSanPhamThemMoi.setKieuDang(kieuDangThem);
            chiTietSanPhamThemMoi.setChatLieu(chatLieuThem);
            chiTietSanPhamThemMoi.setMuiGiay(muiGiayThem);
            chiTietSanPhamThemMoi.setDayGiay(dayGiayThem);
            chiTietSanPhamThemMoi.setDeGiay(deGiayThem);
            chiTietSanPhamThemMoi.setLotGiay(lotGiayThem);

            chiTietSanPhamThemMoi.setMauSac(mauSacThem);
            chiTietSanPhamThemMoi.setKichCo(kichCoThem);

            chiTietSanPhamThemMoi.setKhoiLuong(chiTietSP_request.getKhoiLuong());
            chiTietSanPhamThemMoi.setGiaTriSanPham(Double.parseDouble(chiTietSP_request.getGiaTriSanPham()));
            chiTietSanPhamThemMoi.setSoLuong(chiTietSP_request.getSoLuong());

            chiTietSanPhamThemMoi.setMoTa(chiTietSP_request.getMoTa());
            chiTietSanPhamThemMoi.setTrangThai(chiTietSanPham.getTrangThai());
            chiTietSanPhamThemMoi.setHinhAnh(urlAnhChinh_toSaveDB);

          ChiTietSanPham chiTietSanPhamVuaThem = chiTietSPService.themMoi_traVeKetQua(chiTietSanPhamThemMoi);

            for(int i=0;i<cacFileAnhCon.length; i++){

                String urlSaveImageCon_toResource = "C:/Users/DELL/Documents/DuAnTotNghiep_2024/DATN_Final/SP2024_SD09_DATN_WEBSITE_NICESPORT/src/main/resources/static/user/assets/imagesgiay/"
                        + cacFileAnhCon[i].getOriginalFilename();

                File luuAnhVaoResource2 = new File(urlSaveImageCon_toResource);
                cacFileAnhCon[i].transferTo(luuAnhVaoResource2);

                String urlDuongDanAnhConSaveToDB = "/user/assets/imagesgiay/" +cacFileAnhCon[i].getOriginalFilename();
                System.out.println("Đường dẫn ảnh con : " + urlDuongDanAnhConSaveToDB);
                HinhAnhGiays hinhAnhGiaysThemMoi = new HinhAnhGiays();
                hinhAnhGiaysThemMoi.setChiTietSanPham(chiTietSanPhamVuaThem);
                hinhAnhGiaysThemMoi.setNgayTao(Constant.getDateNow());
                hinhAnhGiaysThemMoi.setNguoiTao(1);
                hinhAnhGiaysThemMoi.setDuongDanAnh(urlDuongDanAnhConSaveToDB);
                hinhAnhGiaysService.themMoi(hinhAnhGiaysThemMoi);
            }

        return "redirect:/admin/quanLySanPham/hien-thi";
    }

    @GetMapping("/viewSanPhamChiTiet/{id}")
    public String view_sua(
            @PathVariable("id") UUID idSanPham ,
            Model model,
            @RequestParam(name = "page",defaultValue = "0") int currentPage ,
            HttpServletRequest request
    ) {
        String textSearch = request.getParameter("textsearch");

        // phan trang
        Pageable pageable = PageRequest.of(currentPage, Constant.pageNumber);
        Page<ChiTietSanPham> pageSanPham =  chiTietSPService.layDanhSachTheoIDSanPham(idSanPham, pageable);
        List<ChiTietSanPham> sanPhams = pageSanPham.getContent();

        // muon hien thi so trang
        model.addAttribute("idSanPham", idSanPham);
        model.addAttribute("tongSL",pageSanPham.getNumberOfElements());
        model.addAttribute("totalPage",pageSanPham.getTotalPages());
        model.addAttribute("dsSanPham", sanPhams);
        model.addAttribute("pageChoosedNumber",currentPage);
        return "admin/quanLySanPham/viewSanPhamChiTietCuaSanPham";
    }

    @GetMapping("/viewSuaSanPhamChiTiet/{id}")
    public String viewSuaSanPhamChiTiet(
            @PathVariable("id") UUID idSanPhamChiTiet ,
            Model model,
            @RequestParam(name = "page",defaultValue = "0") int currentPage ,
            HttpServletRequest request
    ) {
//        String textSearch = request.getParameter("textsearch");
//
//        // phan trang
//        Pageable pageable = PageRequest.of(currentPage, Constant.pageNumber);
//        Page<ChiTietSanPham> pageSanPham =  chiTietSPService.layDanhSachTheoIDSanPham(idSanPham, pageable);
//        List<ChiTietSanPham> sanPhams = pageSanPham.getContent();
//
//        // muon hien thi so trang
//        model.addAttribute("idSanPham", idSanPham);
//        model.addAttribute("tongSL",pageSanPham.getNumberOfElements());
//        model.addAttribute("totalPage",pageSanPham.getTotalPages());
//        model.addAttribute("dsSanPham", sanPhams);
//        model.addAttribute("pageChoosedNumber",currentPage);
        return "admin/quanLySanPham/viewSuaSanPhamChiTiet";
    }

}
