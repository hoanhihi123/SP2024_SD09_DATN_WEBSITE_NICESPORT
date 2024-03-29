package com.example.duantn.service.impl;

import com.example.duantn.model.KieuDang;
import com.example.duantn.repository.KieuDangRepository;
import com.example.duantn.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class KieuDangServiceImpl implements BaseService<KieuDang> {
    @Autowired
    KieuDangRepository repo_kieuDang;


//    @Override
//    public List<KieuDang> layDanhSach() {
//        return repo_kieuDang.getAll();
//    }
//
//    @Override
//    public List<KieuDang> findByCondition(KieuDang entity) {
//        return null;
//    }

    @Override
    public Page<KieuDang> layDanhSach(Pageable pageable) {
        return null;
    }

    @Override
    public Page<KieuDang> layDanhSach(String textSearch, Pageable pageable) {
        return null;
    }

//    @Override
//    public Page<KieuDang> findPage(KieuDang entity, Pageable pageable) {
//        return null;
//    }

    @Override
    public void xoa(UUID id) {

    }

    @Override
    public void themMoi(KieuDang entity) {

    }

    @Override
    public void capNhat(KieuDang entity) {
        repo_kieuDang.save(entity);
    }

//    @Override
//    public KieuDang capNhat(KieuDang entity) {
//        return null;
//    }

    @Override
    public KieuDang chiTietTheoId(UUID id) {
        return null;
    }

    @Override
    public List<KieuDang> layDanhSachTheoTen(String ten) {
        return null;
    }

    @Override
    public List<KieuDang> layDanhSach() {
        return repo_kieuDang.getAll();
    }
}
