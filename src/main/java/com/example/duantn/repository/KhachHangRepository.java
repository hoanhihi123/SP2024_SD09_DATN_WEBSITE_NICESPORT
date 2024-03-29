package com.example.duantn.repository;

import com.example.duantn.model.ChiTietSanPham;
import com.example.duantn.model.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang, UUID> {
    @Query(value = "select * from KhachHang order by ngaySua desc", nativeQuery = true)
    public List<KhachHang> getAll();

    @Query(value = "select  * from KhachHang ",
            countQuery = "select  count(*) from KhachHang", nativeQuery = true)
    public Page<KhachHang> getAll(Pageable pageable);


    @Query(value = "select  * from KhachHang",
            countQuery = "select  count(*) from KhachHang where Concat(sdt) like %:textSearch%",
            nativeQuery = true)
    public Page<KhachHang> getAll(@Param("textSearch") String textSearch, Pageable pageable);
//
//    @Query(value = "select * from KhachHang where concat(ten, ma, taiKhoan, matKhau) like %:textSearch%  order by ten desc",
//            countQuery = "select count(*) from KhachHang where concat(ten, ma, taiKhoan, matKhau) like %:textSearch% ",
//            nativeQuery = true)
//    public Page<KhachHang> getAll(@Param("textSearch") String textSearch, Pageable pageable);
//    @Query(value = "select * from KhachHang where Ma =:textSearch  order by ten desc",
//            countQuery = "select count(*) from KhachHang where Ma =:textSearch ", nativeQuery = true)
//    public List<KhachHang> getAllTheoMa(@Param("textSearch") String textSearch);
//
//    @Query(value = "select HoTen from KhachHang where HoTen =:textSearch  order by ten desc",
//            countQuery = "select count(HoTen) from KhachHang where HoTen =:textSearch ", nativeQuery = true)
//    public List<KhachHang> getAllTheoTen(@Param("textSearch") String textSearch);
//
//    @Query(value = "select TaiKhoan from KhachHang where TaiKhoan =:textSearch  order by taiKhoan desc",
//            countQuery = "select count(TaiKhoan) from KhachHang where TaiKhoan =:textSearch ", nativeQuery = true)
//    public List<KhachHang> getAllTheoTaiKhoan(@Param("textSearch") String textSearch);
//
//    @Query(value = "select MatKhau from KhachHang where MatKhau =:textSearch  order by matKhau desc",
//            countQuery = "select count(MatKhau) from KhachHang where MatKhau =:textSearch ", nativeQuery = true)
//    public List<KhachHang> getAllTheoMatKhau(@Param("textSearch") String textSearch);

    KhachHang findByTaiKhoan(String TaiKhoan);
    KhachHang findByTen(String ten);

//    boolean existsByTaiKhoan(String TaiKhoan);
//    KhachHang findByTaiKhoan(String username);



}
