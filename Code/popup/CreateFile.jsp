<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="mg_popup active">
	<div class="popup_wrap popup_createFile">
		<section class="popup_header">
			<h2>Create File</h2>
		</section>
		
		<section class="popup_body">
			<div class="popup_container">
				<ul class="mg_wizard">
					<li class="active"><a url="#">Select work type</a></li>
					<li><a url="#">Enter information</a></li>
				</ul>

				<div class="wizard_content">
					<ul class="create_wrap">
						<li>
							<a url="#">
								<h3>Workflow</h3>
								<p>You can design AI Models <br>using engines and components</p>						
							</a>
						</li>					
						<li>
							<a url="#">
								<h3>Report</h3>
								<p>You can create report <br>using workflow result data</p>						
							</a>								
						</li>
					</ul>
					
<!-- 					<div class="tar">
						<button class="btn_text">Continue ></button>
					</div> -->
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
    $(document).ready(function () {
        fn_initSetting();
        fn_setEvents();
        
    });
    
 	// initSetting
    function fn_initSetting() {
    	    	
    }
    
    // 이벤트 설정
    function fn_setEvents() {
    	
     	$("#btn_close").on("click",function(){
	   		fn_layerPopupClose();
	   	});	
     	
    	$(".tab_wizard_wrap .tab_list").click(function (){
        	$(".tab_wizard_wrap .tab_list").removeClass("on");
        	$(".tab_wizard_wrap .tab_content").removeClass("on");
        	$(this).addClass("on");
        	$("#" + $(this).data("id")).addClass("on"); 
        });    	
    	
		/* 워크플로우 생성 */
		$(".create_wrap > li:eq(0)").click(function(){
			fn_createWorkflow("I");
		});
		
		/* 리포트 생성 */
		$(".create_wrap > li:eq(1)").click(function(){
			fn_createReport("I");
		});
		
    }
    
    //워크플로우 생성
  	function fn_createWorkflow(crudMode) {
		var opts = {};
		var params = {};
		opts["width"] = 400;
	    params["name"] = "CreateWorkflow"; 
	    params["viewName"] = "/ai/project/popup/CreateWorkflow";
	    params["crudMode"] = crudMode;
	    params["pid"]= "${pid}";
		fn_layerPopup("/ai/project/popup/layerOpen.do", params, opts);
	}
    
    //리포트 생성
  	function fn_createReport(crudMode) {
		var opts = {};
		var params = {};
		opts["width"] = 400;
	    params["name"] = "CreateReport"; 
	    params["viewName"] = "/ai/project/popup/CreateReport";
	    params["crudMode"] = crudMode;
	    params["pid"]= "${pid}";
		fn_layerPopup("/ai/project/popup/layerOpen.do", params, opts);
	}
})();
</script>