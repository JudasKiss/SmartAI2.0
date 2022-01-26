<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="mg_popup active">
	<div class="popup_wrap popup_createFile">
		<section class="popup_header">
			<h2>Create Report</h2>
		</section>
		
		<section class="popup_body">
			<div class="popup_container">
				<ul class="mg_wizard">
					<li><a url="#">Select work type</a></li>
					<li class="active"><a url="#">Enter information</a></li>
				</ul>

				<div class="wizard_content">
					<p class="brief tar"><i class="required">*</i> Required Field</p>
					
					<ul class="mg_form">
						<li>
							<div class="que required">File Name</div>
							<div class="ans">
								<input type="text" class="m_text" placeholder="Enter the File Name">
							</div>
						</li>
						<li>
							<div class="que">Description</div>
							<div class="ans lineBreak">
								<textarea class="m_textarea" placeholder="Enter the Description.(Option)"></textarea>
								<span class="info tar">(0/1,000)</span>
							</div>
						</li>
						<li>
							<div class="que required">Option</div>
							<div class="ans">
								<div class="m_radio">
									<input type="radio" id="radio1" name="option" value="new" class="option_select" checked>
									<label for="radio1">New</label>
								</div>
								
								<div class="m_radio">
									<input type="radio" id="radio2" name="option" value="copy" class="option_select">
									<label for="radio2">Copy</label>
								</div>

							</div>
						</li>
						<li>
							<div class="que">&nbsp;</div>
							<div class="ans">
								<div class="option_wrap">
									<div class="option_box option_copy">
										<!-- start : select 검색 -->
										<select class="m_select" data-live-search="true">
										</select>
										<!-- end : select 검색 -->																										
									</div>
								</div>
							</div>
						</li>
					</ul>
					
					<p class="brief tac">When creation is completed, go to the work file.</p>
					
					<ul class="mg_btn">
						<li><button class="btn_prev">Back</button></li>
						<li>
							<button class="m_btn btn_blue" id="btn_finish">Finish</button>
							<button class="m_btn btn_white" id="btn_close">Cancel</button>
						</li>
						<li>&nbsp;</li>
					</ul>
				</div>
			</div>
		</section>
		
		<button class="btn_popup_close" id="btn_close3">
			팝업 닫기
		</button>
	</div>
</div>
<!-- //mg_popup -->


<script>
g_popPage = (function() {
    $(document).ready(function () {
        fn_initSetting();
        fn_setEvents();
        fn_projectList();
    });
    
 	// initSetting
    function fn_initSetting() {
    	/* select */
		$(".m_select").selectpicker();
    }
    
    // 이벤트 설정
    function fn_setEvents() {
    	
	   	$("#btn_close3").on("click",function(){
	   		fn_layerPopupClose(function(){
	   			fn_layerPopupClose();
	   		});
	   	});	
	   	
		/* 라디오 버튼 옵션 클릭시 */
    	$(".option_select").click(function() {
    		$(".option_box").removeClass("active");
    		if($(this).val() == "copy"){
    			$(".option_copy").addClass("active");
    		}else if($(this).val() == "shared"){
    			$(".option_shared").addClass("active");
    		}
    		
		});		
		
		$("#btn_finish").on("click",function(){
	   		var params = {};
	   		params['title'] = $(".m_text").val();
	   		params['description'] = $(".m_textarea").val();
	   		params["pid"]= "${pid}";
	   		params["rname"] = $(".m_select").selectpicker('val');
	   		if($(".option_box.option_copy").hasClass("active")){
		   		params["fn_success"] = function(data,params){
		   			fn_saveReportSuccess(data,params);
		   		};
		   		fn_ajax("/ai/project/copyReport.do", params);
	   		}else{
		   		params["fn_success"] = function(data,params){
		   			fn_saveReportSuccess(data,params);
		   		};
		   		fn_ajax("/ai/project/insertReport.do", params);
	   		}
		});
		
	   	$(".m_text").on("blur", function() {
	         fn_nameChk();
	       });
		
	   	$("#btn_close").on("click",function(){
	   		fn_layerPopupClose(function(){
	   			fn_layerPopupClose();
	   		});
	   	});	
    	
		$(".btn_prev").click(function(){
			fn_layerPopupClose();
		});
		
	   	/* 글자수 카운팅 */
		$(".m_textarea").keyup(function() {
			var content = $(this).val();
			$(".info").html("(" + content.length + "/1,000)"); //실시간 글자수 카운팅
			if($(this).val().length > 1000) {
	            $(this).val($(this).val().substring(0, 1000));
	            $('.info').html("(1000 / 1000)");
	        }
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
 	               fn_layerPopupClose();
 	            });
 	        });
 	    }
    }
    // ID 중복 체크
    function fn_nameChk() {
        if($(".m_text").val() != ""){ 
            var params = {};
            //입력한ID을 파라미터에 할당
            params['title'] = $(".m_text").val();
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
 	        $(".m_text").val("");
 	        
 	        var opts = {};
 	        opts["focusName"] = ".m_text";
 	        
 	        fn_alert("이미 존재하는 이름입니다.<br>확인해주시기 바랍니다.", "", opts);
 	    }
   }
    
   function fn_projectList() {
	 	  var params = {};
	 	  $(".option_box.option_copy .m_select").selectpicker('destroy');
	 	      params["fn_success"] = function(data, params){
	 	         var result = data.result;
	 	         for(var i=0;i<result.length;i++){
	 	        	addHtml =  "";
	 	        	addHtml += '<optgroup label="'+result[i].pname+'">';
	 	        	var arr = result[i].rname.split(',');
	 	        	for(var j=0;j<arr.length;j++){
	 	        		addHtml += '<option>'+arr[j]+'</option>';
	 	        	}
	 	        	addHtml += '</optgroup>';
	 	        	$(".option_box.option_copy .m_select").append(addHtml);
	 	         }
	 	        $(".option_box.option_copy .m_select").selectpicker();
	    	};
	 	     fn_ajax("/ai/project/projectReportList.do", params);
	   }
})();
</script>