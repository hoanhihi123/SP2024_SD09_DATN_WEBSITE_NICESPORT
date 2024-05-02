package com.example.duantn.repository;

import com.example.duantn.model.NSX;
import com.example.duantn.model.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface NSXRepository extends JpaRepository<NSX, UUID> {
    @Query(value = "select * from NhaSanXuat  order by ngayTao desc", nativeQuery = true)
    public List<NSX> getAll();

}
