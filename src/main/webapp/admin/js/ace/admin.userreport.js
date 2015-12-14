jQuery.adminUserreport = {
		userreportDataTable:null,
		initSearchDataTable : function() {
			if (this.userreportDataTable == null) {
				this.userreportDataTable = $('#dt_table_view').dataTable({
					"sDom" : "<'row-fluid'<'span6'l>r>t<'row-fluid'<'span6'i><'span6'p>>",
					"sPaginationType" : "bootstrap",
					"oLanguage" : {
						"sLengthMenu" : "每页显示 _MENU_ 条记录",
						"sZeroRecords" : "抱歉， 暂时没有记录",
						"sInfo" : "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
						"sSearch" : "",
						"sInfoEmpty" : "没有数据",
						"sInfoFiltered" : "(从 _MAX_ 条数据中检索)",
						"oPaginate" : {
							"sFirst" : "首页",
							"sPrevious" : "前一页",
							"sNext" : "后一页",
							"sLast" : "尾页"
						}
					},
					"bAutoWidth" : false,
					"iDisplayLength" : 10,
					"aLengthMenu" : [ 5, 10, 25, 50],
					"bServerSide" : true,
					"sServerMethod" : "POST",
					"bProcessing" : true,
					"bSort" : false,
					"sAjaxSource" : $.ace.getContextPath() + "/admin/userreport/list",
					"fnDrawCallback" : function(oSettings) {
						$('[rel="popover"],[data-rel="popover"]').popover();
					},
					"fnServerData" : function(sSource, aoData, fnCallback) {
						var name = $("#_name").val();
						if (!!name) {
							aoData.push({
								"name" : "name",
								"value" : name
							});
						}
						$.ajax({
							"dataType" : 'json',
							"type" : "POST",
							"url" : sSource,
							"data" : aoData,
							"success" : function(data){
								fnCallback(data);
							}
						});
					},
					"aoColumns" : [ {
						"mDataProp" : "id"
					}, {
						"mDataProp" : "plan.year"
					}, {
						"mDataProp" : "plan.major.school.name"
					}, {
						"mDataProp" : "plan.major.name"
					}, {
						"mDataProp" : "plan.lesson.name"
					},{
						"mDataProp" : "plan.teacher.name"
					},{
						"mDataProp" : "user.name"
					},{
						"mDataProp" : "totalScore"
					},{
						"mDataProp" : ""
					}],
					"aoColumnDefs" : [
						{
							'aTargets' : [7],
							'fnRender' : function(oObj, sVal) {
								return 	"<td><span class='label label-success'>"+sVal+"</span></td>";
							}
						},
						{
							'aTargets' : [8],
							'fnRender' : function(oObj, sVal) {
								return"  <button class=\"btn2 btn-info\" onclick=\"$.adminUserreport.showUserreportAddModal("+oObj.aData.id+")\"><i class=\"icon-trash\"></i> 查看详细</button>";
							}
						},
					 {
						'aTargets' : [ '_all' ],
						'bSortable' : false,
						'sClass' : 'center'
					}]

				});
			} else {
				var oSettings = this.userreportDataTable.fnSettings();
				oSettings._iDisplayStart = 0;
				this.userreportDataTable.fnDraw(oSettings);
			}

		},
		deleteUserreport :function(id){
			bootbox.confirm( "是否确认删除？", function (result) {
	            if(result){
	            	$.ajax({
	        			type : "get",
	        			url : $.ace.getContextPath() + "/admin/userreport/delete/"+id,
	        			dataType : "json",
	        			success : function(json) {
	        				if(json.state=='success'){
	        					noty({"text":""+ json.msg +"","layout":"top","type":"success","timeout":"2000"});
	        					$.adminUserreport.initSearchDataTable();
	        				}else{
	        					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	        				}
	        			}
	        		});
	            }
	        });
		},
		showUserreportAddModal: function(id){
			$("#id").val(id);
			$('#_modal').modal({});
			$.adminUserreport.showEdit(id);
			$("#_modal").modal('show');
		},
		showEdit: function (id){
			$("#id").val(id);
			$.ajax({
    			type : "get",
    			url : $.ace.getContextPath() + "/admin/userreport/get/"+id,
    			dataType : "json",
    			success : function(json) {
    				if(json.state=='success'){
    					$("#table_detail").html("");
    					for(i=0;i<json.object.details.length;i++){
    						$("#table_detail").append("<tr>"+
    					 			"<td>"+(i)+json.object.details[i].testitem.name+"</td>"+
    					 			"<td>"+json.object.user.name+"</td>"+
    				 				"<td><span class='label label-success'>"+json.object.details[i].score+"</span></td>"+
    				 				"</td>"+
    				 		"</tr>");
    					}
    				}else{
    					noty({"text":""+ json.msg +"","layout":"top","type":"warning"});
    				}
    			}
    		});
			$("#_modal").modal('show');
		},
		
		saveUserreport: function(id){
			$.ajax({
    			type : "post",
    			url : $.ace.getContextPath() + "/admin/userreport/save",
    			data:$("form").serialize(),
    			dataType : "json",
    			success : function(json) {
    				if(json.state=='success'){
    					$("#_modal").modal('hide');
    					noty({"text":""+ json.msg +"","layout":"top","type":"success","timeout":"2000"});
    					$.adminUserreport.initSearchDataTable();
    				}else{
    					noty({"text":""+ json.msg +"","layout":"top","type":"warning"});
    				}
    			}
    		});
		}
		
};