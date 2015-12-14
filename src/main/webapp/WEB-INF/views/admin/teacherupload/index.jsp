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
function AngelMoney(s){
	   if(/[^0-9\.]/.test(s)) return "不是数字！";
	   s=s.replace(/^(\d*)$/,"$1.");
	   s=(s+"00").replace(/(\d*\.\d\d)\d*/,"$1");
	   s=s.replace(".",",");
	   var re=/(\d)(\d{3},)/;
	   while(re.test(s))
	           s=s.replace(re,"$1,$2");
	   s=s.replace(/,(\d\d)$/,".$1");
	   return "￥" + s.replace(/^\./,"0.")
	}
	function fun_getitem(){
		$.ajax({
			type : "POST",
			url : $.ace.getContextPath() + "/admin/item/get",
			data:{
				"id":$("#itemid").val()
			},
			success : function(json) {
				$("#itemimg").attr("src","../upload/"+json.resultMap.object.imgPath);
				$("#itemcount").html(json.resultMap.object.count+"件");
				$("#itemdetail").show();
			}
		});
	}
	$(document).ready(function(){
		if("${name}" != null && "${name}" != ""){
			noty({"text":"${name}","layout":"top","type":"success","timeout":"2000"});
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
								<h3>个人中心</h3>
							</div>
							
							<div class="widget-container">
							
							<div class="row-fluid">
								<form action="${pageContext.request.contextPath}/admin/adminuser/docenter" method="post">
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
									<input type="file" value="资料"/>
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