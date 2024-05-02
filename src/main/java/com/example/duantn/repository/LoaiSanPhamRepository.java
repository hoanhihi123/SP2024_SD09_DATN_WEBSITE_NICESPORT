package com.example.duantn.repository;

import com.example.duantn.model.LoaiSanPham;
import com.example.duantn.model.NSX;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface LoaiSanPhamRepository extends JpaRepository<LoaiSanPham, UUID> {
    @Query(value = "select * from LoaiSanPham  order by ngayTao desc", nativeQuery = true)
    public List<LoaiSanPham> getAll();
}
