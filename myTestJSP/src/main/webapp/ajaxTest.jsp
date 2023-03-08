<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="./js/jquery-3.6.3.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<input type="text" id="ajaxID" name="">
	<button class="idCheck">ajax넘기기</button>

	<div>
		<h1 class="ajaxDone"></h1>
	</div>

</body>
<script>
	$(".idCheck").on("click", function() {
		const msg = $("#ajaxID").val();
		$.ajax({
			url : "ajaxResult.jsp",
			type : "GET",
			data : {
				ajaxresult : msg
			},
			success : function(response) {
				console.log(response);
				$(".ajaxDone").text(response);
			},
		});
	});
</script>
</html>