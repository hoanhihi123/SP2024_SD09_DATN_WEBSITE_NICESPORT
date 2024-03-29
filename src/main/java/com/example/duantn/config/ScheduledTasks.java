package com.example.duantn.config;

import com.example.duantn.service.impl.GiamGiaServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ScheduledTasks {
    @Autowired
    private GiamGiaServiceImpl giamGiaService;

    // Chạy mỗi ngày vào lúc 12:00 AM
    @Scheduled(cron = "0 0 0 * * *")
    public void updateGiamGiaStatus() {
        giamGiaService.updateExpiredGiamGiaStatus();
    }
}