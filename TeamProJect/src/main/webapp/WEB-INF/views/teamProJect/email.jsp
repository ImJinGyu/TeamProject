<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript">

	$(document).ready(() => {
		var code;
		$('#mail-Check-Btn').bind('click', () => {
			
			var email;
			if($('#userEmail2').val() == "" || $('#userEmail2').val() == null){
				if(document.getElementById('userEmail3').selectedIndex != 0){
					email = $('#userEmail1').val() + $('#userEmail3').val();
				}else{
					alert("이메일을 선택하여 주십시오.");
					return;
				}
			}else{
				email = $('#userEmail1').val() + '@' +  $('#userEmail2').val();
			}
			
			$.ajax({
				url:'emailsend?email=' + email,
				type:'get',
				success:(data) => {
					console.log('data : ' + data);
					$('#mail-check-input').attr('disabled',false);
					code = data;
					alert('인증번호가 전송되었습니다.')
				}
			})	
		})
		
		$('#code-Check-Btn').click(function () {
			const inputCode = $('#mail-check-input').val();
			const $resultMsg = $('#mail-check-warn');
			
			if(inputCode == code){
				$resultMsg.html('인증번호가 일치합니다.');
				$resultMsg.css('color','green');
				$('#userEamil1').attr('readonly',true);
				$('#userEamil2').attr('readonly',true);
				$('#userEamil3').attr('readonly',true);
				$('#mail-check-input').attr('disabled',true);
				$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
		        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
			}else{
				$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
				$resultMsg.css('color','red');
			}
		});
	});
</script>
</head>
<body>
<div class="form-group email-form">
	 <label for="email">이메일</label>
	 <div class="input-group">
	<input type="text" name="userEmail1" id="userEmail1" placeholder="이메일" >@
	<input type="text" name="userEmail2" id="userEmail2" placeholder="직접입력" >
	<select class="form-control" name="userEmail3" id="userEmail3" >
	<option>직접선택</option>
	<option>@naver.com</option>
	<option>@daum.net</option>
	<option>@gmail.com</option>
	<option>@hanmail.com</option>
	 <option>@yahoo.co.kr</option>
	</select>
	</div>   
<div class="input-group-addon">
	<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
</div>
	<div class="mail-check-box">
<input type='text' id="mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
<button type="button" id="code-Check-Btn">인증확인</button>
</div>
	<span id="mail-check-warn"></span>
</div>
</body>
</html>