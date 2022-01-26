<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="mg_contents">
	<!-- start : 좌측 현황판 
	<div class="side_state state_project">
		<h2>Project</h2>
		<dl>
			<dt>
				Shared List
				<span>List of recently shared work files.</span>
			</dt>
			<dd>
				<div class="item">
					<div class="date">02.Oct.2021</div>
					<strong class="title">2.8.3 실시간 시계열 데이터 처리하기 2.8.3 실시간 시계열 데이터 처리하기 2.8.3 실시간 시계열 데이터 처리하기 2.8.3 실시간 시계열 데이터 처리하기 2.8.3 실시간 시계열 데이터 처리하기 </strong>
					<div class="brief">강남 교통 예측 데이터 실시간 처리 Workflow XXXX XXXX XXXX XXXXX XXXX 강남 교통 예측 데이터 실시간 처리 Workflow XXXX XXXX XXXX XXXXX XXXX 강남 교통 예측 데이터 실시간 처리 Workflow XXXX XXXX XXXX XXXXX XXXX </div>
					<ul class="info">
						<li>Provider</li>
						<li>이영희</li>
					</ul>
					<div class="m_switch">
						<input type="checkbox" id="switch1" checked>
						<label for="switch1"></label>
					</div>
				</div>
				<div class="item">
					<div class="date">02.Oct.2021</div>
					<strong class="title">2.8.3 실시간 시계열 데이터 처리하기 2.8.3 실시간 시계열 데이터 처리하기 2.8.3 실시간 시계열 데이터 처리하기 2.8.3 실시간 시계열 데이터 처리하기 2.8.3 실시간 시계열 데이터 처리하기 </strong>
					<div class="brief">강남 교통 예측 데이터 실시간 처리 Workflow XXXX XXXX XXXX XXXXX XXXX 강남 교통 예측 데이터 실시간 처리 Workflow XXXX XXXX XXXX XXXXX XXXX 강남 교통 예측 데이터 실시간 처리 Workflow XXXX XXXX XXXX XXXXX XXXX </div>
					<ul class="info">
						<li>Provider</li>
						<li>이영희</li>
					</ul>
					<div class="m_switch">
						<input type="checkbox" id="switch2">
						<label for="switch2"></label>
					</div>
				</div>
				<div class="item">
					<div class="date">02.Oct.2021</div>
					<strong class="title">2.8.3 실시간 시계열 데이터 처리하기 2.8.3 실시간 시계열 데이터 처리하기 2.8.3 실시간 시계열 데이터 처리하기 2.8.3 실시간 시계열 데이터 처리하기 2.8.3 실시간 시계열 데이터 처리하기 </strong>
					<div class="brief">강남 교통 예측 데이터 실시간 처리 Workflow XXXX XXXX XXXX XXXXX XXXX 강남 교통 예측 데이터 실시간 처리 Workflow XXXX XXXX XXXX XXXXX XXXX 강남 교통 예측 데이터 실시간 처리 Workflow XXXX XXXX XXXX XXXXX XXXX </div>
					<ul class="info">
						<li>Provider</li>
						<li>이영희</li>
					</ul>
					<div class="m_switch">
						<input type="checkbox" id="switch3" checked>
						<label for="switch3"></label>
					</div>
				</div>
			</dd>
		</dl>
		<button id="close_side" class="icon_btn icon_close_side">닫기</button>
	</div>
	end : 좌측 현황판 -->
	
	<!-- start : 상단 현황판 -->
	<div class="top_state state_project">
		<div class="col_left">
			<strong>Project</strong>
			<div class="project_view">
				<button class="btn_card tooltip_basic active" data-toggle="tooltip" data-placement="top" title="" data-original-title="You can change the project card type.">Card Type</button>
				<button class="btn_list tooltip_basic" data-toggle="tooltip" data-placement="top" title="" data-original-title="You can change the project list type.">List Type</button>
			</div>
		</div>
		<div class="col_center">
			<div class="mg_title">
				<h5>Project Status</h5>
				<span>Check the current workflow status on a project basis.</span>
			</div>
			<ul class="status_list">
				<li class="all">
					<div class="item">
						<label>All</label>
						<strong id="All" class='animated wiggle'>0</strong>
					</div>
				</li>
				<li class="completed">
					<div class="item">
						<label>Successed</label>
						<strong id="Successed" >0</strong>
					</div>
				</li>
				<li class="failed">
					<div class="item">
						<label>Failed</label>
						<strong id="Failed">0</strong>
					</div>
				</li>
			</ul>
		</div>
		<div class="col_right">
			<div class="mg_title">
				<h5>My History</h5>
				<span>Check out the last 3 work files.</span>
			</div>
			<ul class="history_list">
				<li>
					<a id="history1">
						<strong class="category"></strong>
						<span class="text"></span>
						<span class="time"></span>
					</a>
				</li>
				<li>
					<a id="history2">
						<strong class="category"></strong>
						<span class="text"></span>
						<span class="time"></span>
					</a>
				</li>
				<li>
					<a id="history3">
						<strong class="category"></strong>
						<span class="text"></span>
						<span class="time"></span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- end : 상단 현황판 -->
	
	<!-- start : 하단 현황판 -->
	<div class="mg_tab tab_project">
		<ul class="tab_bar">
			<li><a url="#myProject" class="active" id="tabMyProject">My Project</a></li>
			<li><a url="#sharedFiles" id="tabSharedFile">Shared File</a></li>
		</ul>
		
		
		<!-- start : 프로젝트 중심-->
		<div id="myProject" class="tab_content project_content active">
			<!-- start : my project -->
			<div class="group_search">
				<div class="recently_keywords">
					<label>Recently search keywords : </label>
				</div>				
				<div class="mg_search">
					<select class="m_select">
						<option>ALL</option>
						<option>Project</option>
						<option>Workflow</option>
						<option>Report</option>
					</select>
					<input type="search" class="m_search">
					<button class="icon_btn icon_search">검색</button>
				</div>
				<button class="btn_searchTag">Search Tag</button>
			</div>
			
			<ul class="mg_ctrl">
				<li style="font-size: 20px;">
					<strong>Total : </strong>
					<strong id = "totalcnt">0</strong>
				</li>
				<li>
					<!-- start : tag 검색했을 경우 -->
					<div class="search_total">
						<strong>Search Tags : (0)</strong>
					
					</div>					
					<div class="selected_keywords">
					</div>
					<!-- end : tag 검색했을 경우 -->
					
