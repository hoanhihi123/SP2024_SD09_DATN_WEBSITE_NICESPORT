package com.example.duantn.controller;

import com.example.duantn.model.LotGiay;
import com.example.duantn.repository.LotGiayRepository;
import com.example.duantn.service.impl.LotGiayServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller
@RequestMapping("/lot-giay")
public class LotGiayController {
    @Autowired
    LotGiayRepository lotGiayRepository;

    @Autowired
    LotGiayServiceImpl lotGiayService;

    //hienthi
    @GetMapping("/hien-thi")
    public String getAll(Model model,
                         @RequestParam(value = "page",defaultValue = "0")int page){
        Integer size = 5;
        Pageable pageable = PageRequest.of(page,size);
        model.addAttribute("lotGiay",new LotGiay());
        model.addAttribute("listLG",lotGiayRepository.findAll(pageable).getContent());
        model.addAttribute("totalPage",lotGiayRepository.findAll(pageable).getTotalElements());
        return "/admin/LotGiayForm/trangChu";
    }
    //detail
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable String id,Model model){
        LotGiay lotGiay = lotGiayService.chiTietTheoId(UUID.fromString(id));
        model.addAttribute("lotGiay",lotGiay);
        return "/admin/LotGiayForm/update";
    }
    //delete
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable String id){
        lotGiayService.xoa(UUID.fromString(id));
        return "redirect:/lot-giay/hien-thi";
    }

    //add
    @PostMapping("/add")
    public String add(@Validated @ModelAttribute("lotGiay")LotGiay lotGiay){
        lotGiayService.themMoi(lotGiay);
        return "redirect:/lot-giay/hien-thi";
    }
    //update
    @PostMapping("/update/{id}")
    public String update(@PathVariable String id,@ModelAttribute("lotGiay")LotGiay lotGiay){
        lotGiayService.capNhat(UUID.fromString(id),lotGiay);
        return "redirect:/lot-giay/hien-thi";
    }
}
