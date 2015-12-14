package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.TeacherFile;
public interface TeacherFileRepository extends PagingAndSortingRepository<TeacherFile, Long>,JpaSpecificationExecutor<TeacherFile>{
}

