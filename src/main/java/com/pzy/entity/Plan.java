package com.pzy.entity;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.data.annotation.Persistent;
@Entity
@Table(name = "t_plan")
public class Plan {
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String year;
	@ManyToOne(fetch = FetchType.EAGER)
	private Major major;
	@ManyToOne(fetch = FetchType.EAGER)
	private Teacher teacher;
	@ManyToOne(fetch = FetchType.EAGER)
	private Lesson lesson;
	
	@Persistent
	private String state;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public Major getMajor() {
		return major;
	}
	public void setMajor(Major major) {
		this.major = major;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Lesson getLesson() {
		return lesson;
	}
	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}
	
	
}
