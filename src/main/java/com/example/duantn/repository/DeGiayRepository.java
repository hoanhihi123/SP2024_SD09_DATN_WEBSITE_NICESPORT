package com.example.duantn.repository;

import com.example.duantn.model.DeGiay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface DeGiayRepository extends JpaRepository<DeGiay, UUID> {
    @Query(value = "select * from DeGiay", nativeQuery = true)
    public List<DeGiay> getAll();

}
