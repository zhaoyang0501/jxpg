package com.pzy.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name = "t_teacherFile")
public class TeacherFile {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String filename;
	private Date createDate;
	@ManyToOne(fetch = FetchType.EAGER)
	private Teacher teacher;
	private String year;
	private Integer total;
	private Integer num1;
	private Integer num2;
	private Integer num3;
	private Integer num4;
	private Integer num5;
	private Integer num6;
	private Integer num7;
	private Integer num8;
	private Integer num9;
	private Integer num10;
	private Integer num11;
	private Integer num12;
	private Integer num13;
	private Integer num14;
	private Integer num15;
	private Integer num16;
	private Integer num17;
	private Integer num18;
	private Integer num19;
	private Integer num20;
	
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getNum1() {
		return num1;
	}
	public void setNum1(Integer num1) {
		this.num1 = num1;
	}
	public Integer getNum2() {
		return num2;
	}
	public void setNum2(Integer num2) {
		this.num2 = num2;
	}
	public Integer getNum3() {
		return num3;
	}
	public void setNum3(Integer num3) {
		this.num3 = num3;
	}
	public Integer getNum4() {
		return num4;
	}
	public void setNum4(Integer num4) {
		this.num4 = num4;
	}
	public Integer getNum5() {
		return num5;
	}
	public void setNum5(Integer num5) {
		this.num5 = num5;
	}
	public Integer getNum6() {
		return num6;
	}
	public void setNum6(Integer num6) {
		this.num6 = num6;
	}
	public Integer getNum7() {
		return num7;
	}
	public void setNum7(Integer num7) {
		this.num7 = num7;
	}
	public Integer getNum8() {
		return num8;
	}
	public void setNum8(Integer num8) {
		this.num8 = num8;
	}
	public Integer getNum9() {
		return num9;
	}
	public void setNum9(Integer num9) {
		this.num9 = num9;
	}
	public Integer getNum10() {
		return num10;
	}
	public void setNum10(Integer num10) {
		this.num10 = num10;
	}
	public Integer getNum11() {
		return num11;
	}
	public void setNum11(Integer num11) {
		this.num11 = num11;
	}
	public Integer getNum12() {
		return num12;
	}
	public void setNum12(Integer num12) {
		this.num12 = num12;
	}
	public Integer getNum13() {
		return num13;
	}
	public void setNum13(Integer num13) {
		this.num13 = num13;
	}
	public Integer getNum14() {
		return num14;
	}
	public void setNum14(Integer num14) {
		this.num14 = num14;
	}
	public Integer getNum15() {
		return num15;
	}
	public void setNum15(Integer num15) {
		this.num15 = num15;
	}
	public Integer getNum16() {
		return num16;
	}
	public void setNum16(Integer num16) {
		this.num16 = num16;
	}
	public Integer getNum17() {
		return num17;
	}
	public void setNum17(Integer num17) {
		this.num17 = num17;
	}
	public Integer getNum18() {
		return num18;
	}
	public void setNum18(Integer num18) {
		this.num18 = num18;
	}
	public Integer getNum19() {
		return num19;
	}
	public void setNum19(Integer num19) {
		this.num19 = num19;
	}
	public Integer getNum20() {
		return num20;
	}
	public void setNum20(Integer num20) {
		this.num20 = num20;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
}
