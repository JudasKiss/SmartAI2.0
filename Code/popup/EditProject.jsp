<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="mg_popup active">
	<div class="popup_wrap popup_createproject">
		<section class="popup_header">
			<h2>Edit Project</h2>
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
					<li>
						<div class="que">Tag</div>
						<div class="ans">
							<button class="btn_searchTag">Search</button>
							
							<div class="selected_tag_group">
								<ul id="" class="tag_list">
									<li class="add_item">
										<button id="add_tag_item" class="btn_text">Add + </button>
									</li>
								</ul>
							</div>										
							
						</div>
					</li>
				</ul>
				
				<div class="mg_btn">
					<button class="m_btn btn_blue" id ="btn_save<c:out value='${uuid}'/>">Save</button>
					<button class="m_btn btn_white" id = "btn_cancel">Cancel</button>
				</div>
				<!-- start : search 팝업 -->
				<div class="search_popup_wrap">
					<div class="mg_search">
						<input type="search" class="m_text2" placeholder="Search Tags">
						<button type="button"  class="icon_search">검색</button>
					</div>	
					
					<div class="search_tag_group">
						<ul class="tag_list">

						</ul>
					</div>						
				</div>
				<!-- end : search 팝업 -->
			</div>
		</section>
		<div class="popup_search_wrap">
			<div class="popup_search_container">
				
			</div>									
		</div>
		
		<button class="btn_popup_close">
			팝업 닫기
		</button>
	</div>
</div>
<!-- //mg_popup -->


