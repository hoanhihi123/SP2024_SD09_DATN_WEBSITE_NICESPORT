package com.example.duantn.service.impl;

import com.example.duantn.model.HoaDon;
import com.example.duantn.repository.HoaDonRepository;
import com.example.duantn.service.HoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class HoaDonServiceImpl implements HoaDonService {

    @Autowired
    HoaDonRepository hoaDonRepository;
    @Override
    public List<HoaDon> getAll() {
        return hoaDonRepository.getAll();
    }

    @Override
    public void delete(UUID id) {
        hoaDonRepository.deleteById(id);

    }

    @Override
    public void add(HoaDon hoaDon) {
        hoaDonRepository.save(hoaDon);

    }

    public HoaDon themMoi(HoaDon hoaDon) {
      return hoaDonRepository.save(hoaDon);
    }

    @Override
    public HoaDon detail(UUID id) {
        HoaDon hoaDon = hoaDonRepository.findById(id).get();
        return hoaDon;
    }

    @Override
    public HoaDon update(UUID id, HoaDon hoaDon) {
        HoaDon hoaDon1 = hoaDonRepository.save(hoaDon);
        return hoaDon1;
    }

    public HoaDon layHoaDonTheoMa(String ma){
        HoaDon hoaDon = hoaDonRepository.getHoaDonBy_ma(ma);
        return hoaDon;
    }
}
