<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.category.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/falgun/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		if("${tip}" != null && "${tip}" != ""){
			noty({"text":"${tip}","layout":"top","type":"success","timeout":"2000"});
		}
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
						<div class="content-widgets ">
							<div class="widget-head  bondi-blue" >
								<h3>提交评审材料</h3>
							</div>
							
							<div class="widget-container">
							
							<div class="row-fluid">
								<form action="${pageContext.request.contextPath}/admin/teacherupload/doupload" method="post" enctype="multipart/form-data">
							<input type="hidden" name="adminuser.id" value="${sessionScope.adminuser.id}">
							<div class="control-group">
								<label for="name" class="control-label">学期：</label>
								<div class="controls">
									<select name="year">
										<option value="2015-上学期">2015-上学期</option>
										<option value="2015-下学期">2015-下学期</option>
										<option value="2016-上学期">2016-上学期</option>
										<option value="2016-下学期">2016-下学期</option>
										<option value="2017-上学期">2017-上学期</option>
										<option value="2017-下学期">2017-下学期</option>
									</select>
								</div>
							</div>
							
							
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">上传教学资料（外审）：</label>
								<div class="controls">
									<input type="file" name='filename' value="资料"/>
								</div>
							</div>
							<div class="modal-footer center" id="div_footer">
									<button type="submit" class='btn btn-primary'>修改</button>
								</div>
						</form>
						</div>
				
				
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../foot.jsp"%>
	</div>
</body>
</html>