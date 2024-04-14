package com.example.duantn.controller.banTaiQuay;

import com.example.duantn.dto.Constant;
import com.example.duantn.model.ChiTietSanPham;
import com.example.duantn.model.HoaDon;
import com.example.duantn.model.HoaDonChiTiet;
import com.example.duantn.model.PhieuGiamGia;
import com.example.duantn.request.MuaHangTaiQuay;
import com.example.duantn.request.PhanTrangRequest;
import com.example.duantn.service.impl.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.text.ParseException;
import java.util.*;

@RestController
@RequestMapping("/api/ban-hang")   // /api/ban-hang/getDanhSachSanPham
public class BanHangRestController {

    @Autowired
    ChiTietSPServiceImpl sanPhamCTService;


    @Autowired
    KhachHangServiceImpl khachHangService;

    @Autowired
    PhieuGiamGiaServiceImpl phieuGiamGiaService;

    @Autowired
    HoaDonServiceImpl hoaDonService;

    @Autowired
    HoaDonCTServiceImpl hoaDonCTService;

    /**
     *
     * @param model
     * @return
     */
    // api lấy ra danh sách các sản phẩm chi tiết
    @GetMapping("/getDanhSachSanPham")
    public ResponseEntity<?> getListProductDetail(
            Model model
    ){
        return ResponseEntity.of(Optional.ofNullable(sanPhamCTService.layDanhSach()));
    }

    // api lấy ra danh sách khách hàng
    @GetMapping("/getDanhSachKhachHang")
    public ResponseEntity<?> getListCustomer(
            Model model
    ){
        return ResponseEntity.of(Optional.ofNullable(khachHangService.layDanhSach()));
    }

    // api lấy ra danh sách phieu giảm giá
    @PostMapping("/getDanhSachPhieuGiamGia")
    public ResponseEntity<?> getListDiscount(
            Model model ,
            @RequestBody MuaHangTaiQuay muaHangTaiQuay
    ){

        // lay danh sach phieu giam gia
        List<PhieuGiamGia> dsPhieuGiamGia = phieuGiamGiaService.layDanhSach_voiTongTienDonHang(muaHangTaiQuay.getTongTienDonHang());

        Double tongTienDonHang = muaHangTaiQuay.getTongTienDonHang();
//        System.out.println("Tổng tiền đơn hàng - getDanhSachPhieuGiamGia: " + tongTienDonHang);

        int count = 0;
        List<PhieuGiamGia> dsPhieuGiamGiaHopLe = new ArrayList<>();
        if(tongTienDonHang!=null){
            for(PhieuGiamGia phieuGiamGia : dsPhieuGiamGia){
                if(tongTienDonHang >= phieuGiamGia.getGiaTienXetDieuKien()){
                    count++;
                    dsPhieuGiamGiaHopLe.add(phieuGiamGia);
                }
            }
        }
//        System.out.println("ds phiếu giảm giá hợp lệ - getDanhSachPhieuGiamGia : " + dsPhieuGiamGiaHopLe.size());
//        System.out.println("Count - getDanhSachPhieuGiamGia : " + count);

        return ResponseEntity.of(Optional.ofNullable(dsPhieuGiamGiaHopLe));
    }

    // api lấy ra danh sách hoa don cho
    @PostMapping("/getDanhSachHoaDonCho_theoIDHoaDonActive")
    public ResponseEntity<?> getDanhSachHoaDonChiTiet(
            Model model,
            @RequestBody PhanTrangRequest phanTrangRequest
            ){
         return ResponseEntity.of(Optional.ofNullable(hoaDonCTService.layDanhSachHoaDonChiTiet_theoIdHoaDon(phanTrangRequest.getIdHoaDon())));
    }

    // api lấy ra danh sách phieu giảm giá
    @GetMapping("/getDanhSachHoaDonTheoTrangThai_hoaDonCho")
    public ResponseEntity<?> getListBill_byStatus(
            Model model
    ){
        return ResponseEntity.of(Optional.ofNullable(hoaDonService.layDanhSachHoaDon_theoTrangThai(0)));
    }

    @PostMapping("/kiemTraSoLuongMuaBiVuotQuaKhong")
    public ResponseEntity<Map<String, Object>> kiemTraSoLuongMuaVuotQuaTrongKho(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
            , @RequestBody MuaHangTaiQuay muaHangTaiQuay
    ) throws IOException {
        UUID idSanPhamChiTiet = muaHangTaiQuay.getIdSanPhamCT();
        UUID idHoaDon = muaHangTaiQuay.getIdHoaDon();
        Integer soLuongMua = muaHangTaiQuay.getSoLuong_sanPhamMua();
//        System.out.println("Chạy vào hàm kiểm tra số lượng mua có bị vượt quá trong kho hay không ?");
//        System.out.println("ID sản phẩm chi tiết " + idSanPhamChiTiet);
//        System.out.println("ID hóa đơn " + idHoaDon);
//        System.out.println("Số lượng mua " + soLuongMua);

        Integer soLuongSanPhamKho = sanPhamCTService.laySoLuongTrongKho(idSanPhamChiTiet);
        Integer soLuongSanPhamDaChonTrongHoaDon = hoaDonCTService.getSoLuongSanPhamTrongHoaDonCT(idHoaDon, idSanPhamChiTiet);
//        System.out.println("Số lượng kho " + soLuongSanPhamKho);
//        System.out.println("Số lượng đã chọn vào hóa dơn chi tiết " + soLuongSanPhamDaChonTrongHoaDon);

        Boolean checkSoLuongHoaDon = true;
        if(soLuongSanPhamDaChonTrongHoaDon==null){  // = null có nghĩa là ko có sản phẩm nào trong hóa đơn chi tiết
            if(soLuongMua > soLuongSanPhamKho){
                checkSoLuongHoaDon = false;
            }
        }else {
            if((soLuongMua + soLuongSanPhamDaChonTrongHoaDon) > soLuongSanPhamKho){
                checkSoLuongHoaDon = false;
            }
        }

        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");
        jsonResult.put("ketQuaKiemTraSL_muaHopLe",checkSoLuongHoaDon);

        jsonResult.put("soLuongDaChonVaoHoaDon",soLuongSanPhamDaChonTrongHoaDon==null?0:soLuongSanPhamDaChonTrongHoaDon );
        jsonResult.put("soLuongCoTheThemVaoHoaDon",soLuongSanPhamDaChonTrongHoaDon!=null?(soLuongSanPhamKho-soLuongSanPhamDaChonTrongHoaDon):soLuongSanPhamKho);

        return ResponseEntity.ok(jsonResult);
    }

