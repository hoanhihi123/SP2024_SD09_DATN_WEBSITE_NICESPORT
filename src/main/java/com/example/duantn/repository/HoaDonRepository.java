package com.example.duantn.repository;

import com.example.duantn.model.ChucVu;
import com.example.duantn.model.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, UUID> {
    @Query(value = "select * from HoaDon ",nativeQuery = true)
    List<HoaDon>getAll();


    @Query(value = "select * from HoaDon where Ma =:maInput ",
            countQuery = "select * from HoaDon where Ma =:maInput", nativeQuery = true)
    public HoaDon getHoaDonBy_ma(@Param("maInput") String maHoaDon);

}
