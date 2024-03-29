package com.example.duantn.controller;

import com.example.duantn.model.HoaDon;
import com.example.duantn.repository.HoaDonRepository;
import com.example.duantn.service.HoaDonService;
import com.example.duantn.service.PhieuGiamGiaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller
@RequestMapping("/hoa-don")
public class HoaDonController {
    @Autowired
    HoaDonRepository hoaDonRepository;
    @Autowired
    HoaDonService hoaDonService;
    @Autowired
    PhieuGiamGiaService phieuGiamGiaService;

    //hienthi
    @GetMapping("/hien-thi")
    public String getAll(Model model,
                         @RequestParam(value = "page",defaultValue = "0")int page){
        Integer size = 5;
        Pageable pageable = PageRequest.of(page,size);
        model.addAttribute("hoaDon",new HoaDon());
        model.addAttribute("listHD",hoaDonRepository.findAll(pageable).getContent());
        model.addAttribute("totalPage",hoaDonRepository.findAll(pageable).getTotalElements());
        model.addAttribute("listPG",phieuGiamGiaService.getAll());
        return "/admin/HoaDonForm/trangChu";
    }
    //detail
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable String id,Model model){
        HoaDon hoaDon = hoaDonService.detail(UUID.fromString(id));
        model.addAttribute("hoaDon",hoaDon);
        model.addAttribute("listPG",phieuGiamGiaService.getAll());
        return "/admin/HoaDonForm/update";
    }
    //delete
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable String id){
        hoaDonService.delete(UUID.fromString(id));
        return "redirect:/hoa-don/hien-thi";
    }
    //add
    @PostMapping("/add")
    public String add(@Validated @ModelAttribute("hoaDon")HoaDon hoaDon){
        hoaDonService.add(hoaDon);
        return "redirect:/hoa-don/hien-thi";
    }
    //update
    @PostMapping("/update/{id}")
    public String update(@PathVariable String id,@ModelAttribute("hoaDon")HoaDon hoaDon){
        hoaDonService.update(UUID.fromString(id),hoaDon);
        return "redirect:/hoa-don/hien-thi";
    }

}
