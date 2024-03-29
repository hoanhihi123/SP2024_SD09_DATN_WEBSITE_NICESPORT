package com.example.duantn.service.impl;

import com.example.duantn.model.ChucVu;
import com.example.duantn.repository.ChucVuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChucVuServiceImpl {
    @Autowired
    ChucVuRepository repo_chucVu;

    public List<ChucVu> layDanhSach() {
        return repo_chucVu.getAll();
    }
}