<!-- 					start : keyword 검색했을 경우
					<div class="search_total">
						<label>Search Keywords</label>
						<strong>교통 (6)</strong>
					</div>
					end : keyword 검색했을 경우 -->
					
					<div class="select_sort">
						<select class="m_select">
							<option>timestamp</option>
							<option>name</option>
						</select>
						<button class="icon_btn icon_sort">정렬</button>
					</div>
				</li>
			</ul>
			
			<ul class="project_list">
				<li>
					<div class="project_item new">
						<button id="project_new" class="project_new">Create New Project</button>
					</div>
				</li>
			</ul>
		</div>
		<!-- end : 프로젝트 중심 -->
		
		<!-- start :
		 작업목록 중심-->
		<div id="myProject" class="tab_content project_content type_row">
			<!-- start : my project -->
			<div class="group_search">
				<div class="recently_keywords">
					<label>Recently search keywords : </label>
				</div>				
				<div class="mg_search">
					<select class="m_select">
						<option>ALL</option>
						<option>Project</option>
						<option>Workflow</option>
						<option>Report</option>
					</select>
					<input type="search" class="m_search">
					<button class="icon_btn icon_search">검색</button>
				</div>
				<button class="btn_searchTag">Search Tag</button>
			</div>
			
			<ul class="mg_ctrl">
				<li>
					<!-- start : keyword 검색했을 경우 -->
					<div class="toggle_all">
						<button class="btn_allOpen tooltip_basic" data-toggle="tooltip" data-placement="top" title="Expand">Expand</button>
						<button class="btn_allClose tooltip_basic" data-toggle="tooltip" data-placement="top" title="Collapse">Collapse</button>
					</div>
					<!-- end : keyword 검색했을 경우 -->
				</li>
				<li>
					<!-- start : tag 검색했을 경우 -->
					<div class="search_total">
						<strong>Search Tags : (0)</strong>
						
					</div>					
					<div class="selected_keywords">
					</div>
					<!-- end : tag 검색했을 경우 -->
					
					<!-- start : keyword 검색했을 경우 
					<div class="search_total">
						<label>Search Keywords</label>
						<strong>교통 (6)</strong>
					</div>
					 end : keyword 검색했을 경우 -->
					
					<div class="select_sort">
						<select class="m_select">
							<option>timestamp</option>
							<option>name</option>
						</select>
						<button class="icon_btn icon_sort">정렬</button>
					</div>
				</li>
			</ul>
			
			<ul class="project_list">
				<li>
					<div class="project_item new">
						<button id="project_new" class="project_new">Create New Project</button>
					</div>
				</li>
			</ul>
		</div>
		<!-- end : 작업목록 중심 -->
		
		<!-- start :
		 Shared File-->
		<div class="tab_content project_content">
			<!-- start : shared file -->
			<div class="group_search">
				<div class="mg_search">
					<select class="m_select">
						<option>ALL</option>
						<option>Project</option>
						<option>Workflow</option>
						<option>Report</option>
					</select>
					<input type="search" class="m_search">
					<button class="icon_btn icon_search">검색</button>
				</div>
			</div>
			
			<ul class="mg_ctrl">
				<li>
					<div class="select_category">
						<div class="m_radio">
							<input type="radio" name="chk_category" id="chk_category1" checked>
							<label for="chk_category1">ALL</label>
						</div>
						<div class="m_radio">
							<input type="radio" name="chk_category" id="chk_category2">
							<label for="chk_category2">Workflow</label>
						</div>
						<div class="m_radio">
							<input type="radio" name="chk_category" id="chk_category3">
							<label for="chk_category3">Report</label>
						</div>
					</div>
				</li>
				<li>
					<!-- start : keyword 검색했을 경우 보여짐
					<div class="search_total">
						<label>Search keywords</label>
						<strong>교통 (6)</strong>
					</div>
					end : keyword 검색했을 경우 보여짐 -->					
					<div class="select_sort">
						<select class="m_select">
							<option>timestamp</option>
							<option>name</option>
						</select>
						<button class="icon_btn icon_sort">정렬</button>
					</div>
				</li>
			</ul>
			
			<ul class="project_list shared">
				<li>
					<div class="project_item">
						<span class="item_category">Workflow</span>
						<strong class="item_title">2021.05 테스트 현황 2021.05 테스트 현황 2021.05 테스트 현황 2021.05 테스트 현황 2021.05 테스트 현황 2021.05 테스트 현황 </strong>
						<div class="item_brief">배치 결과 리포트입니다.배치 결과 리포트입니다.배치 결과 리포트입니다.배치 결과 리포트입니다.배치 결과 리포트입니다.배치 결과 리포트입니다.배치 결과 리포트입니다.배치 결과 리포트입니다.배치 결과 리포트입니다.배치 결과 리포트입니다.배치 결과 리포트입니다.배치 결과 리포트입니다.</div>
							
						<div class="item_info">
							<span>shared</span>
							<span>2021/06/01</span>
							<span>23:56</span>
							<span class="share_by">xxx</span>
						</div>
	
						<div class="item_option">
							<button class="icon_btn icon_search"></button>
							<button class="icon_btn icon_delete"></button>
							<button class="icon_btn icon_copy"></button>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<!-- end : Shared File -->
	</div>
	<!-- end : 하단 현황판 -->
