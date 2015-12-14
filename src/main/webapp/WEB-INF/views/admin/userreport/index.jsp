<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css" rel="stylesheet">
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.userreport.js?1=112"></script>
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
								<h3>学生评价表</h3>
							</div>
							<div class="box well form-inline">
								<span>学生姓名：</span>
								<input type="text" id="_name" >
								<a onclick="$.adminUserreport.initSearchDataTable()"
									class="btn btn-info" data-loading-text="正在加载..."><i class="icon-search"></i>查询</a>
							</div>
							<div class="widget-container">
								
									<a class="btn btn-success" style="float: right; margin: 5px;" onclick="$.adminPlan.showPlanAddModal()"><i class="icon-plus"></i>新增</a>
								<table class="responsive table table-striped table-bordered"
									id="dt_table_view">
									<thead>
										<tr>
											<th >流水号</th>
											<th >学期</th>
											<th >学院</th>
											<th >专业</th>
											<th >课程</th>
											<th >任课老师</th>
											<th >评价学生</th>
											<th >总分</th>
											<th >查看</th>
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
											<th >选项</th>
											<th >评价人</th>
											<th >得分</th>
										</tr>
									</thead>
									<tbody id='table_detail'>
									</tbody>
								</table>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer center" id="div_footer">
			<a href="#" class="btn" data-dismiss="modal" id="closeViewModal">关闭</a>
		</div>
	</div>
</body>
</html>