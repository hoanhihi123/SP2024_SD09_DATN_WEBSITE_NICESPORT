package com.example.duantn.service.impl;

import com.example.duantn.model.DayGiay;
import com.example.duantn.repository.DayGiayRepository;
import com.example.duantn.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class DayGiayServiceImpl implements BaseService<DayGiay> {
    @Autowired
    DayGiayRepository repo_dayGiay;
//    @Override
//    public List<DayGiay> layDanhSach() {
//        return repo_dayGiay.getAll();
//    }

    @Override
    public Page<DayGiay> layDanhSach(Pageable pageable) {
        return null;
    }

    @Override
    public Page<DayGiay> layDanhSach(String textSearch, Pageable pageable) {
        return null;
    }

    @Override
    public void xoa(UUID id) {

    }

    @Override
    public void themMoi(DayGiay entity) {

    }

    @Override
    public void capNhat(DayGiay entity) {

        repo_dayGiay.save(entity);
    }

    @Override
    public DayGiay chiTietTheoId(UUID id) {
        return null;
    }

    @Override
    public List<DayGiay> layDanhSachTheoTen(String ten) {
        return null;
    }

    @Override
    public List<DayGiay> layDanhSach() {
        return null;
    }
}