</div>



<!--
/////////// 스크립트/////////////
 -->

<script>
g_cttPage = (function() {
	//전역 변수 초기화
	var chk = true;
  	var project = 0;
  	var srhTag = "timestamp";
  	var reverse = true;
  	var user_id = "";
  	var srhSelect = '';
  	var sortSelect = '';
    $(document).ready(function () {
        fn_initSetting();
        fn_setEvents();
        fn_initProjectSetting();
        fn_myHistory();
        fn_setStatus();
    });
    
 	// initSetting
    function fn_initSetting() {
    	$(".tooltip_icon, .tooltip_basic").tooltip();    	
    	
    	$("#tooltip_status").tooltip({
    		placement: 'bottom',
    		html:true,
    		title:$("#tooltip_status_html")[0]
    	});
 		
    	/* select */
		$(".m_select").selectpicker();
    	

    }
    
    // 이벤트 설정
    function fn_setEvents() {
    	
     	//프로젝트 제목을 클릭했을 경우 
    	$(".project_list").on("click", ".item_title", function() {
     		var project_item = $(this).parent().parent(); //감싸는 list 이것만 active하면 열림
    		var project_item_list = $(this).parent().siblings(".sub_list"); //워크플로우리스트랑 리포트 리스트 둘다
    		if(project_item.hasClass("active")==true){
    			project_item.toggleClass("active");
        		project_item_list.toggleClass("active"); 
        		$(".project_list .item_btn > button").removeClass("active");
    		}else{
    			project_item.toggleClass("active");
        		project_item_list.toggleClass("active"); 
       			 project_item.animate({
       				height:602
       			}, 200, function(){
       				project_item.removeAttr('style').addClass("active")
       				project_item_list.addClass("active");   				
       			}); 
       			 
       		
       			var params = {};
       	    	params["pid"] = $(this).parent().attr("uuid");
       	    	var pid = $(this).parent().attr("uuid");
       	    	params['noLoading'] = 'Y';
       	    	
       	    	params['fn_success'] = (function(data,params){
       	    		var result = data.result;
       	    		$(".sub_list ul").empty();
       	    		$.each(result, function(idx) {
       	    			$(".flow_list.sub_list ul").append(fn_getWorkflowCardHtml(result[idx]));
       	    		});
       	    		var params = {};
           	    	params["pid"] = pid;
           	    	params['noLoading'] = 'Y';
           	    	params['fn_success'] = (function(data,params){
           	    		var result2 = data.result2;
           	    		$.each(result2, function(idx) {
           	    			$(".flow_list.sub_list ul").append(fn_getReportCardHtml(result2[idx]));
           	    		});
           	    	});
           	    	fn_ajax("/ai/project/selectReportList.do", params);
       	    	});
       	    	fn_ajax("/ai/project/selectWorkflowList.do", params);
    	
       			//$(".project_list > li").removeClass("active"); //모든 다른 리스트 active ㅇ벗앰
       			$(".project_list .item_btn > button").removeClass("active"); //워크플로우, 리포트 버튼 active 제거
    		}
    	}); 
    	
    	//확장버튼을 클릭했을 경우 
    	$(".toggle_all").on("click", ".btn_allOpen", function() {
    		$(".toggle_all > button").removeClass("active");
    		$(this).addClass("active");
    		$(".project_list > li").addClass("active");
    		$(".sub_list").addClass("active");
    	});
    	
    	//축소버튼을 클릭했을 경우 
    	$(".toggle_all").on("click", ".btn_allClose", function() {
    		$(".toggle_all > button").removeClass("active");
    		$(this).addClass("active");
    		$(".project_list > li").removeClass("active");
    		$(".sub_list").removeClass("active");
    	});
    	
    	//좌측 현황판 닫기 
    	$("#close_side").click(function(){
    		$(this).closest(".side_state").addClass("inactive");
    	});
    	
     	//My History 클릭
    	$("#history1").click(function(){
			var params = {};
 			if($(this).data("info").check=='workflow'){
				params['uuid']= $(this).data("info").id;
				params['projectId'] = $(this).data("info").pid;
				fn_menuLink("/ai/workflow/saveWorkflow.do", params);
			}else{
				params['reportSeq'] = $(this).data("info").id;
				params['projectId'] = $(this).data("info").pid;
				fn_menuLink("/ai/report/saveReport.do", params);
			}  	
    	});
    	$("#history2").click(function(){
			var params = {};
 			if($(this).data("info").check=='workflow'){
				params['uuid']= $(this).data("info").id;
				params['projectId'] = $(this).data("info").pid;
				fn_menuLink("/ai/workflow/saveWorkflow.do", params);
			}else{
				params['reportSeq'] = $(this).data("info").id;
				params['projectId'] = $(this).data("info").pid;
				fn_menuLink("/ai/report/saveReport.do", params);
			}  
    	});
    	$("#history3").click(function(){
			var params = {};
 			if($(this).data("info").check=='workflow'){
				params['uuid']= $(this).data("info").id;
				params['projectId'] = $(this).data("info").pid;
				fn_menuLink("/ai/workflow/saveWorkflow.do", params);
			}else{
				params['reportSeq'] = $(this).data("info").id;
				params['projectId'] = $(this).data("info").pid;
				fn_menuLink("/ai/report/saveReport.do", params);
			}  
    	}); 

    	//카드<-->리스트 전환
    	$(".btn_card").click(function(){
    		fn_cardClick();
    	})		    	
		 $(".btn_list").click(function(){
	    	fn_listClick();
		})    	
    	
     	//My Project<-->Shared File 전환
    	$("#tabMyProject").click(function(){
    		fn_mpClick();	
    	});
    	$("#tabSharedFile").click(function(){
    		fn_sfClick();
    	});
    	
    	// workflow 버튼을 클릭했을 경우 
    	$(".project_list").on("click", ".btn_workflow" , function() {
    		var project_item = $(this).parent().parent().parent();
    		var project_item_list;
   			$(".project_list > li").removeClass("active");
   			$(".project_list .item_btn > button").removeClass("active");
   			$(".project_list > li .flow_list").removeClass("active");
   			$(".project_list > li .report_list").removeClass("active");		
   			project_item_list = $(this).hasClass("btn_workflow") ? project_item.find(".flow_list") : project_item.find(".report_list");
   			project_item.removeClass("active");
   			$(this).addClass("active");
   			project_item.animate({
   				height:602
   			}, 200, function(){
   				project_item.removeAttr('style').addClass("active")
   				project_item_list.addClass("active");   				
   			});

   	    	var params = {};
   	    	params["pid"] = $(this).parent().parent().attr("uuid");
   	    	params['noLoading'] = 'Y';
   	    	params['fn_success'] = (function(data,params){
   	    		var result = data.result;
   	    		$(".flow_list ul").empty();
   	    		$.each(result, function(idx) {
   	    			$(".flow_list ul").append(fn_getWorkflowCardHtml(result[idx]));
   	    		});
   	    	});
   	    	
   	    	fn_ajax("/ai/project/selectWorkflowList.do", params);
    	});
    	
    	// report 버튼을 클릭했을 경우 
    	$(".project_list").on("click", ".btn_report", function() {
    		var project_item = $(this).parent().parent().parent();
    		var project_item_list;
   			$(".project_list > li").removeClass("active");
   			$(".project_list .item_btn > button").removeClass("active");
   			$(".project_list > li .flow_list").removeClass("active");
   			$(".project_list > li .report_list").removeClass("active");
   			
   			project_item_list = $(this).hasClass("btn_workflow") ? project_item.find(".flow_list") : project_item.find(".report_list");
   			project_item.removeClass("active");
   			
   			$(this).addClass("active");
   			project_item.animate({
   				height:602
   			}, 200, function(){
   				project_item.removeAttr('style').addClass("active")
   				project_item_list.addClass("active");   				
   			});
   			var params = {};
   	    	params["pid"] = $(this).parent().parent().attr("uuid");
   	    	params['noLoading'] = 'Y';
   	    	params['fn_success'] = (function(data,params){
   	    		var result2 = data.result2;
   	    		$(".report_list ul").empty();
   	    		$.each(result2, function(idx) {
   	    			$(".report_list ul").append(fn_getReportCardHtml(result2[idx]));
   	    		});
   	    	});
   	    	
   	    	fn_ajax("/ai/project/selectReportList.do", params);
    	});
    	
    	//검색 버튼 클릭
    	$(".icon_search").click(function(){
			fn_recentSrh();
    		fn_search();
    	});
    	
    	//최근 검색 키워드 클릭
    	$(".recently_keywords").on("click","a",function(){
    		$(".m_search").val($(this).text());
    		fn_search();
    	})
    	
    	//정렬 옵션 선택
    	$(".select_sort select.m_select").on('changed.bs.select',function(){
    		srhTag = $(this).siblings(".btn.dropdown-toggle").attr("title");
    		fn_search();
     	})
     	
     	//정렬 버튼 클릭
     	$(".icon_sort").on('click', function(){
     		if(reverse==true){
     			reverse = false;
     		}else{
     			reverse = true;
     		}
     		fn_search();
     	})


    	/* search tag 클릭 */
		$(".btn_searchTag").click(function(){
			var opts = {};
			var params = {};
			opts["width"] = 1000;

			fn_layerPopup("/ai/project/popup/SearchTags.do", params, opts);
		});
    	
		/* 프로젝트 생성버튼 클릭 */
		$(".project_new").click(function(){
			fn_createProject("I");
			
		});
    	
		/* 프로젝트 수정 */
		$(".project_list").on("click", ".project_item .icon_edit", function(){
			var tags1 = $(this).parent().siblings(".item_tag_list").text();
			var tags2 = tags1.replace(/\t/gi,"");
			var tags = tags2.replace("#","");
 			fn_editProject("U",$(this).parents(".project_item").attr("uuid"),tags);
 			
		});
		
		/* 프로젝트 삭제 */
		$(".project_list").on("click", ".project_item .icon_delete",function(){
			fn_deleteProject("D",$(this).parents(".project_item").attr("uuid"));
		});
		
		/* 작업 파일 생성 */
		$(".project_list").on("click",".project_item .icon_add",function(){
			var opts = {};
			var params = {};
			//여기서 pid는 제대로 나옴
			params['pid'] = $(this).parent().parent().attr("uuid");
			opts["width"] = 400;
			fn_layerPopup("/ai/project/popup/CreateFile.do", params, opts);
		});
		
		/* 워크플로우 수정 화면 진입*/
		$(".project_list").on("click",".flow_list .sub_item .icon_detail",function(){
			var params = {};
			params['uuid'] = $(this).parents(".sub_item").attr("uuid");
			params['projectId'] = $(this).parents(".sub_item").parents("li.active").children(".project_item").attr("uuid");
			fn_menuLink("/ai/workflow/saveWorkflow.do", params);
		});		
		
		/* 워크플로우 수정 */
		$(".project_list").on("click",".flow_list .sub_item .icon_edit",function(){
			fn_editWorkflow("U",$(this).parents(".sub_item").attr("uuid"));
		});
		
		/* 워크플로우 삭제 */
		$(".project_list").on("click",".flow_list .sub_item .icon_delete",function(){
			fn_deleteWorkflow("D",$(this).parents(".sub_item").attr("uuid"));
		});
		
		/* 워크플로우 복사 */
		$(".project_list").on("click",".flow_list .sub_item .icon_copy",function(){
			fn_copyWorkflow($(this).parents(".sub_item").attr("uuid"));
		});
		
		/* 레포트 수정 */
		$(".project_list").on("click",".report_list .sub_item .icon_edit",function(){
			fn_editReport("U",$(this).parents(".sub_item").attr("report_seq"));
		});
		
		/* 래포트 삭제 */
		$(".project_list").on("click",".report_list .sub_item .icon_delete",function(){
			fn_deleteReport("D",$(this).parents(".sub_item").attr("report_seq"));
		});
				
		/* 리포트 복사 */
		$(".project_list").on("click",".report_list .sub_item .icon_copy",function(){
			fn_copyReport($(this).parents(".sub_item").attr("report_seq"));
		});
		
		/* 리포트 수정 화면 진입*/
		$(".project_list").on("click",".report_list .sub_item .icon_detail",function(){
			var params = {};
			params['reportSeq'] = $(this).parents(".sub_item").attr("report_seq");
			params['projectId'] = $(this).parents(".sub_item").parents("li.active").children(".project_item").attr("uuid");
			fn_menuLink("/ai/report/saveReport.do", params);
		});
		
		
		
		/* 워크플로우 공유 */
		$(".project_list").on("click",".flow_list .sub_item .icon_share",function(){
			fn_sharePopup('workflow', $(this).parents(".sub_item").attr("uuid"));
		});
    }
    
    
    //마이 히스토리 세팅
    function fn_myHistory(){

    	var params = {};
    	params['fn_success'] = (function(data,params){
    		
    		var result = data.result;
    		for(var i=1;i<result.length+1;i++){
        		$("#history"+i+" .category").html(result[i-1].check);
        		$("#history"+i+" .text").html(result[i-1].name);
        		$("#history"+i+" .time").html(fn_timeBefore(result[i-1].timestamp));
        		$("#history"+i+"").data("info",{"id":result[i-1].id , "pid":result[i-1].pid, "check":result[i-1].check});
    		}
    	});
    	
    	fn_ajax("/ai/project/myHistory3.do", params);
    };
    
    //n분전, n시간전 나타내기
     function fn_timeBefore(value) {
        const today = new Date();
        const timeValue = new Date(value);
        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
        
        if (betweenTime < 1) return 'just before';
        
        if (betweenTime < 60) {
            return betweenTime+'m ago';
        }

        const betweenTimeHour = Math.floor(betweenTime / 60);
        if (betweenTimeHour < 24) {
            return betweenTimeHour+'h ago';
        } 

        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
        if (betweenTimeDay < 365) {
            return betweenTimeDay+'d ago';
        }

        return Math.floor(betweenTimeDay / 365)+'y ago';
 	} 
  
    //프로젝트 초기 세팅
    function fn_initProjectSetting() {
    	fn_setProjectList();


    } 
  	//프로젝트 리스트 동적 추가
    function fn_setProjectList() {
    	var params = {};
    	params['noLoading'] = 'Y';
    	params['input'] = $(".m_search").val();
    	//params['check'] = $(".tab_content.project_content.active .mg_search .m_select").selectpicker('val');
    	params['check'] = $(".mg_search select.m_select").siblings(".btn.dropdown-toggle").attr("title");
    	params['srhTag'] = srhTag;
    	params['reverse'] = reverse;
    	params["fn_success"] = (function(data, params) {
    		project = 0;
    		var result = data.result;
    		var result2 = data.result2;
    		user_id = result2.user_id;
    		$.each(result, function(idx) {
    			$("#myProject ul.project_list").append(fn_getProjectCardHtml(result[idx]));
    			project++;
    		});
     		$("#totalcnt").html(project);
       		for(var i=0;i<$(".selected_keywords span").length;i++){
    			$("[name=" +$(".selected_keywords span").eq(i).text()+ "]").addClass("match_tag");
       		}
       		if(localStorage.getItem(user_id)==null){
	       		localStorage.setItem(user_id,['none'].join());
	       		var arr2 = localStorage.getItem(user_id).split(',');
	       		$(".recently_keywords").append('<a url="#">'+ arr2[0] +'</a>');
       		}else{
	        	var arr2 = localStorage.getItem(user_id).split(',');
	        	$(".recently_keywords a").remove();
	        	$.each(arr2, function(idx){
	        		$(".recently_keywords").append('<a url="#">'+ arr2[idx] +'</a>');
	        	})	
       		}
        	if($("#totalcnt").text()=='0'){
        		var opts = {};
        		var params = {};
        		opts["width"] = 400;
        	    params["viewName"] = "/ai/project/popup/Welcome";
        		fn_layerPopup("/ai/project/popup/layerOpen.do", params, opts);
        	}
    	});
    	fn_ajax("/ai/project/selectProjectList.do", params);
    };
    

    
    //프로젝트 리스트 카드 생성
    function fn_getProjectCardHtml(projectInfo) {	
    	var timestamp = fn_formatDate(projectInfo.timestamp);
    	var projectCardHtml  = '<li>';
		projectCardHtml += '<div class="project_item" name="'+ projectInfo.name +'"  uuid="'+ projectInfo.uuid +'">';						
		projectCardHtml += '	<strong class="item_title">'+ projectInfo.name +'</strong>';
		projectCardHtml += '	<div class="item_brief">'+ projectInfo.descr +'</div>';
		projectCardHtml += '	<ul class="item_tag_list">';
		var tags = projectInfo.tags;
		var tag = tags.split(',');
		for(var i=0; i<tag.length;i++){
			if(tag==''){break;}
			projectCardHtml += '		<li name='+ tag[i] +'>#'+ tag[i] +'</li>';
		}
		projectCardHtml += '	</ul>';
		projectCardHtml += '	<div class="item_info">';
		projectCardHtml += '		<span>created</span>';
		projectCardHtml += '		<span>'+ timestamp +'</span>';
		projectCardHtml += '	</div>';
		projectCardHtml += '	<div class="item_btn">';
		projectCardHtml += '		<button class="btn_workflow"><span>'+ projectInfo.flowcount +'</span>Workflow</button>';
		projectCardHtml += '		<button class="btn_report"><span>'+ projectInfo.rptcount +'</span>Report</button>';
		projectCardHtml += '	</div>';
		projectCardHtml += '	<div class="item_option">';
		projectCardHtml += '		<button class="icon_btn icon_edit"></button>';
		projectCardHtml += '		<button class="icon_btn icon_delete"></button>';
		projectCardHtml += '		<button class="icon_btn icon_add"></button>';
		projectCardHtml += '	</div>';
		projectCardHtml += '</div>';
		projectCardHtml += '<div class="flow_list sub_list">';
		projectCardHtml += '	<ul>';
		projectCardHtml += '	</ul>';
		projectCardHtml += '</div>';
		projectCardHtml += '<div class="report_list sub_list">';
		projectCardHtml += '	<ul>';
		projectCardHtml += '	</ul>';
		projectCardHtml += '</div>';
		projectCardHtml += '</li>';
	
		return projectCardHtml;
    };

  	//워크플로우 리스트 카드 생성
    function fn_getWorkflowCardHtml(workflowInfo) {
    	var timestamp = fn_formatDate(workflowInfo.timestamp);
    	var workflowCardHtml = '';
    	workflowCardHtml += '		<li>';
    	workflowCardHtml += '			<div class="sub_item" name="'+ workflowInfo.name +'" uuid="'+ workflowInfo.uuid +'">';
    	workflowCardHtml += '				<span class="item_category">Workflow</span>';
    	workflowCardHtml += '				<strong class="item_title">'+ workflowInfo.name +'</strong>';
    	workflowCardHtml += '				<div class="item_brief">'+ workflowInfo.descr +'</div>';								
    	workflowCardHtml += '				<div class="item_state">';
    	 switch(workflowInfo.status){
    	case 'failed':
    		workflowCardHtml += '					<span class="state_failed">Failed</span>';
    		break;
    	case 'progressing':
    		workflowCardHtml += '					<span class="state_progressing">Progressing</span>';
    		break;
    	case 'completed':
    		workflowCardHtml += '					<span class="state_completed">Completed</span>';
    		break;
    	case '':
    		break;
    	} 
    	workflowCardHtml += '				</div>';										
    	workflowCardHtml += '				<div class="item_info">';
		workflowCardHtml += '					<span>updated</span>';
		workflowCardHtml += '					<span>'+ timestamp +'</span>';
		workflowCardHtml += '					<span class="share_cnt">3</span>';
		workflowCardHtml += '				</div>';		
		workflowCardHtml += '				<div class="item_option">';
		workflowCardHtml += '					<button class="icon_btn icon_detail"></button>';
		workflowCardHtml += '					<button class="icon_btn icon_edit"></button>';
		workflowCardHtml += '					<button class="icon_btn icon_delete"></button>';
		workflowCardHtml += '					<button class="icon_btn icon_copy"></button>';
		workflowCardHtml += '					<button class="icon_btn icon_share"></button>';
		workflowCardHtml += '				</div>';
		workflowCardHtml += '			</div>';
		workflowCardHtml += '		</li>';		
		
		/* $("<button class="icon_btn icon_share"></button>").append()
		var $obj = $("<button class="icon_btn icon_share"></button>");
		return $obj; */
		return workflowCardHtml;
    }
  	
  	//리포트 리스트 카드 생성
    function fn_getReportCardHtml(reportInfo){
    	var reportCardHtml = '';
    	reportCardHtml += '		<li>';
    	reportCardHtml += '			<div class="sub_item" title="'+ reportInfo.title +'" report_seq="'+ reportInfo.report_seq +'">';
    	reportCardHtml += '				<span class="item_category">Report</span>';
    	reportCardHtml += '				<strong class="item_title">'+ reportInfo.title +'</strong>';
    	reportCardHtml += '				<div class="item_brief">'+ reportInfo.description +'</div>';									
    	reportCardHtml += '				<div class="item_info">';
    	reportCardHtml += '					<span>updated</span>';
    	reportCardHtml += '					<span>'+ reportInfo.reg_dt +'</span>';
    	reportCardHtml += '					<span class="share_cnt">3</span>';
    	reportCardHtml += '				</div>';	
    	reportCardHtml += '				<div class="item_option">';
    	reportCardHtml += '					<button class="icon_btn icon_detail"></button>';
    	reportCardHtml += '					<button class="icon_btn icon_edit"></button>';
    	reportCardHtml += '					<button class="icon_btn icon_delete"></button>';
    	reportCardHtml += '					<button class="icon_btn icon_copy"></button>';
    	reportCardHtml += '					<button class="icon_btn icon_share"></button>';
    	reportCardHtml += '				</div>';
    	reportCardHtml += '			</div>';
    	reportCardHtml += '		</li>';
    	
    	return reportCardHtml;
    }
  	
    //타임스탬프 형식 변환
    function fn_formatDate(timestamp) {
    	var date = new Date(timestamp);
    	
    	return(date.getFullYear()+
    	       "/"+(date.getMonth()+1)+
    	       "/"+date.getDate()+
    	       " "+date.getHours()+
    	       ":"+date.getMinutes())
    };
    
    //프로젝트 생성
  	function fn_createProject(crudMode) {
	    var opts = {};
	    opts["width"] = "700"; 
	        
	    var params = {}; 
	    params["name"] = "CreateProject"; 
	    params["viewName"] = "/ai/project/popup/CreateProject";
	    params["crudMode"] = crudMode;
	    fn_layerPopup("/ai/project/popup/layerOpen.do", params, opts);
	}
  	
    //프로젝트 수정
  	function fn_editProject(crudMode, uuid, tags) {
	    var opts = {};
	    opts["width"] = "500"; 
	        
	    var params = {}; 
	    params["name"] = "EditProject";
	    params["uuid"] = uuid;
		params["tags"]= tags;
	    params["viewName"] = "/ai/project/popup/EditProject";
	    params["crudMode"] = crudMode;
	    
	    fn_layerPopup("/ai/project/popup/layerOpen.do", params, opts);
	}
  	
    //프로젝트 삭제
  	function fn_deleteProject(crudMode, pid) {
  		var opts = {};
		var params = {};
		opts["width"] = 400;
	    params["name"] = "DeleteProject";
	    params["pid"] = pid;
	    params["viewName"] = "/ai/project/popup/DeleteProject";
	    params["crudMode"] = crudMode;
	    fn_layerPopup("/ai/project/popup/layerOpen.do", params, opts);
	}
    
    //워크플로우 수정
    function fn_editWorkflow(crudMode, uuid){
    	var opts = {};
		var params = {};
		opts["width"] = 400;
	    params["name"] = "EditWorkflow";
	    params["uuid"] = uuid;
	    params["viewName"] = "/ai/project/popup/EditWorkflow";
	    params["crudMode"] = crudMode;
		fn_layerPopup("/ai/project/popup/layerOpen.do", params, opts);
    }
    
    //워크플로우 삭제
  	function fn_deleteWorkflow(crudMode, wid){
		var opts = {};
		var params = {};
		opts["width"] = 400;
	    params["name"] = "DeleteWorkflow";
	    params["wid"] = wid;
	    params["viewName"] = "/ai/project/popup/DeleteWorkflow";
	    params["crudMode"] = crudMode;
	    
		fn_layerPopup("/ai/project/popup/layerOpen.do", params, opts);
    }
    
    //워크플로우 복사
    function fn_copyWorkflow(wid){
    	var opts = {};
    	var params = {};
		opts["width"] = 400;
	    params["name"] = "CopyWorkflow";
	    params["wid"] = wid;
	    params["viewName"] = "/ai/project/popup/CopyWorkflow";
	    
		fn_layerPopup("/ai/project/popup/layerOpen.do", params, opts);
    }

    //레포트 수정
    function fn_editReport(crudMode, report_seq){
    	var opts = {};
		var params = {};
		opts["width"] = 400;
	    params["title"] = "EditReport";
	    params["report_seq"] = report_seq;
	    params["viewName"] = "/ai/project/popup/EditReport";
	    params["crudMode"] = crudMode;
		fn_layerPopup("/ai/project/popup/layerOpen.do", params, opts);
    }
    
    //레포트 삭제
  	function fn_deleteReport(crudMode, report_seq){
		var opts = {};
		var params = {};
		opts["width"] = 400;
	    params["title"] = "DeleteReport";
	    params["report_seq"] = report_seq;
	    params["viewName"] = "/ai/project/popup/DeleteReport";
	    params["crudMode"] = crudMode;
	    
		fn_layerPopup("/ai/project/popup/layerOpen.do", params, opts);
    }
    
    //리포트 복사
    function fn_copyReport(report_seq){
    	var opts = {};
    	var params = {};
		opts["width"] = 400;
	    params["name"] = "CopyReport";
	    params["report_seq"] = report_seq;
	    params["viewName"] = "/ai/project/popup/CopyReport";
	    
		fn_layerPopup("/ai/project/popup/layerOpen.do", params, opts);
    }
   

    //검색 기능
  	function fn_search(){
  		$(".project_list").children().not(":first").remove();
  		fn_setProjectList();

  	}
    
    //프로젝트 status 나타내기
    function fn_setStatus(){
    	var params = {};
    	params['noLoading'] = 'Y';
    	params["fn_success"] = (function(data, params) {
    		var result = data.result;
    		
    		$({ val : 0 }).animate({ val : result[0] }, {
    	    	  duration: 500,
    	    	  step: function() {
    	    	    var num = numberWithCommas(Math.floor(this.val));
    	    	    $("#All").text(num);
    	    	  },
    	    	  complete: function() {
    	    	    var num = numberWithCommas(Math.floor(this.val));
    	    	    $("#All").text(num);
    	    	  }
    	    	});
    		
    		$({ val : 0 }).animate({ val : result[1] }, {
  	    	  duration: 500,
  	    	  step: function() {
  	    	    var num = numberWithCommas(Math.floor(this.val));
  	    	    $("#Successed").text(num);
  	    	  },
  	    	  complete: function() {
  	    	    var num = numberWithCommas(Math.floor(this.val));
  	    	    $("#Successed").text(num);
  	    	  }
  	    	});
    		
    		$({ val : 0 }).animate({ val : result[2] }, {
  	    	  duration: 500,
  	    	  step: function() {
  	    	    var num = numberWithCommas(Math.floor(this.val));
  	    	    $("#Failed").text(num);
  	    	  },
  	    	  complete: function() {
  	    	    var num = numberWithCommas(Math.floor(this.val));
  	    	    $("#Failed").text(num);
  	    	  }
  	    	});

    	    	function numberWithCommas(x) {
    	    	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	    	}
			
    	});
    	fn_ajax("/ai/project/totalStatus.do", params);
    }
    
    function fn_incrNum(){
    	
    }
	
	
  	// 김태민
  	var user_id = "ktm415"; 		 	// 사용자 아이디
  	var selected_version = "19.06";		// 현재 선택된 msg 버전
	
 	//	워크플로우, 레포트 공유 기능
 	//	params
 	//		* share_type - 'workflow' or 'report' type flag
 	//		* 
 	function fn_sharePopup(share_type, uuid) {
 		var opts = {};
		
		var params = new Map();
	    params["viewName"] = "ai/project/popup/ShareFile";
	    params["version"] = selected_version;
	    params["user_id"] = user_id;
	    params["share_type"] = share_type;
	    params["uuid"] = uuid;
	    
	    fn_layerPopup("/ai/project/popup/layerOpen.do", params, opts);
 	}
    
	
	
  	// 김태민
  	var user_id = "ktm415"; 		 	// 사용자 아이디
  	var selected_version = "19.06";		// 현재 선택된 msg 버전
	
 	//	워크플로우, 레포트 공유 기능
 	//	params
 	//		* share_type - 'workflow' or 'report' type flag
 	//		* 
 	function fn_sharePopup(share_type, uuid) {
 		var opts = {};
		
		var params = new Map();
	    params["viewName"] = "ai/project/popup/ShareFile";
	    params["version"] = selected_version;
	    params["user_id"] = user_id;
	    params["share_type"] = share_type;
	    params["uuid"] = uuid;
	    
	    fn_layerPopup("/ai/project/popup/layerOpen.do", params, opts);
 	}

    //최근 검색 키워드 추가
    function fn_recentSrh(){
		var arr = localStorage.getItem(user_id).split(',');
    	if(arr.length<3){
    		if(arr.includes($(".m_search").val()) || $(".m_search").val()==""){
    		}else{
        		arr.push($(".m_search").val());
    		}
        }else{
    		if(arr.includes($(".m_search").val()) || $(".m_search").val()==""){
    		}else{
            	arr.shift();
            	arr.push($(".m_search").val());	
    		}
        }
			localStorage.setItem(user_id,arr.join());
        	$(".recently_keywords a").remove();
        	$.each(arr, function(idx){
        		$(".recently_keywords").append('<a url="#">'+ arr[idx] +'</a>');
        	})	
       		localStorage.setItem(user_id,arr.join());
    }
    
    function fn_cardClick(){
    	if($("#tabSharedFile").hasClass("active")==false){
			$(".tab_content.project_content:eq(0)").addClass("active");
			$(".tab_content.project_content:eq(1)").removeClass("active");
			$(".tab_content.project_content:eq(2)").removeClass("active");
			$(".btn_list").removeClass("active");
			$(".btn_card").addClass("active");
			$("#tabMyProject").addClass("active");
			$("#tabSharedFile").removeClass("active");
		}else{
			$(".tab_content.project_content:eq(0)").removeClass("active");
			$(".tab_content.project_content:eq(1)").removeClass("active");
			$(".tab_content.project_content:eq(2)").addClass("active");
			$(".btn_list").removeClass("active");
			$(".btn_card").addClass("active");
			$("#tabMyProject").removeClass("active");
			$("#tabSharedFile").addClass("active");
		}
    }
    function fn_listClick(){
    	if($("#tabSharedFile").hasClass("active")==false){
			$(".tab_content.project_content:eq(0)").removeClass("active");
			$(".tab_content.project_content:eq(1)").addClass("active");
			$(".tab_content.project_content:eq(2)").removeClass("active");
			$(".btn_list").addClass("active");
			$(".btn_card").removeClass("active");
			$("#tabMyProject").addClass("active");
			$("#tabSharedFile").removeClass("active");
		}else{
			$(".tab_content.project_content:eq(0)").removeClass("active");
			$(".tab_content.project_content:eq(1)").removeClass("active");
			$(".tab_content.project_content:eq(2)").addClass("active");
			$(".btn_list").addClass("active");
			$(".btn_card").removeClass("active");
			$("#tabMyProject").removeClass("active");
			$("#tabSharedFile").addClass("active");
		}
    }
    function fn_mpClick(){
    	if($(".btn_list").hasClass("active")==false){
			$(".tab_content.project_content:eq(0)").addClass("active");
			$(".tab_content.project_content:eq(1)").removeClass("active");
			$(".tab_content.project_content:eq(2)").removeClass("active");
			$(".btn_list").removeClass("active");
			$(".btn_card").addClass("active");
			$("#tabMyProject").addClass("active");
			$("#tabSharedFile").removeClass("active");
		}else{
			$(".tab_content.project_content:eq(0)").removeClass("active");
			$(".tab_content.project_content:eq(1)").addClass("active");
			$(".tab_content.project_content:eq(2)").removeClass("active");
			$(".btn_list").addClass("active");
			$(".btn_card").removeClass("active");
			$("#tabMyProject").addClass("active");
			$("#tabSharedFile").removeClass("active");
		}
    }
    function fn_sfClick(){
    	if($(".btn_list").hasClass("active")==false){
			$(".tab_content.project_content:eq(0)").removeClass("active");
			$(".tab_content.project_content:eq(1)").removeClass("active");
			$(".tab_content.project_content:eq(2)").addClass("active");
			$(".btn_list").removeClass("active");
			$(".btn_card").addClass("active");
			$("#tabMyProject").removeClass("active");
			$("#tabSharedFile").addClass("active");
		}else{
			$(".tab_content.project_content:eq(0)").removeClass("active");
			$(".tab_content.project_content:eq(1)").removeClass("active");
			$(".tab_content.project_content:eq(2)").addClass("active");
			$(".btn_list").addClass("active");
			$(".btn_card").removeClass("active");
			$("#tabMyProject").removeClass("active");
			$("#tabSharedFile").addClass("active");
		}
    }
	return {
        search : function() { fn_search(); }
    }
	
})();
</script>