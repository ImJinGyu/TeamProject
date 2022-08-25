var code;
	
function emailcer(){
	var email = $('#user_id').val();
	$.ajax({
		url:'emailsend?email=' + email,
		type:'get',
		success:(data) => {
			console.log('data : ' + data);
			$('#mail-check-input').attr('disabled',false);
			code = data;
			alert('인증번호가 전송되었습니다.')
			$('#emailcertify').css('display','block')
		}
	})	
}

function certifycheck(){
	debugger;
	const inputCode = $('#emailcerfifytext').val();
	const $resultMsg = $('#mail-check-warn');
	const emailcheck = $('#emailcheck');
	var msg = '인증번호가 불일치 합니다. 다시 확인해주세요!';
	var color = 'red';
	
	if(inputCode == code){
		msg = '인증번호가 일치합니다.';
		color = 'green';
		$('#emailcerfifytext').attr('disabled',true);
		emailcheck.val('true');
	}
	$resultMsg.html(msg);
	$resultMsg.css('color',color);
}
