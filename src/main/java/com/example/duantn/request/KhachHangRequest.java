package com.example.duantn.request;

import com.example.duantn.model.BaseModel;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KhachHangRequest extends BaseModel {
    @NotBlank(message = "{giohang.taikhoan.notblank}")
    private String taiKhoan;
    @NotBlank(message = "{giohang.matkhau.notblank}")
    private String matKhau;
}
