<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/admin_header.jsp" %>
<script>
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<h1>회원 판매자 등록 권한 관리</h1>
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
						<th>가입일</th>
						<th>등록일</th>
						<th>등록취소 횟수</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="MemberVo" items="${sellerList}">
					<tr>
						<td>${MemberVo.m_id}</td>
						<td>${MemberVo.m_name}</td>
						<td>${MemberVo.m_regdate}</td>
						<td>${MemberVo.m_selling_regdate}</td>
						<c:forEach var="SanctionVo" items="${sancList}">
						<c:if test="${MemberVo.m_id == SanctionVo.m_id}">
						<td>${SanctionVo.sanc_count}</td>
						</c:if>
						<c:if test="${MemberVo.m_id != SanctionVo.m_id}">
						<td>0</td>
						</c:if>
						</c:forEach>
						<td>
							<a href="/admin/adminRollbackSeller/${MemberVo.m_id}">판매권한 삭제</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<a href="/admin/adminMember">이전 화면으로</a>
			<a href="/admin/adminForm">관리자 메인 화면으로</a>
		</div>
		<div class="col-md-4"></div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>