<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="mg_popup active">
	<div class="popup_wrap popup_welcome">
		<section class="popup_header">
			<h2>Start with <strong>smart AI !</strong></h2>
		</section>
		
		<section class="popup_body">
			<div class="popup_container">
				<p class="tac">
					Welcome to your first visit!<br>
					Make your first work width smart AI
				</p>
				
				<ul class="create_wrap">
					<li>
						<h3>Create New Workflow</h3>
						<p>Create a workflow file <br>after creating a new project</p>						
						<a class="newProject">Create New Project !</a>
					</li>					
					<li>
						<h3>Need More Tutorial?</h3>
						<p>Please check <br>the detailed manual</p>						
						<a class="tutorial">Go Tutorial !</a>
					</li>
				</ul>
	
				<p class="tar">Tutorials always available in the help > tutorials</p>
				
				<div class="tar">
					<div class="m_check">
						<input type="checkbox" id="again">
						<label for="again">Naver see again</label>
					</div>
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
    	$(".newProject").click(function(){
    		var opts = {};
    		var params = {};
    		opts["width"] = 400;
    	    params["name"] = "CreateProject"; 
    	    params["viewName"] = "/ai/project/popup/CreateProject";
    		fn_layerPopup("/ai/project/popup/layerOpen.do", params, opts);
    		
    	})
    	
        $(".tutorial").click(function(){
    		var opts = {};
    		var params = {};
    		opts["width"] = 400;
    	    params["name"] = "Tutorial"; 
    	    params["viewName"] = "/ai/project/popup/Tutorial";
    		fn_layerPopup("/ai/project/popup/layerOpen.do", params, opts);
    		
    	})
    }
})();
</script>