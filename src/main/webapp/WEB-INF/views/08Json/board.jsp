<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board.jsp</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<script>
	$(function(){
		$('#boardHTML').html('');
		$('#boardHTML')
			.append('<div style="text-align:center;padding-top:50px;">')
			.append('<img src="../images/loading02.gif">')
			.append('</div>');
		//리스트 가져오기
		$.ajax({
			url : "./aList.do",
			type : "get",
			contentType : "text/html;charset:utf-8",
			data : {},
			dataType : "html",
			success : function(d){
				$('#boardHTML').html(d);
			},
			error : function(e){
				alert("실패" + e);
			}
		});
	});
</script>
</head>
<body>

<div class="container">

	<h3>방명록 + JSON + jQuery Ajax 연동 게시판</h3>

	<div id="boardHTML" class="pt-5">
		<h2>
			여기에 게시판이 출력됩니다.
		</h2>
	</div>
	
</div>
</body>
</html>