    @PostMapping("/themSanPhamVaoHoaDonChiTiet")
    public ResponseEntity<Map<String, Object>> themSanPhamVaoHoaDonChiTiet(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
            , @RequestBody MuaHangTaiQuay muaHangTaiQuay
    ) throws IOException, ParseException {
        UUID idSanPhamChiTiet = muaHangTaiQuay.getIdSanPhamCT();
        UUID idHoaDon = muaHangTaiQuay.getIdHoaDon();
        Integer soLuongMua = muaHangTaiQuay.getSoLuong_sanPhamMua();

        Integer soLuongSanPhamDaChonTrongHoaDon = hoaDonCTService.getSoLuongSanPhamTrongHoaDonCT(idHoaDon, idSanPhamChiTiet);

        // kiểm tra số lượng sản phẩm có != null hay ko
        // != null thì cập nhật số lượng sản phẩm

        boolean checkThemSanPhamVaoHDCT = false;
        if(soLuongSanPhamDaChonTrongHoaDon!=null){
//            System.out.println("Sản phẩm này đã được thêm vào hóa đơn chi tiết trước đó rồi " +
//                    "\n cập nhật số lượng sản phẩm");
            // viết 1 service xử lý việc cập nhật số lượng
             hoaDonCTService.capNhatSoLuongSanPhamMua_HDCT(idHoaDon, idSanPhamChiTiet, soLuongMua);
                checkThemSanPhamVaoHDCT = true;
//                System.out.println("Chạy xong  hàm cập nhật số lượng ");
        }else {
//            System.out.println("Chạy vào hàm thêm mới sản phẩm chi tiết  ");
            // ngược lại thêm sản phẩm vào hóa đơn chi tiết
            // viết 1 service thêm sản phẩm vào hóa đơn chi tiết
            // thêm sản phẩm vào hóa đơn chi tiết như thế nào ???
            HoaDonChiTiet hoaDonChiTietMoi = new HoaDonChiTiet();
            HoaDon hoaDonThem = new HoaDon();
            hoaDonThem.setId(idHoaDon);
            hoaDonChiTietMoi.setHoaDon(hoaDonThem);

            ChiTietSanPham sanPhamChiTietThem = sanPhamCTService.chiTietTheoId(idSanPhamChiTiet);
            hoaDonChiTietMoi.setChiTietSanPham(sanPhamChiTietThem);

            hoaDonChiTietMoi.setSoLuong(soLuongMua);
            Double thanhTien = sanPhamChiTietThem.getGiaTriGiam()>0?(soLuongMua * sanPhamChiTietThem.getGiaTriGiam()) : (soLuongMua * sanPhamChiTietThem.getGiaTriSanPham());
            hoaDonChiTietMoi.setDonGia(thanhTien);
            hoaDonChiTietMoi.setNgayTao(Constant.getDateNow());
            hoaDonChiTietMoi.setTrangThai(0);

            HoaDonChiTiet ketQuaThemHoaDonChiTiet =  hoaDonCTService.themMoi2(hoaDonChiTietMoi);
            if(ketQuaThemHoaDonChiTiet!=null){
                checkThemSanPhamVaoHDCT = true;
            }
        }

        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");
        jsonResult.put("ketQuaThemSPVaoHoaDonCT", checkThemSanPhamVaoHDCT);

//        jsonResult.put("ketQuaSauThemHoaDonCT",checkSoLuongHoaDon);

        return ResponseEntity.ok(jsonResult);
    }

    @PostMapping("/layDanhSachHoaDon_theoIDHoaDon")
    public ResponseEntity<Map<String, Object>> layDanhSachHoaDonChiTietTheoIDHoaDon(
            final Model model
            , final HttpServletRequest request
            , final HttpServletResponse response
            , @RequestBody MuaHangTaiQuay muaHangTaiQuay
    ) throws IOException {
        List<HoaDonChiTiet> dsHoaDonChiTiet = hoaDonCTService.layDanhSachHoaDonChiTiet_theoIdHoaDon(muaHangTaiQuay.getIdHoaDon());
//        System.out.println("Số lượng hóa đơn chi tiết lấy được " + dsHoaDonChiTiet.size());

        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "Success");
        jsonResult.put("dsHoaDonChiTiet",dsHoaDonChiTiet);

        return ResponseEntity.ok(jsonResult);
    }


}
