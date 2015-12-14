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

import com.pzy.entity.TeacherFile;
import com.pzy.repository.TeacherFileRepository;

@Service
public class TeacherFileService {
	@Autowired
	private TeacherFileRepository teacherfileRepository;
	public List<TeacherFile> findAll() {
		return (List<TeacherFile>) teacherfileRepository.findAll(new Sort(Direction.DESC, "createDate"));
	}

	public Page<TeacherFile> findAll(final int pageNumber, final int pageSize,
			final String name) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));

		Specification<TeacherFile> spec = new Specification<TeacherFile>() {
			public Predicate toPredicate(Root<TeacherFile> root,
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
		Page<TeacherFile> result = (Page<TeacherFile>) teacherfileRepository.findAll(spec,
				pageRequest);
		return result;
	}

	public Page<TeacherFile> findAll(final int pageNumber, final int pageSize,
			final Date start, final Date end) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));
		Specification<TeacherFile> spec = new Specification<TeacherFile>() {
			public Predicate toPredicate(Root<TeacherFile> root,
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
		Page<TeacherFile> result = (Page<TeacherFile>) teacherfileRepository.findAll(spec,
				pageRequest);
		return result;
	}

	public void delete(Long id) {
		teacherfileRepository.delete(id);
	}

	public TeacherFile find(Long id) {
		return teacherfileRepository.findOne(id);
	}

	public void save(TeacherFile teacherfile) {
		teacherfileRepository.save(teacherfile);
	}
}