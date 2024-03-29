package com.example.duantn.service.impl;

import com.example.duantn.model.KhachHang;
import com.example.duantn.repository.KhachHangRepository;
import com.example.duantn.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class KhachHangServiceImpl implements BaseService<KhachHang> {
    @Autowired
    KhachHangRepository repo_khachHang;


    @Override
    public Page<KhachHang> layDanhSach(Pageable pageable) {
        return repo_khachHang.getAll(pageable);
    }

    @Override
    public Page<KhachHang> layDanhSach(String textSearch, Pageable pageable) {
        if(textSearch!=null){
            return repo_khachHang.getAll(textSearch, pageable);
        }
        return repo_khachHang.getAll(pageable);
    }

    @Override
    public void xoa(UUID id) {
        repo_khachHang.deleteById(id);
    }

    @Override
    public void themMoi(KhachHang entity) {
        repo_khachHang.save(entity);
    }

    @Override
    public void capNhat(KhachHang entity) {
        repo_khachHang.save(entity);
    }

    @Override
    public KhachHang chiTietTheoId(UUID id) {
        return null;
    }

    @Override
    public List<KhachHang> layDanhSachTheoTen(String ten) {
        return null;
    }

    @Override
    public List<KhachHang> layDanhSach() {
        return repo_khachHang.getAll();
    }


    public boolean isValidDangNhap(String taiKhoan, String matKhau) {
        // Thực hiện xác thực thông tin đăng nhập của khách hàng
        KhachHang khachHang = repo_khachHang.findByTaiKhoan(taiKhoan);
        return khachHang != null && khachHang.getMatKhau().equals(matKhau);
    }

    public KhachHang getCustomerByTaiKhoan(String taiKhoan) {
        // Lấy thông tin khách hàng từ cơ sở dữ liệu theo username
        return repo_khachHang.findByTaiKhoan(taiKhoan);
    }

//    public boolean isUsernameExists(String username) {
//        Customer customer = customerRepository.findByUsername(username);
//        return customer != null;
//    }

//    public KhachHang getCustomerByUsername(String ten) {
//        return khachHangRepository.findByTen(ten);
//    }

    private static final Logger logger = LoggerFactory.getLogger(KhachHangServiceImpl.class);

    // Other methods...

    public KhachHang getCustomerByUsername(String ten) {
        logger.info("Searching for customer with username: {}", ten);
        KhachHang khachHang = repo_khachHang.findByTen(ten);
        if (khachHang != null) {
            logger.info("Found customer: {}", khachHang);
        } else {
            logger.info("Customer with username {} not found", ten);
        }
        return khachHang;
    }

}


