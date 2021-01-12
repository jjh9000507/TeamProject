<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/css/inquiry.css" %>
<%@ include file="/resources/css/inquiryfont.css" %>
<%@ include file="/resources/css/inquirystyle.css" %>
<%@ include file="../include/admin_header.jsp"%>
<script data-cfasync="false" type="text/javascript"
src="https://cdn.rawgit.com/dwyl/html-form-send-email-via-google-script-without-server/master/form-submission-handler.js"></script>
<h1>1:1 문의</h1>
<!-- 
	여기에는 테이블 넣어서 문의제목, 작성자, 문의일 / 답변하기버튼  이런 순서로 만들 예정
	답변하기 누르면 테이블 이동하고, 제목은 [re]문의제목
	내용은
	문의내용
	--------
	답변
	
	이런 식으로 쓸 예정이고
	현진이 형한테 물어서 메일로 해당 답변이 전개되도록 해보자.
 -->
 <head>
 	<meta name="viewport" content="widtgh=device-width, initial-scale-1.0">
 	<meta name="description" content="contact form example">
 </head>
 
 <body>
 <div class="row">
 	<div class="col-md-3"></div>
 	<div class="col-md-6">
  <form class="gform pure-form pure-form-stacked" method="POST"
  action="/admin/sendMail">
  
 <input type="hidden" name="to" value="${inquiryVo.email}">
 	<input type="hidden" name="inquiry_no" value="${inquiryVo.inquiry_no}">
    <div class="form-elements">
		<fieldset class="pure-group">
			<label for="subject">제목 </label>
			<input id="subject" name="subject" class="form-control" placeholder="제목을 입력하세요" />
		</fieldset>


		<fieldset class="pure-group">
			<label for="content">답변내용 </label>
			<textarea id="content" name="content" class="form-control" rows="10"
			placeholder="내용을 입력하세요"></textarea>
		</fieldset>

		<button class="button-success pure-button button-xlarge">
			<i class="fa fa-paper-plane"></i>&nbsp;답변 전송
		</button>
	</div>

    <!-- Customise the Thankyou Message People See when they submit the form: -->
    <div class="thankyou_message" style="display:none;">
      <h2><em>답변 완료</em> 답변 작성 및 송부가 완료되었습니다.</h2>
    </div>

	</form>
	</div>
 	<div class="col-md-3"></div>
</div>

 </body>