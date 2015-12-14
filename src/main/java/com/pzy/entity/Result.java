package com.pzy.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.data.annotation.Persistent;
@Entity
@Table(name = "t_result")
public class Result {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@ManyToOne(fetch = FetchType.EAGER)
	private Plan plan;
	@ManyToOne(fetch = FetchType.EAGER)
	private User user;
	private Date createDate;
	 @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "result")
	private List<ResultDetail> details;
	@Persistent
	private Integer totalScore; 
	public Integer getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(Integer totalScore) {
		this.totalScore = totalScore;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Plan getPlan() {
		return plan;
	}
	public void setPlan(Plan plan) {
		this.plan = plan;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public List<ResultDetail> getDetails() {
		return details;
	}
	public void setDetails(List<ResultDetail> details) {
		this.details = details;
	}
}
