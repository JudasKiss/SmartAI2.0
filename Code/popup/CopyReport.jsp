<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="mg_popup active">
	<div class="popup_wrap popup_createproject">
		<section class="popup_header">
			<h2>Copy Report</h2>
		</section>
		
		<section class="popup_body">
			<div class="popup_container">
				<p class="brief tar"><i class="required">*</i> Required Field</p>
					
				<ul class="mg_form">
					<li>
						<div class="que required">File Name</div>
						<div class="ans">
							<input type="text" class="m_text<c:out value='${report_seq}'/>" placeholder="Enter the File Name" required>
						</div>
					</li>
					<li>
						<div class="que required">To Project</div>
						<div class="ans">
							<select class="m_select<c:out value='${report_seq}'/> w100p">
							</select>
						</div>
					</li>
				</ul>
				
				<div class="mg_btn">
					<button class="m_btn btn_blue" id="btn_create<c:out value='${report_seq}'/>">Create</button>
					<button class="m_btn btn_white"id="btn_cancel<c:out value='${report_seq}'/>">Cancel</button>
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
	var report_seq = "<c:out value='${report_seq}'/>";
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
    	
    	$("#btn_create<c:out value='${report_seq}'/>").on("click",function(){
    		var params = {};
	   		params['title'] = $(".m_text<c:out value='${report_seq}'/>").val();
	   		var pid = $(".m_select<c:out value='${report_seq}'/>").val();
	   		params['pid'] = $("[name='"+pid+"']").attr("uuid");
	   		params['report_seq'] = report_seq;
	   		//params['description'] = $("[name='"+pid+"']").eq(0).children(".item_brief").text();
	   		params['description'] = "";
	   		params["fn_success"] = function(data,params){
	   			fn_saveReportSuccess(data,params);
	   		};
	   		
	   		fn_ajax("/ai/project/copyReport.do", params);
    	});
    	
    	$("#btn_cancel<c:out value='${report_seq}'/>").on("click",function(){
    		fn_layerPopupClose();
    	});
    	
	   	$(".m_text<c:out value='${report_seq}'/>").on("blur", function() {
	         fn_nameChk();
	       });
    	
    }
    
  	//저장(등록/수정), 삭제 성공 시 
    function fn_saveReportSuccess(data, params) {
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
        if($(".m_text<c:out value='${report_seq}'/>").val() != ""){ 
            var params = {};
            //입력한ID을 파라미터에 할당
            params['title'] = $(".m_text<c:out value='${report_seq}'/>").val();
            params["fn_success"] = function(data, params) {
               // fn_ajax 통신 후 실행
                fn_nameChkSuccess(data, params);
            };
            fn_ajax("/ai/project/reportNameChk.do", params);   
        }
    }
    
    //ID 중복 체크 후 메세지 처리
   function fn_nameChkSuccess(data) {
 	   if(data.result && data.result != "0") {
 	        $(".m_text<c:out value='${report_seq}'/>").val("");
 	        
 	        var opts = {};
 	        opts["focusName"] = ".m_text";
 	        
 	        fn_alert("이미 존재하는 이름입니다.<br>확인해주시기 바랍니다.", "", opts);
 	    }
   }
    
    function fn_popupOpen() {
 	   var params = {};
 	      // ApiList.jsp에서 불러온 apiNm 값을 파라미터에 저장
 	      params["report_seq"] = report_seq;
 	      params["fn_success"] = function(data, params){
 	         // 컨트롤러의 리턴값을 reslut에 저장
 	         var result = data.result;
 	         fn_selectReportSuccess(result);
 	      };
 	      fn_ajax("/ai/project/reportRead.do", params);
    }
    
    function fn_selectReportSuccess(result) {  
 	   // 컨트롤러 result에 담긴 값은 입력된 api정보
 	      var ReportInfos = result.ReportInfos;
 	      $(".m_text<c:out value='${report_seq}'/>").val(ReportInfos.title+'_copy');
 	      
 	      var arr = result.result;
		  $.each(arr,function(idx){
			  $(".m_select<c:out value='${report_seq}'/>").append('<option>'+arr[idx]+'</option>');
		  })
    }
    
    
})();
</script>