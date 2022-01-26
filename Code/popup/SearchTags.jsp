<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="mg_popup active">
	<div class="popup_wrap popup_search_tags">
		<section class="popup_header">
			<h2>Search Tags</h2>
		</section>
		
		<section class="popup_body">
			<div class="popup_container">
				<div class="search_tags">
					<div class="recommend_tag_group">
						<h3 class="tit">Recommendation Tags</h3>
						<p>Here are the top 10 favorite tags of the last week.</p>
						
						<ol class="tag_list">
						</ol>
					</div>
					<!-- //recommend_tag_group -->
					
					<div class="mg_search">
						<input type="search" class="m_text" placeholder="Search Tags">
						<button type="button" class = "icon_search">검색</button>
					</div>	
					
					<div class="search_tag_group">
						<ul class="tag_list">
						</ul>
					</div>
					
					<div class="selected_tag_group">
						<button class="btn_reset">Reset</button>
						<ul id="selected_tag" class="tag_list">

						</ul>
						
						<p class="count">0 tags are selected.</p>
						
						<div class="mg_btn">
							<button class="m_btn btn_blue" id = "btn_apply">Apply</button>
							<button class="m_btn btn_white" id ="btn_cancel">Cancel</button>
						</div>
					</div>	
					<!-- //result_wrap -->	
				</div>
				<!-- //search_wrap -->						
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
	var count =0;
 	var user_id = "";
    $(document).ready(function () {
        fn_initSetting();
        fn_selectTop10();
        fn_selectTagList();
        fn_setEvents();

        
    });
    
 	// initSetting
    function fn_initSetting() {
    	    	
    }
    
    // 이벤트 설정
    function fn_setEvents() {
    	
    	$("#btn_apply").on("click", function(){
    		$(".selected_keywords").empty();
    		$(".search_total").empty();
    		$(".item_tag_list").children().removeClass("match_tag");
			var tagCount =0;
			
	   		for(var i=0;i<$(".tag_item input").length;i++){
	   			var tempObj = "<span>" +$(".tag_item input").eq(i).val()+"</span>" ;
    			$(".selected_keywords").append(tempObj);
    			$("[name=" +$(".tag_item input").eq(i).val()+ "]").addClass("match_tag");
    			tagCount++;
	   		}
	   		var tempObj2 = "<strong>Search Tags : ("+tagCount+")</strong>";
	   		$(".search_total").append(tempObj2);
			fn_layerPopupClose();
    	});
    	
	   	$("#btn_cancel").on("click",function(){
	   		fn_layerPopupClose();
	   	});
	   	
    	 $(".btn_popup_close").click(function(){
         	$(this).parents(".mg_popup").removeClass("active");
         });
         
 		/* 태그 아이템 삭제 */		
 		$("#selected_tag").on("click",".delete_tag_item", function (){
 			tag = $(this).parent().find("input").val();
			$(this).parent(".tag_item").remove();
			lis = $(".search_tag_group > .tag_list > li");
			$.each(lis, function(idx){
				if(lis[idx].text == tag) {
					$(lis[idx]).removeClass('selected');
					}
			})
			lis2 = $(".recommend_tag_group > .tag_list > li");
			$.each(lis2, function(idx){
				if(lis2[idx].text == ("#"+tag)) {
					$(lis2[idx]).removeClass('selected');
					}
			})
 			$(this).parent(".tag_item").remove();
 			count--;
 			$(".count").html(count+" tags are selected");
 		});
         
         $(".btn_reset").click(function(){
        	 count =0;
        	 $(".count").html(count+" tags are selected");
        	 $("#selected_tag").empty(); 
        	 $(".search_tag_group > .tag_list > li").removeClass("selected");
        	 $(".recommend_tag_group > .tag_list > li").removeClass("selected");
        	 
         });
         
         
         //태그 클릭시 추가
 		$(".mg_popup").on("click", ".search_tag_group > .tag_list > li", function (){
			var tagValue = $(this).text();
			list = $(".recommend_tag_group > .tag_list > li");
			if($(this).hasClass("selected")==true){
				$.each($(".delete_tag_item").parent(), function(idx){
					if($(".delete_tag_item").parent().eq(idx).find('input').val() == tagValue){
						$(".delete_tag_item").parent().eq(idx).remove();
					}
				})
				count--;
	      	 	$(".count").html(count+" tags are selected");
				$(this).toggleClass("selected");
	 	        $.each(list, function(idx){
					if(list[idx].text== ("#"+tagValue)) {
						$(list[idx]).toggleClass('selected');
					}
				}) 
			}else{
				var addHtml ="";
				addHtml +='<li class="tag_item" id = "'+$(this).text()+'">';
				addHtml +='<input type="text" value="'+$(this).text()+'" readonly/>';
				addHtml +='<button class="delete_tag_item"></button>';
				addHtml +='</li>';        	
		       	$(".selected_tag_group .tag_list").prepend(addHtml);
		       	count++;
		       	$(".count").html(count+" tags are selected");
		       	$(this).toggleClass("selected");
	 	        $.each(list, function(idx){
					if(list[idx].text== ("#"+tagValue)) {
						$(list[idx]).toggleClass('selected');
					}
				}) 
			}
	    });
 		
 		
 		//top 10 클릭시 추가
		$(".mg_popup").on("click", ".recommend_tag_group > .tag_list > li", function (){
			var tagValue = $(this).text().replace('#','');
			list = $(".search_tag_group > .tag_list > li");
			if($(this).hasClass("selected")==true){
				$.each($(".delete_tag_item").parent(), function(idx){
					if($(".delete_tag_item").parent().eq(idx).find('input').val() == tagValue){
						$(".delete_tag_item").parent().eq(idx).remove();
					}
				})
				count--;
	      	 	$(".count").html(count+" tags are selected");
				$(this).toggleClass("selected");
	 	        $.each(list, function(idx){
					if(list[idx].text== tagValue) {
						$(list[idx]).toggleClass('selected');
					}
				}) 
			}else{
				var addHtml ="";
				addHtml +='<li class="tag_item">';
				addHtml +='<input type="text" value="'+$(this).text().replace('#','')+'" readonly/>';
				addHtml +='<button class="delete_tag_item"></button>';
				addHtml +='</li>';        	
		       	$(".selected_tag_group .tag_list").prepend(addHtml);
		       	count++;
		       	$(".count").html(count+" tags are selected");
		       	$(this).toggleClass("selected");
	 	        $.each(list, function(idx){
					if(list[idx].text== tagValue) {
						$(list[idx]).toggleClass('selected');
					}
				}) 
			}
	    });
 		
     	$(".icon_search").click(function(){
    		fn_search();
    	});
    }
    
    //top10 태그 
    function fn_selectTop10(){
    	var params = {};
    	params["fn_success"] = (function(data, params) {
    		var result = data.result;
    		$.each(result, function(idx) {
    			$(".recommend_tag_group .tag_list").append('<li class="tag_item">&num;'+ result[idx].tags +'</li><br>');
    		});
    	});
    	fn_ajax("/ai/project/selectTop10.do", params);
    }
    
    //태그 선택 리스트
    function fn_selectTagList(){
    	var params = {};
    	params['tag'] = $(".m_text").val();
    	params["fn_success"] = (function(data, params) {
    		var result = data.result;
    		var result2 = data.result2;
    		$.each(result, function(idx) {
    			$(".search_tag_group .tag_list").append('<li class="tag_item">'+ result[idx].tags +'</li>');
    		});
    		user_id = result2.user_id;
    	});
    	fn_ajax("/ai/project/selectTagList.do", params);
    }

    
    //검색 기능
	function fn_search(){
		$(".search_tag_group .tag_list").empty();
		fn_selectTagList();
	}
	return {
	      search : function() { fn_search(); }
	  }

})();
</script>