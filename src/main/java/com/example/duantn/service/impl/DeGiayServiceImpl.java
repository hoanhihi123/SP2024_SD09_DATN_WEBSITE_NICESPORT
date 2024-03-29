package com.example.duantn.service.impl;

import com.example.duantn.model.DeGiay;
import com.example.duantn.repository.DeGiayRepository;
import com.example.duantn.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class DeGiayServiceImpl implements BaseService<DeGiay> {
    @Autowired
    DeGiayRepository repo_deGiay;

//
//    @Override
//    public List<DeGiay> layDanhSach() {
//        return repo_deGiay.getAll();
//    }

    @Override
    public Page<DeGiay> layDanhSach(Pageable pageable) {
        return null;
    }

    @Override
    public Page<DeGiay> layDanhSach(String textSearch, Pageable pageable) {
        return null;
    }

    @Override
    public void xoa(UUID id) {

    }

    @Override
    public void themMoi(DeGiay entity) {

    }

    @Override
    public void capNhat(DeGiay entity) {
        repo_deGiay.save(entity);
    }

    @Override
    public DeGiay chiTietTheoId(UUID id) {
        return null;
    }

    @Override
    public List<DeGiay> layDanhSachTheoTen(String ten) {
        return null;
    }

    @Override
    public List<DeGiay> layDanhSach() {
        return null;
    }
}
