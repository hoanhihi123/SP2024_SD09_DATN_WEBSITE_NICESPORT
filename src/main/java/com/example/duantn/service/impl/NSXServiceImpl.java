package com.example.duantn.service.impl;

import com.example.duantn.model.DanhMuc;
import com.example.duantn.model.NSX;
import com.example.duantn.model.SanPham;
import com.example.duantn.repository.NSXRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class NSXServiceImpl {
    @Autowired
    NSXRepository  repo_NSX;

    public List<NSX> layDanhSach() {
        return repo_NSX.getAll();
    }

    public NSX chiTietTheoId(UUID id) {
        Optional<NSX> nhaSanXuat = repo_NSX.findById(id);
        NSX nhaSanXuatNsx = nhaSanXuat.get();
        return nhaSanXuatNsx;
    }

}

