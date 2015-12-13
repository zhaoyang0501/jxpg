package com.pzy.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name = "t_resultdetail")
public class ResultDetail {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@ManyToOne(cascade = { CascadeType.REFRESH, CascadeType.MERGE }, optional = true) @JoinColumn(name = "result_id")
	private Result result;
	@ManyToOne(fetch = FetchType.EAGER)
	private Testitem testitem;
	
	private Integer score;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Result getResult() {
		return result;
	}

	public void setResult(Result result) {
		this.result = result;
	}

	public Testitem getTestitem() {
		return testitem;
	}

	public void setTestitem(Testitem testitem) {
		this.testitem = testitem;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}
}
