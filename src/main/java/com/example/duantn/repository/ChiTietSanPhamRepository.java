package com.example.duantn.repository;

import com.example.duantn.model.*;
import com.example.duantn.request.ChiTietSanPham_theoSanPham_soLuong;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
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
public interface ChiTietSanPhamRepository extends JpaRepository<ChiTietSanPham, UUID> {


    @Query(value = "select * from SanPhamCT", nativeQuery = true)
    public List<ChiTietSanPham> getAll();

    @Query(value = "select  * from SanPhamCT ",
            countQuery = "select  count(*) from SanPhamCT", nativeQuery = true)
    public List<ChiTietSanPham> getAllList( Pageable pageable);

    @Query(value = "select  * from SanPhamCT ",
            countQuery = "select  count(*) from SanPhamCT", nativeQuery = true)
    public Page<ChiTietSanPham> getAll( Pageable pageable);

    @Query(value = "select  * from SanPhamCT where IdSanPham=:idSanPham and trangThai=1 ",
            countQuery = "select  count(*) from SanPhamCT where IdSanPham=:idSanPham", nativeQuery = true)
    public Page<ChiTietSanPham> getAll(@Param("idSanPham") UUID idSanPham, Pageable pageable);

    @Query(value = "select  * from SanPhamCT where IdSanPham=:idSanPham  ", nativeQuery = true)
    public List<ChiTietSanPham> getAll(@Param("idSanPham") UUID idSanPham);

    @Query(value = "select  * from SanPhamCT where IdSanPham=:idSanPham and TrangThai=:trangThai ", nativeQuery = true)
    public List<ChiTietSanPham> getAllTheoTrangThai(@Param("idSanPham") UUID idSanPham, @Param("trangThai") Integer trangThai);


    @Query(value = "select  * from SanPhamCT \n" +
            "inner join SanPham on SanPhamCT.IdSanPham = SanPham.Id\n" +
            "inner join DanhMuc on SanPhamCT.IdDanhMuc = DanhMuc.Id\n" +
            "inner join ThuongHieu on SanPhamCT.IdThuongHieu = ThuongHieu.Id\n" +
            "where Concat(SanPham.ten, DanhMuc.Ten, ThuongHieu.Ten) like %:textSearch%\n",
            countQuery = "select  count(*) from SanPhamCT \n" +
                    "inner join SanPham on SanPhamCT.IdSanPham = SanPham.Id\n" +
                    "inner join DanhMuc on SanPhamCT.IdDanhMuc = DanhMuc.Id\n" +
                    "inner join ThuongHieu on SanPhamCT.IdThuongHieu = ThuongHieu.Id\n" +
                    "where Concat(SanPham.ten, DanhMuc.Ten, ThuongHieu.Ten) like %:textSearch%\n",
            nativeQuery = true)
    public Page<ChiTietSanPham> getAll(@Param("textSearch") String textSearch, Pageable pageable);



    // @Modifying : cho spring biet day la truy van cap nhat/delete , bắt buộc có @Transctional
    @Transactional
    @Modifying
    @Query(value = "UPDATE SanPhamCT " +
            "SET SoLuong = SoLuong - :soLuongMua " +
            "WHERE ID = :idSanPhamCT", nativeQuery = true)
    public void updateSoLuong(@Param("soLuongMua") Integer soLuongMua, @Param("idSanPhamCT") UUID idSanPhamCT);

//    @Query(value = "select * from SanPhamCT \n" +
//            "join SanPham on SanPhamCT.IdSanPham = SanPham.Id\n" +
//            "where SanPham.TrangThai=1 and SoLuong>0 order by (GiaTriSanPham-GiaTriGiam)/GiaTriSanPham*100 desc",
//            countQuery = "select count(*) from SanPhamCT \n" +
//                    "join SanPham on SanPhamCT.IdSanPham = SanPham.Id\n" +
//                    "where SanPham.TrangThai=1 and SoLuong>0 ", nativeQuery = true)
//    public List<ChiTietSanPham> getAllProductLonHon_0( Pageable pageable);

    @Query(value = "SELECT SanPhamCT.*, SanPham.Id AS SanPhamId FROM SanPhamCT \n" +
            "JOIN SanPham ON SanPhamCT.IdSanPham = SanPham.Id\n" +
            "WHERE SanPham.TrangThai = 1 AND SoLuong > 0 ORDER BY (GiaTriSanPham - GiaTriGiam) / GiaTriSanPham * 100 DESC",
            countQuery = "SELECT COUNT(*) FROM SanPhamCT \n" +
                    "JOIN SanPham ON SanPhamCT.IdSanPham = SanPham.Id\n" +
                    "WHERE SanPham.TrangThai = 1 AND SoLuong > 0", nativeQuery = true)
    public List<ChiTietSanPham> getAllProductLonHon_0(Pageable pageable);


    //select DISTINCT  ID_loaiSP from SanPhamCT
    //join LoaiSanPham on LoaiSanPham.Id = SanPhamCT.ID_loaiSP

