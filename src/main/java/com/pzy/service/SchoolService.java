package com.pzy.service;

import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.pzy.entity.School;
import com.pzy.repository.SchoolRepository;

@Service
public class SchoolService {
	@Autowired
	private SchoolRepository schoolRepository;
	public List<School> findAll() {
		return (List<School>) schoolRepository.findAll(new Sort(Direction.DESC, "createDate"));
	}

	public Page<School> findAll(final int pageNumber, final int pageSize,
			final String name) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));

		Specification<School> spec = new Specification<School>() {
			public Predicate toPredicate(Root<School> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (name != null) {
					predicate.getExpressions().add(
							cb.like(root.get("name").as(String.class), "%"
									+ name + "%"));
				}
				return predicate;
			}
		};
		Page<School> result = (Page<School>) schoolRepository.findAll(spec,
				pageRequest);
		return result;
	}

	public Page<School> findAll(final int pageNumber, final int pageSize,
			final Date start, final Date end) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));
		Specification<School> spec = new Specification<School>() {
			public Predicate toPredicate(Root<School> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (start != null) {
					predicate.getExpressions().add(
							cb.greaterThan(root.get("createDate")
									.as(Date.class), start));
				}
				if (end != null) {
					predicate.getExpressions().add(
							cb.lessThan(root.get("createDate").as(Date.class),
									end));
				}
				return predicate;
			}
		};
		Page<School> result = (Page<School>) schoolRepository.findAll(spec,
				pageRequest);
		return result;
	}

	public void delete(Long id) {
		schoolRepository.delete(id);
	}

	public School find(Long id) {
		return schoolRepository.findOne(id);
	}

	public void save(School school) {
		schoolRepository.save(school);
	}
}