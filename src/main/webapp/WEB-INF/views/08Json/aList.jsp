<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script>
	$(function(){
		
	});
	function deleteRow(g_idx){
		if(confirm('삭제할까요?')==true){
			
			$.ajax({
				url : "./deleteAction.do",
				type : "get",
				contentType : "text/html;charset:utf-8",
				data : { idx : g_idx },
				dataType : "json",
				success : function(d){
					if(d.statusCode==0){
						alert("게시물 삭제를 실패했습니다.");
					}
					else if(d.statusCode==1){
						alert("로그인 후 삭제시도해주세요");
						location.href="./login.do";
					}
					else if(d.statusCode==2){
						alert("게시물이 삭제되었습니다.");
						/*
						HTML엘리먼트를 숨김처리 한다. 이때 시간을 부여하면
						애니메이션 효과가 적용되어 천천히 사라지게 된다.
						*/
				
						$("#guest_"+g_idx).hide(1000);
						setInerval("reflash()", 1100);
					}
				},
				error : function(e){//실패시 콜백 메소드
					alert("요청실패 : " + e.status + ":" + e.statusText);	
				}
			});
		}
	}
	
	function reflash(){
		/*
		키보트의 F5이나 새로고침 버튼을 누른것과 
		동일하게 웹브라우져를 새로고침해서
		서버에 새로운 데이터를 가져와 로딩한다.
		*/
		location.reload();
	}
	
	function paging(pNum){
		$.ajax({
			url : "./aList.do",
			type : "get",
			contentType : "text/html;charset:utf-8",
			data : { nowPage : pNum },
			dataType : "html",
			success : function(d){
				
				$('#boardHTML').html('');
				$('#boardHTML')
					.append('<div style="text-align:center;padding-top:50px">')
					.append('<img src="../images/loading02.gif">')
					.append('</div>');
				
				$('#boardHTML').html(d);
				
			},
			error: function(e){
				alert("실패" + e);
			}
			
		});
	}
	
	
	
</script>

<!-- 글쓰기버튼 및 로그인/로그아웃 버튼 -->
<div class="text-right">
	<c:choose>
		<c:when test="${not empty sessionScope.siteUserInfo }">
		 	<button class="btn btn-danger" 
				onclick="location.href='logout.do';">
				로그아웃
			</button>
		</c:when>
		<c:otherwise>
		 	<button class="btn btn-info" 
				onclick="location.href='login.do';">
				로그인
			</button>
		</c:otherwise>
	</c:choose>		
	&nbsp;&nbsp;
	<button class="btn btn-success" 
		onclick="location.href='write.do';">
		방명록쓰기
	</button>
</div>

<!-- 방명록 반복 부분 s -->
<c:forEach items="${lists }" var="row">		
	<div class="border mt-2 mb-2" id="guest_${row.idx }">
		<div class="media">
			<div class="media-left mr-3">
				<img src="../images/img_avatar3.png" class="media-object" style="width:60px">
			</div>
			<div class="media-body">
				<h4 class="media-heading">작성자:${row.name }(${row.id })</h4>
				<p>${row.contents }</p>
			</div>	  
			<!--  수정,삭제버튼 -->
			<div class="media-right">
				<!-- 세션영역의 id와 게시물의 id를 비교한다. 
				즉 작성자 본인에게만 수정/삭제 버튼이 보이게 처리한다.  -->
				<c:if test="${sessionScope.siteUserInfo.id eq row.id}">
					
					<button class="btn btn-danger" 
						onclick="javascript:deleteRow(${row.idx});">삭제</button>
				</c:if>
			</div>
		</div>
	</div>
</c:forEach>

<!-- 방명록 반복 부분 e -->
<ul class="pagination justify-content-center">
	${pagingImg }
</ul>

