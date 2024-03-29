package com.example.duantn.repository;

import com.example.duantn.model.LoaiSanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface LoaiSanPhamRepository extends JpaRepository<LoaiSanPham, UUID> {

}
