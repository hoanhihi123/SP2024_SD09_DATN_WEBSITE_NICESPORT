package com.example.duantn.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChiTietSanPham_themRequest {
    private UUID idSanPham;
    private UUID idThuongHieu;
    private UUID idNSX;
    private UUID idDanhMuc;
    private UUID idLoaiSanPham;
    private UUID idKieuDang;
    private UUID idChatLieu;
    private UUID idMuiGiay;
    private UUID idDayGiay;
    private UUID idDeGiay;
    private UUID idLotGiay;
    private String moTa;
    private Integer trangThai;

    private UUID idMauSac;
    private UUID idSizeGiay;

    private String duongDanAnhChinh;
    private ArrayList<String> danhSachDuongDanAnhPhu;


}