<script>
g_popPage = (function() {
	
	var uuid = "<c:out value='${uuid}'/>";
	var originTags = new Array();
	
    $(document).ready(function () {
        fn_initSetting();
        fn_setEvents();      
        fn_selectTagList();
        fn_popupOpen();
    });
    
 	// initSetting
    function fn_initSetting() {    	    	
    }
    
    // 이벤트 설정
    function fn_setEvents() {  
    	
    	/*생성 버튼 클릭*/
	   	$("#btn_save<c:out value='${uuid}'/>").on("click",function(){
	   		var params = {};
	   		list = $(".selected_tag_group > .tag_list > li");
	   		$.each(list,function(idx){
 	   			if($(list[idx]).find("input").val()==""){
 	   				list[idx].remove();
	   			} 
	   		})
	   		params["crudMode"]="U";
	   		params['name'] = $(".m_text<c:out value='${uuid}'/>").val();
	   		params['descr'] = $(".m_textarea<c:out value='${uuid}'/>").val();
	   		params['uuid'] = uuid;
	   		params['originTags'] = originTags;
	   		params['tags'] ="";
	   		for(var i=0;i<$(".tag_item input").length;i++){
	   			params['tags'] += $(".tag_item input").eq(i).val()+",";
	   		}
			console.log(params);
	   		params["fn_success"] = function(data,params){
	   			fn_saveProjectSuccess(data,params);
	   		};
	   		
	   		fn_ajax("/ai/project/reviseProject.do", params);
	   	});
    	
    	
    	$("#btn_cancel").on("click",function(){
    		fn_layerPopupClose();
    	});
    	
	   	$(".m_text<c:out value='${uuid}'/>").on("blur", function() {
	         fn_nameChk();
	       });
	   	
	   	$(".tag_list").eq(0).on("blur","input", function(){
	   		tag = $(this).parent().find("input").val();
  			if(tag==""){
	   			return false;
	   		} 
	   		flag = $(this).parent();
	   		list = $(".selected_tag_group > .tag_list > li");
 	   		list2 = $(".search_tag_group > .tag_list > li");

	       	$.each(list, function(idx){
	       		if(idx==flag.index()){
	       			return true;
	       		}else if($(list[idx]).find("input").val() == tag){
	       			flag.remove();
	       			alert("중복된 태그입니다.");
	       		}
	       	})
	       	
 	        $.each(list2, function(idx){
				if(list2[idx].text== tag) {
					$(list2[idx]).addClass('selected');
				}
			}) 
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
	   	
	   	
	   	/* 태그 검색 */
	   	$(".btn_searchTag").click(function() {
			$(".search_popup_wrap").toggleClass("active");
		});   
	   	
	   	/* 태그 아이템 추가 */
		$("#add_tag_item").click(function (){
			var addHtml ="";
			addHtml +='<li class="tag_item">';
			addHtml +='<input type="text" value="">';
			addHtml +='<button class="delete_tag_item"></button>';
			addHtml +='</li>';        	
	       	$(".selected_tag_group .tag_list").prepend(addHtml);    
	        
	    });
		
		/* 태그 아이템 삭제 */		
		$(document).on("click",".delete_tag_item", function (){
 			tag = $(this).parent().find("input").val();
			$(this).parent(".tag_item").remove();
			lis = $(".search_tag_group > .tag_list > li");
			$.each(lis, function(idx){
				if(lis[idx].text== tag) {
					$(lis[idx]).removeClass('selected');
				}
			})
		});
		
		//검색 태그에서 추가 삭제
		$(".mg_popup").on("click", ".search_tag_group > .tag_list > li", function (){
			var tagValue = $(this).text();
			
			if($(this).hasClass("selected")==true){
				$.each($(".delete_tag_item").parent(), function(idx){
					if($(".delete_tag_item").parent().eq(idx).find('input').val() == tagValue){
						$(".delete_tag_item").parent().eq(idx).remove();
					}
				})
				$(this).toggleClass("selected");
			}else{
				var addHtml ="";
				addHtml +='<li class="tag_item" id = "'+$(this).text()+'">';
				addHtml +='<input type="text" value="'+$(this).text()+'">';
				addHtml +='<button class="delete_tag_item"></button>';
				addHtml +='</li>';        	
		       	$(".selected_tag_group .tag_list").prepend(addHtml);
		       	$(this).toggleClass("selected");
			}
	    });
		
		//검색
    	$(".icon_search").click(function(){
    		fn_search();
    	});
    }
    
	//태그 동적 추가
    function fn_selectTagList() {
		
    	var params = {};
    	params['tag'] = $(".m_text2").val();
    	params["fn_success"] = (function(data, params) {
    		var result = data.result;
    		$.each(result, function(idx) {
    			$(".search_tag_group .tag_list").append('<li class="tag_item">'+ result[idx].tags +'</li>');
    		});
    	});
    	fn_ajax("/ai/project/selectTagList.do", params);
    };
    
    function fn_tagChk(){
    	tagList = $(".selected_tag_group > .tag_list > li");
    	
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
            
            fn_ajax("/ai/project/projectNameChk.do", params);
            
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
	         fn_selectProjectSuccess(result);
	      };
	      fn_ajax("/ai/project/projectRead.do", params);
   }
   
   function fn_selectProjectSuccess(result) {  
	   // 컨트롤러 result에 담긴 값은 입력된 api정보
	    var ProjectInfos = result.ProjectInfos;
	    $(".m_text<c:out value='${uuid}'/>").val(ProjectInfos.name);
	    $(".m_textarea<c:out value='${uuid}'/>").val(ProjectInfos.descr);
		var tags = "${tags}";
		var list = tags.split("#");
		originTags = tags;
		var srhList = $(".search_tag_group > .tag_list > li");
		$.each(list, function(idx){
			if(list[0]==""){
				return true;
			}
			var addHtml ="";
			addHtml +='<li class="tag_item" id = "'+list[idx]+'">';
			addHtml +='<input type="text" value="'+list[idx]+'">';
			addHtml +='<button class="delete_tag_item"></button>';
			addHtml +='</li>';        	
	       	$(".selected_tag_group .tag_list").prepend(addHtml);
	       	$.each(srhList, function(i){
	       		if(srhList[i].text==list[idx]){
	       			$(srhList[i]).addClass("selected");
	       		}
	       	})
		})
   }

})();
</script>