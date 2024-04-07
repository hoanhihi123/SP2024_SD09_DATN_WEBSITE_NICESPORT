package com.example.duantn.repository;

import com.example.duantn.model.HoaDon;
import com.example.duantn.model.HoaDonChiTiet;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonCTRepository extends JpaRepository<HoaDonChiTiet, UUID> {
    @Query(value = "select * from HoaDonCT ",nativeQuery = true)
    List<HoaDonChiTiet> getAll();

    // hoan code
//    @Query(value = "select * from HoaDon where Ma =:maInput ",
//            countQuery = "select * from HoaDon where Ma =:maInput", nativeQuery = true)
//    HoaDon getHoaDonBy_ma(@Param("maInput") String maHoaDon);
    @Query(value = "select sum(soLuong) from HoaDonCT where IdHoaDon =:idHoaDon " +
                    "and IdSanPhamCT =:idSanPhamCT"
                     , nativeQuery = true)
    Integer getSoLuongSanPham_trongHoaDonCT(@Param("idHoaDon") UUID idHoaDon, @Param("idSanPhamCT") UUID idSanPhamCT );

    // cap nhat so luong san pham trong hoa don chi tiet
    @Transactional
    @Modifying
    @Query(value = "update HoaDonCT set SoLuong = SoLuong + :soLuongMuaThem where IdHoaDon =:idHoaDon and IdSanPhamCT =:idSanPhamCT"
            , nativeQuery = true)
    void capNhatSoLuongSanPhamTrong_HoaDonChiTiet(
            @Param("idHoaDon") UUID idHoaDon ,
            @Param("idSanPhamCT") UUID idSanPhamCT,
            @Param("soLuongMuaThem") Integer soLuongMuaThem);

    // hoan code

}

