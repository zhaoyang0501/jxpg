package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Testitem;
public interface TestitemRepository extends PagingAndSortingRepository<Testitem, Long>,JpaSpecificationExecutor<Testitem>{
}

