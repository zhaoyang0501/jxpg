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

import com.pzy.entity.Result;
import com.pzy.entity.ResultDetail;
import com.pzy.entity.Teacher;
import com.pzy.entity.User;
import com.pzy.repository.ResultRepository;

@Service
public class ResultService {
	@Autowired
	private ResultRepository resultRepository;
	public List<Result> findAll() {
		return (List<Result>) resultRepository.findAll(new Sort(Direction.DESC, "createDate"));
	}
	public List<Result> findAllByUser(User user) {
		return (List<Result>) resultRepository.findByUser(user);
	}
	public Page<Result> findAll(final int pageNumber, final int pageSize,
			final String name) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));

		Specification<Result> spec = new Specification<Result>() {
			public Predicate toPredicate(Root<Result> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (name != null) {
					predicate.getExpressions().add(
							cb.like(root.get("user").get("name").as(String.class), "%"
									+ name + "%"));
				}
				return predicate;
			}
		};
		Page<Result> result = (Page<Result>) resultRepository.findAll(spec,
				pageRequest);
		return result;
	}
	
	public Page<Result> findAll(final int pageNumber, final int pageSize,
			final String name,final Teacher teacher) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));

		Specification<Result> spec = new Specification<Result>() {
			public Predicate toPredicate(Root<Result> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (name != null) {
					predicate.getExpressions().add(
							cb.like(root.get("plan").get("lesson").get("name").as(String.class), "%"
									+ name + "%"));
				}
				if (teacher != null) {
					predicate.getExpressions().add(cb.equal(root.get("plan").get("teacher").as(Teacher.class),teacher));
				}
				return predicate;
			}
		};
		Page<Result> result = (Page<Result>) resultRepository.findAll(spec,
				pageRequest);
		return result;
	}

	public Page<Result> findAll(final int pageNumber, final int pageSize,
			final Date start, final Date end) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));
		Specification<Result> spec = new Specification<Result>() {
			public Predicate toPredicate(Root<Result> root,
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
		Page<Result> result = (Page<Result>) resultRepository.findAll(spec,
				pageRequest);
		return result;
	}

	public void delete(Long id) {
		resultRepository.delete(id);
	}

	public Result find(Long id) {
		return resultRepository.findOne(id);
	}

	public void save(Result result) {
		for(ResultDetail bean: result.getDetails()){
			bean.setResult(result);
		}
		resultRepository.save(result);
	}
}