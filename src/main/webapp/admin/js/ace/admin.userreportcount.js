jQuery.adminUserreportcount = {
		userDataTable:null,
		initSearchDataTable : function() {
			if (this.userDataTable == null) {
				this.userDataTable = $('#dt_table_view').dataTable({
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
					"sAjaxSource" : $.ace.getContextPath() + "/admin/userreportcount/list",
					"fnDrawCallback" : function(oSettings) {
						$('[rel="popover"],[data-rel="popover"]').popover();
					},
					"fnServerData" : function(sSource, aoData, fnCallback) {
						var name = $("#_name").val();
						var majorid = $("#majorid").val();
						if (!!name) {
							aoData.push({
								"name" : "username",
								"value" : name
							});
						}
						if (!!majorid) {
							aoData.push({
								"name" : "majorid",
								"value" : majorid
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
						"mDataProp" : "username"
					}, {
						"mDataProp" : "name"
					},{
						"mDataProp" : "major.school.name"
					},{
						"mDataProp" : "major.name"
					},{
						"mDataProp" : "acout"
					},{
						"mDataProp" : "bcount"
					}],
					"aoColumnDefs" : [
					{
						'aTargets' : [5],
						'fnRender' : function(oObj, sVal) {
							return 	"<td><span class='label label-success'>"+sVal+"</span></td>";
						}
					},
					{
						'aTargets' : [6],
						'fnRender' : function(oObj, sVal) {
							return 	"<td><span class='label label-important'>"+sVal+"</span></td>";
						}
					},
					 {
						'aTargets' : [ '_all' ],
						'bSortable' : false,
						'sClass' : 'center'
					}]

				});
			} else {
				var oSettings = this.userDataTable.fnSettings();
				oSettings._iDisplayStart = 0;
				this.userDataTable.fnDraw(oSettings);
			}

		}
};