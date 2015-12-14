package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Plan;
import com.pzy.entity.Result;
import com.pzy.entity.User;
public interface ResultRepository extends PagingAndSortingRepository<Result, Long>,JpaSpecificationExecutor<Result>{
	public List<Result> findByPlanAndUser(Plan plan ,User user);
	public List<Result> findByUser(User user);
}

