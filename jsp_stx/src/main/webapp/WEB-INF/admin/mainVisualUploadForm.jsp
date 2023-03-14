<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- <form action="fileupload" method="POST" enctype="application/x-www-form-urlencoded"> -->
<div class="admin" style="padding-top:300px;">
<form action="../board/fileupload" method="POST" enctype="multipart/form-data">
	<table>
		<colgroup>
			<col style="width: 20%" />
			<col style="width: 80%" />
		</colgroup>
		<tbody>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" id="title" placeholder="제목을 입력하세요." />
				</td>
			</tr>
			<tr>
				<th>image</th>
				<td>
					<input type="file" name="file" id="file" placeholder="대표이미지를 업로드 하세요." />
				</td>
			</tr>
		</tbody>
	</table>
	<div>
		<button class="btn confirm">확인</button>
		<button type="reset">취소</button>
	</div>
</form>
</div>
<%@ include file="../include/footer.jsp"%>
