<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css" rel="stylesheet">
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.teacherfile.js?1=112"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/falgun/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.zh-CN.js"></script>


<script type="text/javascript">
	$(document).ready(function(){
		$(".date").datetimepicker({
			language:  'zh-CN',
	        weekStart: 1,
	        todayBtn:  1,
	        format:'yyyy-mm-dd',
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	    });
		
		$(".datetime").datetimepicker({
			language:  'zh-CN',
	        weekStart: 1,
	        todayBtn:  1,
	        format:'yyyy-mm-dd hh:ii',
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 0,
			forceParse: 0
	    });
	});
</script>
</head>
<body>
	<div class="layout">
		<!-- top -->
		<%@ include file="../top.jsp"%>
		<!-- 导航 -->
		<%@ include file="../menu.jsp"%>
		
		<input type="hidden" id="hf_id" />

		<div class="main-wrapper">
			<div class="container-fluid">
				<div class="row-fluid ">
					<div class="span12">
						<div class="content-widgets light-gray">
							<div class="widget-head  bondi-blue" >
								<h3>教师外审</h3>
							</div>
							<div class="box well form-inline">
								<span>教师姓名：</span>
								<input type="text" id="_name" >
								<a onclick="$.adminTeacherfile.initSearchDataTable()"
									class="btn btn-info" data-loading-text="正在加载..."><i class="icon-search"></i>查询</a>
							</div>
							<div class="widget-container">
								<table class="responsive table table-striped table-bordered"
									id="dt_table_view">
									<thead>
										<tr>
											<th >流水号</th>
											<th >教师工号</th>
											<th >教师姓名</th>
											<th >职称</th>
											<th >总分</th>
											<th >文件下载</th>
											<th >操作</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../foot.jsp"%>
	</div>
<form action="" id='_form'>
<input type="hidden" value="" id='id' name='id'/>
	<!-- 编辑新增弹出框 -->
	<div class="modal hide fade" id="_modal">
		<div class="modal-header blue">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<label id="_modal_header_label"></label>
		</div>
		<div class="modal-body" style="min-height: 600px;">
			<div class="row-fluid">
				<div class="span12">
					<div class="form-container grid-form form-background left-align form-horizontal">
						
						<table class="responsive table table-striped table-bordered"
									id="dt_table_view">
									<thead>
										<tr>
										<th >序号</th>
											<th >评估内容</th>
											<th >要求</th>
											<th >分值</th>
										</tr>
									</thead>
									<tbody id='table_detail'>
									<tr>
										<td>1</td>
										<td>教学管理规章制度汇编</td>
										<td>学校及本单位文件</td>
										<td><input name='num1' type="text" size="4" style="width: 50px"/></td>
									</tr>
									<tr>
										<td>2</td>
										<td>培养计划</td>
										<td>包括2012级、2013级、2014级</td>
										<td><input name='num2' type="text" size="4" style="width: 50px"/></td>
									</tr>
									<tr>
										<td>3</td>
										<td>各门课程教学大纲</td>
										<td>各项内容要规范、统一</td>
										<td><input name='num3' type="text" size="4" style="width: 50px"/></td>
									</tr>
									<tr>
										<td>4</td>
										<td>2012级本科四学年的课程表</td>
										<td>信息详细</td>
										<td><input name='num4' type="text" size="4" style="width: 50px"/></td>
									</tr>
									<tr>
										<td>5</td>
										<td>2012级专接本两学年的课程表</td>
										<td>信息详细</td>
										<td><input name='num5' type="text" size="4" style="width: 50px"/></td>
									</tr>
									<tr>
										<td>6</td>
										<td>历年课堂教学实施计划表(教学进度表）</td>
										<td>格式统一、内容齐全</td>
										<td><input name='num6' type="text" size="4" style="width: 50px"/></td>
									</tr>
									<tr>
										<td>7</td>
										<td>历年考试试卷</td>
										<td>格式规范统一</td>
										<td><input name='num7' type="text" size="4" style="width: 50px"/></td>
									</tr>
									<tr>
										<td>8</td>
										<td>评分标准</td>
										<td>格式规范统一</td>
										<td><input name='num8' type="text" size="4" style="width: 50px"/></td>
									</tr>
									<tr>
										<td>9</td>
										<td>试卷分析</td>
										<td>格式规范统一</td>
										<td><input name='num9' type="text" size="4" style="width: 50px"/></td>
									</tr>
									<tr>
										<td>10</td>
										<td>单科成绩单</td>
										<td>格式规范统一</td>
										<td><input name='num10' type="text" size="4" style="width: 50px"/></td>
									</tr>
									<tr>
										<td>11</td>
										<td>单科成绩单</td>
										<td>学期成绩总表</td>
										<td><input name='num11' type="text" size="4" style="width: 50px"/></td>
									</tr>
									<tr>
										<td>12</td>
										<td>各类实习教学大纲</td>
										<td>各项内容要规范、统一</td>
										<td><input name='num12' type="text" size="4" style="width: 50px"/></td>
									</tr>
									<tr>
										<td>13</td>
										<td>实习安排</td>
										<td>计划、机构、评估、成绩等资料齐全。</td>
										<td><input name='num13' type="text" size="4" style="width: 50px"/></td>
									</tr>
									<tr>
										<td>14</td>
										<td>实习成绩单</td>
										<td>格式规范统一，人数等信息准确</td>
										<td><input name='num14' type="text" size="4" style="width: 50px"/></td>
									</tr>
									</tbody>
								</table>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer center" id="div_footer">
			<a class="btn btn-primary" onclick="$.adminTeacherfile.saveTeacherfile()">保存</a>
			<a href="#" class="btn" data-dismiss="modal" id="closeViewModal">关闭</a>
		</div>
	</div>
	</form>
</body>
</html>