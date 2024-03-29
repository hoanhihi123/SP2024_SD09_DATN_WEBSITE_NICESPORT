package com.example.duantn.service.impl;

import com.example.duantn.model.ThuongHieu;
import com.example.duantn.repository.ThuongHieuRepository;
import com.example.duantn.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class ThuongHieuServiceImpl implements BaseService<ThuongHieu> {
    @Autowired
    ThuongHieuRepository repo_thuongHieu;

    @Override
    public Page<ThuongHieu> layDanhSach(Pageable pageable) {
        return null;
    }

    @Override
    public Page<ThuongHieu> layDanhSach(String textSearch, Pageable pageable) {
        return null;
    }

    @Override
    public void xoa(UUID id) {

    }

    @Override
    public void themMoi(ThuongHieu entity) {

    }


    @Override
    public void capNhat(ThuongHieu entity) {
        repo_thuongHieu.save(entity);
    }

    @Override
    public ThuongHieu chiTietTheoId(UUID id) {
        return null;
    }

    @Override
    public List<ThuongHieu> layDanhSachTheoTen(String ten) {
        return null;
    }

    @Override
    public List<ThuongHieu> layDanhSach() {
        return null;
    }
}
