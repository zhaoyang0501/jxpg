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

import com.pzy.entity.Testitem;
import com.pzy.repository.TestitemRepository;

@Service
public class TestitemService {
	@Autowired
	private TestitemRepository testitemRepository;
	public List<Testitem> findAll() {
		return (List<Testitem>) testitemRepository.findAll(new Sort(Direction.DESC, "createDate"));
	}

	public Page<Testitem> findAll(final int pageNumber, final int pageSize,
			final String name) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));

		Specification<Testitem> spec = new Specification<Testitem>() {
			public Predicate toPredicate(Root<Testitem> root,
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
		Page<Testitem> result = (Page<Testitem>) testitemRepository.findAll(spec,
				pageRequest);
		return result;
	}

	public Page<Testitem> findAll(final int pageNumber, final int pageSize,
			final Date start, final Date end) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));
		Specification<Testitem> spec = new Specification<Testitem>() {
			public Predicate toPredicate(Root<Testitem> root,
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
		Page<Testitem> result = (Page<Testitem>) testitemRepository.findAll(spec,
				pageRequest);
		return result;
	}

	public void delete(Long id) {
		testitemRepository.delete(id);
	}

	public Testitem find(Long id) {
		return testitemRepository.findOne(id);
	}

	public void save(Testitem testitem) {
		testitemRepository.save(testitem);
	}
}