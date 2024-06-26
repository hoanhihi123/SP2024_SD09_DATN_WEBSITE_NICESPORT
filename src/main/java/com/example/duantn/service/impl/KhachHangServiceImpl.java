package com.example.duantn.service.impl;

import com.example.duantn.model.KhachHang;
import com.example.duantn.repository.KhachHangRepository;
import com.example.duantn.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class KhachHangServiceImpl implements BaseService<KhachHang> {
    @Autowired
    KhachHangRepository repo_khachHang;

    public boolean isValidDangNhap(String taiKhoan, String matKhau) {
        // Thực hiện xác thực thông tin đăng nhập của khách hàng
        KhachHang khachHang = repo_khachHang.findByTaiKhoan(taiKhoan);
        return khachHang != null && khachHang.getMatKhau().equals(matKhau);
    }

    public KhachHang getCustomerByTaiKhoan(String taiKhoan) {
        // Lấy thông tin khách hàng từ cơ sở dữ liệu theo username
        return repo_khachHang.findByTaiKhoan(taiKhoan);
    }

    @Override
    public List<KhachHang> layDanhSach() {
        return repo_khachHang.getAll();
    }

    @Override
    public Page<KhachHang> layDanhSach(Pageable pageable) {
        return repo_khachHang.getAll(pageable);
    }

    @Override
    public Page<KhachHang> layDanhSach(String textSearch, Pageable pageable) {
        if (textSearch != null) {
//            System.out.println("Chạy vào đây");
            return repo_khachHang.getAll(textSearch, pageable);
        }

        return repo_khachHang.getAll(pageable);
    }

    @Override
    public void xoa(UUID id) {
        KhachHang khachHang = repo_khachHang.findById(id).get();
        repo_khachHang.delete(khachHang);
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
        Optional<KhachHang> khachHang = repo_khachHang.findById(id);
        KhachHang khachHang1 = khachHang.get();
        return khachHang1;
    }

    @Override
    public List<KhachHang> layDanhSachTheoTen(String ten) {
        return repo_khachHang.getAllTheoTen(ten);

    }

    public boolean kiemTraTrungMaKhong(String maMoi, String maCu) {
        List<KhachHang> dsKhachHang=this.layDanhSach();
        Boolean isCheck = false;
        Boolean isCheck2 = true;
        // kiem tra xem ma moi co trung voi cac ma khac khong
        for (KhachHang khachHang : dsKhachHang) {
            if (khachHang.getMa().equalsIgnoreCase(maMoi.trim())) {
                isCheck = true;
                break;
            }
        }

        // kiem tra xem ma moi co bang ma cu khong
        if (maMoi.trim().equalsIgnoreCase(maCu)) {
            isCheck2 = false;
        }

        return isCheck && isCheck2;
    }

    public boolean kiemTraTrungTenKhong(String tenMoi, String tenCu) {
        List<KhachHang> dsKhachHang = this.layDanhSach();
        Boolean isCheck = false;
        Boolean isCheck2 = true;
        // kiem tra xem ten moi co trung voi cac ten khac khong
        for (KhachHang khachHang : dsKhachHang) {
            if (khachHang.getHoTen().equalsIgnoreCase(tenMoi.trim())) {
                isCheck = true;
            }
        }

        // kiem tra xem ten moi co bang ten cu khong
        if (tenMoi.trim().equalsIgnoreCase(tenCu)) {
            isCheck2 = false;
        }

        return isCheck && isCheck2;
    }
    public Boolean kiemTraTrungTenKhong(String tenCheck) {
        List<KhachHang> dsKhachHang = this.layDanhSach();
        Boolean isCheck = false;

        // kiem tra xem ten moi co trung voi cac ten khac khong
        for (KhachHang khachHang : dsKhachHang) {
            if (khachHang.getHoTen().equalsIgnoreCase(tenCheck.trim())) {
                isCheck = true;
                break;
            }
        }
        return isCheck;
    }
}
