package com.example.duantn.repository;

import com.example.duantn.model.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, UUID> {
    @Query(value = "select * from SanPham order by ngayTao desc", nativeQuery = true)
    public List<SanPham> getAll();

    @Query(value = "select * from SanPham WHERE trangThai=1",
            countQuery = "select count(*) from SanPham WHERE trangThai=1", nativeQuery = true)
    public Page<SanPham> getAllWithStatus_1(Pageable pageable);

    // getAll
    @Query(value = "select * from SanPham order by ngaySua desc",
            countQuery = "select count(*) from SanPham", nativeQuery = true)
    public Page<SanPham> getAll(Pageable pageable);

    @Query(value = "select * from SanPham where concat(Ten, MoTa) like %:textSearch%  order by ngaySua desc",
            countQuery = "select count(*) from SanPham where concat(Ten, MoTa) like %:textSearch% ",
            nativeQuery = true)
    public Page<SanPham> getAll(@Param("textSearch") String textSearch, Pageable pageable);

    @Query(value = "select Ten from SanPham where Ten =:textSearch  order by ngaySua desc",
            countQuery = "select count(Ten) from SanPham where Ten =:textSearch ", nativeQuery = true)
    public List<SanPham> getAllTheoTen(@Param("textSearch") String textSearch);

    @Query(value = "select * from SanPham where Ma =:textSearch  order by ten desc",
            countQuery = "select count(*) from SanPham where Ma =:textSearch ", nativeQuery = true)
    public List<SanPham> getAllTheoMa(@Param("textSearch") String textSearch);

    Page<SanPham> findByTenContainingIgnoreCase(String textSearch, Pageable pageable);

    @Query(nativeQuery = true, value = "SELECT sp.* FROM SanPham sp JOIN DotKhuyenMai km ON sp.id = km.idSanPham WHERE km.id = :idDotKhuyenMai")
    List<SanPham> findByDotKhuyenMaiId(@Param("idDotKhuyenMai") UUID idDotKhuyenMai);



    Page<SanPham> findByTrangThai(int trangThai, Pageable pageable);

    List<SanPham> findByTen(String ten);


}
