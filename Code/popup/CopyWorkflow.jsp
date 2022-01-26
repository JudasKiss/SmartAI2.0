<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="mg_popup active">
	<div class="popup_wrap popup_createproject">
		<section class="popup_header">
			<h2>Copy Workflow</h2>
		</section>
		
		<section class="popup_body">
			<div class="popup_container">
				<p class="brief tar"><i class="required">*</i> Required Field</p>
					
				<ul class="mg_form">
					<li>
						<div class="que required">File Name</div>
						<div class="ans">
							<input type="text" class="m_text<c:out value='${wid}'/>" placeholder="Enter the File Name" required>
						</div>
					</li>
					<li>
						<div class="que required">To Project</div>
						<div class="ans">
							<select class="m_select<c:out value='${wid}'/> w100p">
							</select>
						</div>
					</li>
				</ul>
				
				<div class="mg_btn">
					<button class="m_btn btn_blue" id="btn_create<c:out value='${wid}'/>">Create</button>
					<button class="m_btn btn_white"id="btn_cancel<c:out value='${wid}'/>">Cancel</button>
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
	var wid = "<c:out value='${wid}'/>";
    $(document).ready(function () {
        fn_initSetting();
        fn_setEvents();
        fn_popupOpen();
    });
    
 	// initSetting
    function fn_initSetting() {
    	/* select */
		$(".m_select").selectpicker();
    }
    
    // 이벤트 설정
    function fn_setEvents() {
    	//create
    	$("#btn_create<c:out value='${wid}'/>").on("click",function(){
    		var params = {};
	   		params['name'] = $(".m_text<c:out value='${wid}'/>").val();
	   		var pname = $(".m_select<c:out value='${wid}'/>").val();
	   		params['pid'] = $("[name='"+pname+"']").attr("uuid");
	   		params['wid'] = wid;
	   		//params['descr'] = $("[name='"+pid+"']").eq(0).children(".item_brief").text();
	   		params['descr'] = "";
	   		params["fn_success"] = function(data,params){
	   			fn_saveWorkflowSuccess(data,params);
	   		};
	   		
	   		fn_ajax("/ai/project/copyWorkflow.do", params);
    	});
    	
    	//cancel
    	$("#btn_cancel<c:out value='${wid}'/>").on("click",function(){
    		fn_layerPopupClose();
    	});
    	
	   	$(".m_text<c:out value='${wid}'/>").on("blur", function() {
	         fn_nameChk();
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
        if($(".m_text<c:out value='${wid}'/>").val() != ""){ 
            var params = {};
            //입력한ID을 파라미터에 할당
            params['name'] = $(".m_text<c:out value='${wid}'/>").val();
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
 	        $(".m_text<c:out value='${wid}'/>").val("");
 	        
 	        var opts = {};
 	        opts["focusName"] = ".m_text";
 	        
 	        fn_alert("이미 존재하는 이름입니다.<br>확인해주시기 바랍니다.", "", opts);
 	    }
   }
    
    function fn_popupOpen() {
 	   var params = {};
 	      params["uuid"] = wid;
 	      params["fn_success"] = function(data, params){
 	         var result = data.result;
 	        fn_selectWorkflowSuccess(result);
 	      };
 	      fn_ajax("/ai/project/workflowRead.do", params);
    }
    
    function fn_selectWorkflowSuccess(result) {  
 	      var WorkflowInfos = result.WorkflowInfos;
 	      $(".m_text<c:out value='${wid}'/>").val(WorkflowInfos.name+'_copy');
		  var arr = result.result;
		  $.each(arr,function(idx){
			  $(".m_select<c:out value='${wid}'/>").append('<option>'+arr[idx]+'</option>');
		  })
 	      
 	      
    }
})();
</script>