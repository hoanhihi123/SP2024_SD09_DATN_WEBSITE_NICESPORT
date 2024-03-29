package com.example.duantn.service.impl;

import com.example.duantn.model.LotGiay;
import com.example.duantn.repository.LotGiayRepository;
import com.example.duantn.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class LotGiayServiceImpl implements BaseService<LotGiay> {
    @Autowired
    LotGiayRepository lotGiayRepository;

//    @Override
//    public List<LotGiay> getAll() {
//        return lotGiayRepository.getAll();
//    }
//
//    @Override
//    public void delete(UUID id) {
//
//        lotGiayRepository.deleteById(id);
//    }
//
//    @Override
//    public void add(LotGiay lotGiay) {
//
//        lotGiayRepository.save(lotGiay);
//    }

//    @Override
//    public LotGiay detail(UUID id) {
//        LotGiay lotGiay = lotGiayRepository.findById(id).get();
//        return lotGiay;
//    }
//
//    @Override
//    public LotGiay update(UUID id, LotGiay lotGiay) {
//        LotGiay lotGiay1 = lotGiayRepository.save(lotGiay);
//        return lotGiay1;
//    }
//
//    @Override
//    public List<LotGiay> layDanhSach() {
//        return null;
//    }

//    @Override
//    public List<LotGiay> findByCondition(LotGiay entity) {
//        return null;
//    }

    @Override
    public Page<LotGiay> layDanhSach(Pageable pageable) {
        return null;
    }

    @Override
    public Page<LotGiay> layDanhSach(String textSearch, Pageable pageable) {
        return null;
    }

//    @Override
//    public Page<LotGiay> findPage(LotGiay entity, Pageable pageable) {
//        return null;
//    }

    @Override
    public void xoa(UUID id) {

    }

    @Override
    public void themMoi(LotGiay entity) {

    }

    @Override
    public void capNhat(LotGiay entity) {
        lotGiayRepository.save(entity);
    }

    public void capNhat(UUID id,  LotGiay entity) {
        lotGiayRepository.save(entity);
    }


    @Override
    public LotGiay chiTietTheoId(UUID id) {
        return null;
    }

    @Override
    public List<LotGiay> layDanhSachTheoTen(String ten) {
        return null;
    }

    @Override
    public List<LotGiay> layDanhSach() {
        return lotGiayRepository.getAll();
    }
}
