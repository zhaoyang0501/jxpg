package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.School;
public interface SchoolRepository extends PagingAndSortingRepository<School, Long>,JpaSpecificationExecutor<School>{
}

