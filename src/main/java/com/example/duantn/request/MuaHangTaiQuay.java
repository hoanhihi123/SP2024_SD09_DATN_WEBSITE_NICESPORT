package com.example.duantn.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MuaHangTaiQuay {
    UUID idSanPhamCT;
    UUID idHoaDon;
    UUID idKhachHangChon;
    UUID idPhieuGiamGia;
    Integer soLuong_sanPhamMua;
    Integer soLuong_sanPhamKho;
    String sdt_KhachHang;
    Double tongTienDonHang;

}
