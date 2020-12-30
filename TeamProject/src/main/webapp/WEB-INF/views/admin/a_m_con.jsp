<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/admin_header.jsp" %>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<h1>회원 정보 관리</h1>
		</div>
		<div class="col-md-4"></div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>이름</th>
						<th>이메일</th>
						<th>연락처</th>
						<th>가입일</th>
						<th>판매자등록</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="MemberVo" items="${memberList}">
					<tr>
						<td>${MemberVo.m_id}</td>
						<td>${MemberVo.m_name}</td>
						<td>${MemberVo.email}</td>
						<td>${MemberVo.m_phonenumber}</td>
						<td>${MemberVo.m_regdate}</td>
						<td>${MemberVo.m_selling_regdate}</td>
						<td>
							<a href="/admin/adminMemberDelete/${MemberVo.m_id}">회원 강제탈퇴</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>