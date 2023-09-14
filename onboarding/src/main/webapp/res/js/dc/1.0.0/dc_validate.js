// by ram

function chkTextSize(element, type, size, alertText) // 해당 요소의 유효성을 검사한다 
{
	/*
	 * 	element : id, name 명
		type : id, name -- 해당 요소가 ID인지 NAME인지
		size : 사이즈 이하 false 리턴
		alertText : 띄어줄 메시지
	*/
	if (type=="id") {
		var str = document.getElementById(element).value; 
		if(str == null || str.length <= size) {
			alert(alertText + "이 너무 짧습니다.");
			document.getElementById(element).focus();
			return false;
		} else {
			return true;
		}
	} else if(type=="name") {
		var str = document.getElementsByName(element)[0].value;
		if(str == null || str.length <= size) {
			alert(alertText + "이 너무 짧습니다.");
			document.getElementsByName(element)[0].focus();
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function chkTextSizeCustomText(element, type, size, alertText) // 해당 요소의 유효성을 검사한다 
{
	/*
	 * 	element : id, name 명
		type : id, name -- 해당 요소가 ID인지 NAME인지
		size : 사이즈 이하 false 리턴
		alertText : 띄어줄 메시지
	*/
	if (type=="id") {
		var str = document.getElementById(element).value; 
		if(str == null || str.length <= size) {
			alert(alertText);
			document.getElementById(element).focus();
			return false;
		} else {
			return true;
		}
	} else if(type=="name") {
		var str = document.getElementsByName(element)[0].value;
		if(str == null || str.length <= size) {
			alert(alertText);
			document.getElementsByName(element)[0].focus();
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

// 이메일 형식이 맞는지 리턴
function isEmail(email) {
    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return re.test(email);
}

$(document).ready(function () {
	$(".numberOnly").keydown(function (e) { // 숫자만 입력 받을 수 있게
	    // Allow: backspace, delete, tab, escape, enter and .
	    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
	         // Allow: Ctrl+A
	        (e.keyCode == 65 && e.ctrlKey === true) || 
	         // Allow: home, end, left, right, down, up
	        (e.keyCode >= 35 && e.keyCode <= 40)) {
	             // let it happen, don't do anything
	             return;
	    }
	    // Ensure that it is a number and stop the keypress
	    if ( (e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105) ) {
	        e.preventDefault();
	    }
	});
	
	$(".phoneOnly").keydown(function (e) { // 숫자만 입력 받을 수 있게
	    // Allow: backspace, delete, tab, escape, enter and .
	    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
	         // Allow: Ctrl+A
	        (e.keyCode == 65 && e.ctrlKey === true) ||
	        // Allow: home, end, left, right, down, up
	        (e.keyCode == 45) ||
	        // Allow : -
	        (e.keyCode >= 35 && e.keyCode <= 40)) {
	             // let it happen, don't do anything
	             return;
	    }
	    // Ensure that it is a number and stop the keypress
	    if ( (e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105) ) {
	        e.preventDefault();
	    }
	});
});

//비밀번호 validation
function validatePw(pw) {
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|\\\'\";:\/?]/gi);
	
	if (pw.length < 8 || pw.length > 20) {
		alert("8자리 ~16자리 이내로 입력해주세요");
		return false;
	}
	if (pw.search(/\s/) != -1) {
		alert("비밀번호는 공뱁없이 입력해주세요");
		return false;
	}
	if (num < 0 || eng < 0 || spe < 0) {
		alert("영문, 숫자, 특수문자를 혼합하여 입력해주세요");
		return false;
	}
	
	return true;
}

//글자수 제한
function checkTextLength(that, limit) {
	var maxLength =limit;
	var text = $(that).val();
    var textLength = text.length;
    if (textLength > maxLength) {
    	$(that).val(text.substring(0, (maxLength)));
    	alert(limit+"글자를 넘어갈 수 없습니다.");
    	$("label[id='lbl_" + that.name+"']").text($(that).val().length);
    } else {
    	$("label[id='lbl_" + that.name+"']").text($(that).val().length);
    }
}

//바이트 제한
function checkByte(that, limit) {
	var cont = $(that).val();
	var s='';
	var i=0;
	for(k=0; k < cont.length; k++)
	{
		if(escape(cont.charAt(k)).length>4)
			i += 2
		else
			i++;
		if(i<=limit)
			s += escape(cont.charAt(k));
		else {
			$("label[id='lbl_" + that.name+"']").text(i);
			alert((limit +1) + "byte를 초과할 수 없습니다.");
			$(that).val(unescape(s));
			return;
		}
	}
	$("label[id='lbl_" + that.name+"']").text(i);
}