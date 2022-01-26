<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="mg_popup active">
	<div class="popup_wrap popup_createproject">
		<section class="popup_header">
			<h2>Edit Workflow</h2>
		</section>
		
		<section class="popup_body">
			<div class="popup_container">
				<p class="brief tar"><i class="required">*</i> Required Field</p>
					
				<ul class="mg_form">
					<li>
						<div class="que required">Name</div>
						<div class="ans">
							<input type="text" class="m_text<c:out value='${uuid}'/>" placeholder="Enter the File Name">
						</div>
					</li>
					<li>
						<div class="que">Description</div>
						<div class="ans lineBreak">
							<textarea class="m_textarea<c:out value='${uuid}'/>" placeholder="Enter the Description.(Option)"></textarea>
							<span class="info tar">(0/1,000)</span>
						</div>
					</li>
				</ul>
				
				<div class="mg_btn">
					<button class="m_btn btn_blue" id="btn_save<c:out value='${uuid}'/>">Save</button>
					<button class="m_btn btn_white" id="btn_cancel">Cancel</button>
				</div>
			</div>
		</section>
		
		<button class="btn_popup_close">
			팝업 닫기
		</button>
	</div>
</div>
<!-- //mg_popup -->


<script>
g_popPage = (function() {
	var uuid = "<c:out value='${uuid}'/>";
    $(document).ready(function () {
        fn_initSetting();
        fn_setEvents();        
        fn_popupOpen();
    });
    
 	// initSetting
    function fn_initSetting() {    	    	
    }
    
    // 이벤트 설정
    function fn_setEvents() {    
    	
    	$("#btn_save<c:out value='${uuid}'/>").on("click",function(){
	   		var params = {};
	   		params["crudMode"]="U";
	   		params['name'] = $(".m_text<c:out value='${uuid}'/>").val();
	   		params['descr'] = $(".m_textarea<c:out value='${uuid}'/>").val();
	   		params['uuid'] = uuid;
	   		
	   		console.log(params);
	   		
	   		params["fn_success"] = function(data,params){
	   			fn_saveWorkflowSuccess(data,params);
	   		};
	   		
	   		fn_ajax("/ai/project/reviseWorkflow.do", params);
	   	});
    	
    	$("#btn_cancel").on("click",function(){
    		fn_layerPopupClose();
    	});
    	
	   	$(".m_text<c:out value='${uuid}'/>").on("blur", function() {
	         fn_nameChk();
	       });
	   	
	   	/* 글자수 카운팅 */
		$(".m_textarea<c:out value='${uuid}'/>").keyup(function() {
			var content = $(this).val();
			$(".info").html("(" + content.length + "/1,000)"); //실시간 글자수 카운팅
			if($(this).val().length > 1000) {
	            $(this).val($(this).val().substring(0, 1000));
	            $('.info').html("(1000 / 1000)");
	        }
		});
    }
    
  	//저장(등록/수정), 삭제 성공 시 
    function fn_saveWorkflowSuccess(data, params) {
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
    
    // ID 중복 체크
    function fn_nameChk() {
        if($(".m_text<c:out value='${uuid}'/>").val() != ""){ 
            var params = {};
            //입력한ID을 파라미터에 할당
            params['name'] = $(".m_text<c:out value='${uuid}'/>").val();
            
            params["fn_success"] = function(data, params) {
               // fn_ajax 통신 후 실행
                fn_nameChkSuccess(data, params);
            };
            
            fn_ajax("/ai/project/workflowNameChk.do", params);
            
        }
    }
    
    //ID 중복 체크 후 메세지 처리
   function fn_nameChkSuccess(data) {
 	   if(data.result && data.result != "0") {
 	        $(".m_text<c:out value='${uuid}'/>").val("");
 	        
 	        var opts = {};
 	        opts["focusName"] = ".m_text<c:out value='${uuid}'/>";
 	        
 	        fn_alert("이미 존재하는 이름입니다.<br>확인해주시기 바랍니다.", "", opts);
 	    }
   }
    
   function fn_popupOpen() {
		 
	   var params = {};
	      // ApiList.jsp에서 불러온 apiNm 값을 파라미터에 저장
	      params["uuid"] = uuid;
	      params["fn_success"] = function(data, params){
	         // 컨트롤러의 리턴값을 reslut에 저장
	         var result = data.result;
	         fn_selectWorkflowSuccess(result);
	      };
	      fn_ajax("/ai/project/workflowRead.do", params);
   }
   
   function fn_selectWorkflowSuccess(result) {  
	   // 컨트롤러 result에 담긴 값은 입력된 api정보
	      var WorkflowInfos = result.WorkflowInfos;
	      $(".m_text<c:out value='${uuid}'/>").val(WorkflowInfos.name);
	      $(".m_textarea<c:out value='${uuid}'/>").val(WorkflowInfos.descr);

	      
   }
   
})();
</script>