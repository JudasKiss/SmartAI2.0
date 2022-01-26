<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="mg_popup active">
	<div class="popup_wrap popup_shareFile">
		<section class="popup_header">
			<h2>Share File</h2>
		</section>
		
		<section class="popup_body">
			<div class="popup_container">
				<!--
				<ul class="mg_form">
					<li>
						<div class="que">Shared Unit</div>
						<div class="ans">
							<div class="m_radio">
								<input type="radio" id="radio1" name="option" value="user" checked>
								<label for="radio1">User</label>
							</div>
							
							<div class="m_radio">
								<input type="radio" id="radio2" name="option" value="department">
								<label for="radio2">Department</label>
							</div>

							<div class="m_radio">
								<input type="radio" id="radio3" name="option" value="administrator">
								<label for="radio3">Administrator</label>
							</div>
						</div>
						-- //옵션 체크 버튼 --
					</li>
				</ul>
				-->
				
				<div class="share_box">
					<input type="text" class="m_text" placeholder="Search Keywords">
					
					<ul>
						<li>
							<div id="div_shareable_cnt" class="grid_total">0 건</div>
							<div id="grid_search" class="grid_area"></div>
						</li>
						<li>
		          			<button id="btn_shift_right" class="btn_shift_right"></button>
		           			<button id="btn_shift_left" class="btn_shift_left"></button>
		           			<button id="btn_shift_allRight" class="btn_shift_allRight"></button>
		          			<button id="btn_shift_allLeft" class="btn_shift_allLeft"></button>
			   			</li>
			   			<li>
							<div id="div_shared_cnt" class="grid_total">0 건</div>
							<div id="grid_user" class="grid_area"></div>
						</li>
					</ul>
				</div>
				
				<div class="mg_btn">
					<button id="btn_share_create" class="m_btn btn_blue">Create</button>
					<button id="btn_share_cancel" class="m_btn btn_white">Cancel</button>
				</div>
			</div>
		</section>
		
		<button class="btn_popup_close">
			팝업 닫기
		</button>
	</div>
</div>