    @Query(value = "select DISTINCT ID_loaiSP as id from SanPhamCT \n" +
                    "join LoaiSanPham on LoaiSanPham.Id = SanPhamCT.ID_loaiSP\n" +
                    "where SanPhamCT.TrangThai=1",
            countQuery = "select DISTINCT count(*) as id from SanPhamCT \n" +
                            "join LoaiSanPham on LoaiSanPham.Id = SanPhamCT.ID_loaiSP\n" +
                            "where SanPhamCT.TrangThai=1"
            , nativeQuery = true)
    public List<UUID> getAllLoaiSanPham_coTrongChiTietSP();

    // lay danh sách id_mauSacTrongSanPhamChiTiet theo idSanPham
    @Query(value = "select distinct IdMauSac from SanPhamCT where IdSanPham =:idSanPham"
            , nativeQuery = true)
    public List<UUID> getListIDMauSacFromSanPhamChiTiet_byIdSanPham(@Param("idSanPham") UUID idSanPham);

    // select distinct IdSanPham from SanPhamCT
    // lấy danh sách IdSanPham trong SanPhamCT không lặp giá trị
    @Query(value = "select distinct IdSanPham from SanPhamCT \n" +
                    "join SanPham on SanPhamCT.IdSanPham = SanPham.Id\n" +
                    "where SanPham.TrangThai=1", nativeQuery = true)
    public List<UUID> getListUUID_SanPham_fromChiTietSP();

    // lay danh sách san pham chi tiet theo idSanPham
    @Query(value = "select * from SanPhamCT where IdSanPham =:idSanPham"
            , nativeQuery = true)
    public List<ChiTietSanPham> getListSanPhamChiTietTheo_idSanPham(@Param("idSanPham") UUID idSanPham);


//    select KichThuoc.Ten, SanPhamCT.Id from SanPhamCT
//    join KichThuoc on SanPhamCT.IdKichThuoc = KichThuoc.Id
//    where SanPhamCT.Id ='046D3833-154F-46BE-93FB-15316D524569'  and IdMauSac =:idMauSac
//    order by KichThuoc.Ten

    // lay danh sách sản phẩm theo IdMauSac va IdSanPham
    @Query(value = "select spct.* from SanPhamCT spct\n" +
            "join KichThuoc kt on spct.IdKichThuoc = kt.Id\n" +
            "where spct.IdSanPham =:idSanPham and spct.IdMauSac =:idMauSac\n" +
            "order by kt.Ten\n"
            , nativeQuery = true)
    public List<ChiTietSanPham> getListSanPhamCT_theoIdMauSac_IdSanPham(@Param("idSanPham") UUID idSanPham,
                                                                        @Param("idMauSac") UUID idMauSac);

    // lay ra so luong trong kho cua san pham chi tiet theo idSanPhamChiTiet
    @Query(value = "select SoLuong from SanPhamCT where Id =:idSanPhamCT "
            , nativeQuery = true)
    public Integer getSoLuong_byIdSanPhamChiTiet(@Param("idSanPhamCT") UUID idSanPham);


    // hoan code
        @Query(value = "select * from SanPhamCT\n" +
                "join SanPham on SanPhamCT.IdSanPham = SanPham.Id\n" +
                "join MauSac on SanPhamCT.IdMauSac = MauSac.Id\n" +
                "join KichThuoc on SanPhamCT.IdKichThuoc = KichThuoc.Id\n" +
                "join LoaiSanPham on SanPhamCT.ID_loaiSP = LoaiSanPham.Id\n" +
                "where SanPham.Ten like CONCAT('%', :tenSanPham, '%') \n" +
                "and MauSac.Ten like CONCAT('%', :tenMauSac, '%')\n" +
                "and KichThuoc.Ten like CONCAT('%', :tenKichCo, '%')\n" +
                "and LoaiSanPham.Ten like CONCAT('%', :tenLoaiSanPham, '%')",
                nativeQuery = true)
        public Page<ChiTietSanPham> resultSearchNhieuDieuKienTaiQuay(
                @Param("tenSanPham") String tenSanPham,
                @Param("tenMauSac") String tenMauSac,
                @Param("tenKichCo") String tenKichCo,
                @Param("tenLoaiSanPham") String tenLoaiSanPham,
                Pageable pageable
        );

        @Transactional
        @Modifying
        @Query(value = "delete from SanPhamCT where TrangThai =:trangThai ", nativeQuery = true)
        public void xoaSanPhamChiTietTheoTrangThai(@Param("trangThai") Integer trangThaiXoa);

        @Transactional
        @Modifying
        @Query(value = "UPDATE SanPhamCT " +
                "SET trangThai=0 " +
                "WHERE ID = :idSanPhamCT", nativeQuery = true)
        public void updateTrangThaiSanPhamCT( @Param("idSanPhamCT") UUID idSanPhamCT);


    // hoan code

}
