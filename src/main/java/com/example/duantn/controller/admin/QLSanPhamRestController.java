package com.example.duantn.controller.admin;

import com.example.duantn.service.LotGiayService;
import com.example.duantn.service.impl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
@RequestMapping("/api/ql-san-pham")   // /api/ban-hang/getDanhSachSanPham
public class QLSanPhamRestController {
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
    MauSacServiceImpl mauSacService;

    @Autowired
    KichCoServiceImpl kichCoService;

    @GetMapping("/getDanhSachSanPham")
    public ResponseEntity<?> layDanhSachSanPham(
    ){
        return ResponseEntity.of(Optional.ofNullable(sanPhamService.layDanhSach()));
    }

    @GetMapping("/getDanhSachThuongHieu")
    public ResponseEntity<?> layDanhSachThuongHieu(
    ){
        return ResponseEntity.of(Optional.ofNullable(thuongHieuService.layDanhSach()));
    }

    @GetMapping("/getDanhSachNSX")
    public ResponseEntity<?> layDanhSachNSX(
    ){
        return ResponseEntity.of(Optional.ofNullable(nsxService.layDanhSach()));
    }

    @GetMapping("/getDanhSachDanhMuc")
    public ResponseEntity<?> layDanhSachDanhMuc(
    ){
        return ResponseEntity.of(Optional.ofNullable(danhMucService.layDanhSach()));
    }

    @GetMapping("/getDanhSachLoaiSanPham")
    public ResponseEntity<?> layDanhSachLoaiSanPham(
    ){
        return ResponseEntity.of(Optional.ofNullable(loaiSanPhamService.layDanhSach()));
    }

    @GetMapping("/getDanhSachKieuDang")
    public ResponseEntity<?> layDanhSachKieuDang(
    ){
        return ResponseEntity.of(Optional.ofNullable(kieuDangService.layDanhSach()));
    }

    @GetMapping("/getDanhSachChatLieu")
    public ResponseEntity<?> layDanhSachChatLieu(
    ){
        return ResponseEntity.of(Optional.ofNullable(chatLieuService.layDanhSach()));
    }

    @GetMapping("/getDanhSachMuiGiay")
    public ResponseEntity<?> layDanhSachMuiGiay(
    ){
        return ResponseEntity.of(Optional.ofNullable(muiGiayService.layDanhSach()));
    }

    @GetMapping("/getDanhSachDayGiay")
    public ResponseEntity<?> layDanhSachDayGiay(
    ){
        return ResponseEntity.of(Optional.ofNullable(dayGiayService.layDanhSach()));
    }

    @GetMapping("/getDanhSachDeGiay")
    public ResponseEntity<?> layDanhSachDeGiay(
    ){
        return ResponseEntity.of(Optional.ofNullable(deGiayService.layDanhSach()));
    }

    @GetMapping("/getDanhSachLotGiay")
    public ResponseEntity<?> layDanhSachLotGiay(
    ){
        return ResponseEntity.of(Optional.ofNullable(lotGiayService.layDanhSach()));
    }
    @GetMapping("/getDanhSachMauSac")
    public ResponseEntity<?> layDanhSachMauSac (
    ){
        return ResponseEntity.of(Optional.ofNullable(mauSacService.layDanhSach()));
    }

    @GetMapping("/getDanhSachSizeGiay")
    public ResponseEntity<?> layDanhSachSizeGiay(
    ){
        return ResponseEntity.of(Optional.ofNullable(kichCoService.layDanhSach()));
    }




}
