<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="mg_popup active">
	<div class="popup_wrap popup_warning">
		<section class="popup_header">
			<h2>Warning</h2>
		</section>
		
		<section class="popup_body">
			<div class="popup_container">
				<p>
				When you delete a project, workflile also deleted.
				</p>
				<div class="mg_btn">
					<button class="m_btn btn_blue" id="btn_delete<c:out value='${pid}'/>">OK</button>
					<button class="m_btn btn_white" id ="btn_cancel">Cancel</button>
				</div>
			</div>
		</section>		
		<button class="btn_popup_close">팝업 닫기</button>
	</div>
</div>

<script>
g_popPage = (function() {
	var pid = "<c:out value='${pid}'/>";
		$(document).ready(function() {
			fn_initSetting();
			fn_setEvents();
		});
		
		// initSetting
	    function fn_initSetting() {	    	    	
	    }

		// 이벤트 설정
		function fn_setEvents() {
			
	    	/*ok 버튼 클릭*/
		   	$("#btn_delete<c:out value='${pid}'/>").on("click",function(){
		   		var params = {};
		   		params["crudMode"]="D";
		   		params['pid'] = pid;
		   		params["fn_success"] = function(data,params){
		   			fn_saveProjectSuccess(data,params);
		   		};
		   		
		   		fn_ajax("/ai/project/deleteProject.do", params);
		   	});
			
			$("#btn_cancel").on("click",function(){
	    		fn_layerPopupClose();
	    	});
		}
		
	    //저장(등록/수정), 삭제 성공 시 
	    function fn_saveProjectSuccess(data, params) {
	 	   if(data.result && data.result != "0") {
	 	        var msg = "";
	 	        if(params["crudMode"] == "D"){
	 	            msg = "정상적으로 삭제 되었습니다.";
	 	        }else{
	 	            msg = "정상적으로 저장 되었습니다.";
	 	        }
	 	        
	 	        fn_alert(msg, function() {
	                fn_layerPopupClose(function() {
	 	                g_cttPage.search();
	 	            });
	 	        });
	 	        
	 	    }
	    }
	})();
</script>