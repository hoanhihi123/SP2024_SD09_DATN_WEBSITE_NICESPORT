package com.example.duantn.service.impl;

import com.example.duantn.model.DanhMuc;
import com.example.duantn.model.LoaiSanPham;
import com.example.duantn.repository.LoaiSanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class LoaiSanPhamServiceImpl {
    @Autowired
    LoaiSanPhamRepository repo_loaiSanPham;

    public List<LoaiSanPham> layDanhSach() {
        return repo_loaiSanPham.getAll();
    }

    public LoaiSanPham chiTietTheoId(UUID id) {
        Optional<LoaiSanPham> loaiSanPham = repo_loaiSanPham.findById(id);
        LoaiSanPham loaiSanPham1 = loaiSanPham.get();
        return loaiSanPham1;
    }
}