<script>
g_cttPage2 = (function() {
	
	var params_obj = new Object();			// 전체 파라미터를 보관하는 오브젝트
	
	var share_make_list = new Array();		// 공유 생성해야할 리스트
	
	var shareable_grid;						// 공유 가능자 그리드 (좌측)
	var shared_grid;						// 공유된  사용자 그리드 (우측)
	
	// 초기 설정 정의
	$(document).ready(function() {
		params_obj.version = '<c:out value="${version}"/>';			// msg 버전
		params_obj.user_id = '<c:out value="${user_id}"/>';			// 사용자 ID
		params_obj.share_type = '<c:out value="${share_type}"/>';	// 공유 타입 ('workflow' or 'report')
    	
    	if(params_obj.share_type == 'workflow') {
    		params_obj.wid = '<c:out value="${uuid}"/>';
    	} else if(params_obj.share_type == 'report') {
    		params_obj.rid = '<c:out value="${uuid}"/>';	
    	} else {
    		fn_alert("공유 타입이 명확하지 않습니다. 관리자에게 문의해주시기 바랍니다.")
    	}
    	
	    fn_initSetting();
	    fn_setEvent();
	});
	
	// initSetting
    function fn_initSetting() {
    	setTimeout(function() {
    		fn_shareableGrid();
	    }, 500);
    }
	
	// 이벤트 정의
	function fn_setEvent() {		
		$(".m_text").on("keyup",function(key){
	        if(key.keyCode==13) {
	            params_obj.name = $(".m_text").val();
	            fn_shareableGrid();
	            shareable_grid.reloadData();
	        }
	    });
		
		// 공유 항목에 추가
		$("#btn_shift_right").on('click', function() {
			// 그리드 row 전부 제거
			shared_grid.clear();
			// make 리스트 재정의
			share_make_list = shareable_grid.getCheckedRows();
			// 그리드에 row 생성
			shared_grid.appendRows(share_make_list);
			
			//console.log(share_make_list);
			$("#div_shared_cnt").text(share_make_list.length + " 건");
		});
		
		// 공유 항목에서 제외
		$("#btn_shift_left").on('click', function() {
			// 체크 된 항목 리스트
			var keys = shared_grid.getCheckedRowKeys();
			
			var shareable_arr = shareable_grid.getData();
			
			// 체크된 항목 만큼 row 제거
			for(var i=0; i<keys.length; i++) {
				
				// make 리스트에서 동일한 id 에 대하여 데이터 제거
				for(var k=0; k<share_make_list.length; k++) {
					if(share_make_list[k]["id"] == shared_grid.getRow(keys[i])["id"]) {
						share_make_list.splice(k, 1);
					}
				}
				
				//
				for(var n=0; shareable_arr.length>n; n++) {
         			if(shareable_arr[n]["id"] == shared_grid.getRow(keys[i])["id"]) {
         				shareable_grid.uncheck(shareable_arr[n]["rowKey"]);
         			}
         		}
				
				// 공유자 항목 그리드에서 삭제
				shared_grid.removeRow(keys[i], '');
			}
			
			
			
			//console.log(share_make_list);
			$("#div_shared_cnt").text(share_make_list.length + " 건");
		});
		
		// 공유 가능자 전체 추가
		$("#btn_shift_allRight").on('click', function() {
			shareable_grid.checkAll();
			share_make_list = shareable_grid.getCheckedRows();
			shared_grid.appendRows(share_make_list);
			
			$("#div_shared_cnt").text(share_make_list.length + " 건");
		});
		
		// 공유 항목 전체 삭제
		$("#btn_shift_allLeft").on('click', function() {
			share_make_list = new Array();
			shared_grid.clear();
			
			$("#div_shared_cnt").text(share_make_list.length + " 건");
		});
		
		
		// 공유 저장
		$("#btn_share_create").on('click', function() {
			var params = {};
			params["version"] = params_obj.version;
			params["user_id"] = params_obj.user_id;
			
	    	if(params_obj.share_type == 'workflow') {
	    		params["wid"] = params_obj.wid;
	    		params["json"] = JSON.stringify(share_make_list);
		    	params["fn_success"] = function(data) {
		    		var opts = {};

	    			var fncOk = (function(){
	    			    //확인 버튼시 실행 함수
	    			     fn_layerPopupClose();
	    			});
					
	    			if(data.result == 'success') {
	    				fn_alert("공유 설정이 저장되었습니다.", fncOk, opts);
	    			} else {
	    				fn_alert("공유가 실패하였습니다. 관리자에게 문의하여 주시기 바랍니다.");
	    			}

		    	}
	    		fn_ajax("/ai/project/insertShareWorkflow.do", params);
	    		
	    	} else if(params_obj.share_type == 'report') {
	    		params["rid"] = params_obj.rid;
	    		
	    	} else {
	    		fn_alert("공유 타입이 명확하지 않습니다. 관리자에게 문의해주시기 바랍니다.")
	    	}
		});
		
		$("#btn_share_cancel").on('click', function() {
			fn_layerPopupClose();
		});
	}
	
	
	// 공유가 가능한 유저 그리드 랜더링
	function fn_shareableGrid() {
		$("#grid_search").empty();
		
        var headers = {};
		headers[$("meta[name='_csrf_header']").attr("content")] = $("meta[name='_csrf']").attr("content");
        
        var dataSource = {
		    initialRequest : true,
	        readDataMethod : "POST",
	        enableAjaxHistory : false,	
		    api: {
	            readData : {
	                "url" : "/ai/project/selectWorkflowShareableUsers.do",
	                "method" : "POST",
	                "headers" : headers,
	                "contentType" : "application/json",
	                "initParams" : params_obj
	            }
	        }
		}
   	    
        shareable_grid = new tui.Grid({
			el : $("#grid_search").get(0),
			rowHeight : 30,
	        minRowHeight : 30,
			header : {
				height : 30
			},
			bodyHeight : 350,
			rowHeaders : ["checkbox"],
			selectionUnit: "row",
			data: dataSource,
			columns : [
           		{
           			header : "name",
			 		name : "name",
			 		width : 350,
			 		align : "center",
			 		sortable: true,
			 		filter: { type: 'text', showApplyBtn: true, showClearBtn: true }
           		},
           ],
           columnOptions: {
        	   	minWidth: 30,
        	   	resizable: true
           },
		});
        
        // 전체 조회건수 표시
        shareable_grid.on("response", function(event) {
        	var totalCount = JSON.parse(event.xhr.response)["data"]["pagination"]["totalCount"];
    		$("#div_shareable_cnt").text(totalCount + " 건");
    	});
        
        
     	// 모든 데이터 업데이트 및 grid 랜더링 후의 이벤트
     	shareable_grid.on("onGridUpdated", function(event) {
     		fn_sharedGrid();
     	});
	}
	
	
	// 공유가 완료된 유저 그리드
	function fn_sharedGrid() {
		$("#grid_user").empty();
		
        var headers = {};
        headers[$("meta[name='_csrf_header']").attr("content")] = $("meta[name='_csrf']").attr("content");
        
        var dataSource = {
       		initialRequest : true,
   	        readDataMethod : "POST",
   	        enableAjaxHistory : false,	
   		    api: {
   	            readData : {
   	                "url" : "/ai/project/selectWorkflowSharedUsers.do",
   	                "method" : "POST",
   	                "headers" : headers,
   	                "contentType" : "application/json",
   	                "initParams" : params_obj
   	            }
   	        }
		}
   	    
        shared_grid = new tui.Grid({
			el : $("#grid_user").get(0),
			rowHeight : 30,
	        minRowHeight : 30,
			header : {
				height : 30
			},
			bodyHeight : 350,
			rowHeaders : ["checkbox"],
			selectionUnit: "row",
			data: dataSource,
			columns : [
				{
           			header : "name",
			 		name : "name",
			 		width : 350,
			 		align : "center",
			 		sortable: true,
			 		filter: { type: 'text', showApplyBtn: true, showClearBtn: true }
           		}
           ],
           columnOptions: {
        	   	minWidth: 30,
        	   	resizable: true
           },
		});
        
     	// 전체 조회건수 표시
        shared_grid.on("response", function(event) {
        	var totalCount = JSON.parse(event.xhr.response)["data"]["pagination"]["totalCount"];
    		$("#div_shared_cnt").text(totalCount + " 건");
    	});
     	
     	// 모든 데이터 업데이트 및 grid 랜더링 후의 이벤트
     	shared_grid.on("onGridUpdated", function(event) {
     		// 공유된 전체 건수 전체 check
			shared_grid.checkAll(true);
     		// 공유된 건수중 check 된 전체 row 반환
     		share_make_list = shared_grid.getCheckedRows();
     		
     		// 공유된 건과 같은 이름을 가진 공유 가능자 리스트에서 체크하도록 변경
     		for(var k=0; share_make_list.length>k; k++) {
     			var shareable_arr = shareable_grid.getData();
         		for(var i=0; shareable_arr.length>i; i++) {
         			if(share_make_list[k]["id"] == shareable_arr[i]["id"]) {
         				shareable_grid.check(shareable_arr[i]["rowKey"]);
         			}
         		}
     		}
     		
     	});
	}
	
})();
</script>