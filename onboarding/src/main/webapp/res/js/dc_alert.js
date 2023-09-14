/* 2021.08.18 김지원. 스윗얼럿 호출을 간편하게 하기 위해.
 
	< 사용 예 > 
	1. swal.show('메세지', '아이콘이름');
	2. swal.show('메세지', '아이콘이름', 콜백);
	
	< 아이콘 종류 5가지 >
	['success', 'error', 'warning', 'info', 'question']
*/

var AlertOption = function(text, icon, title) {
	//this.title = this.icon.toUpperCase();
	this.text = text;
	this.icon = icon;
	this.confirmButtonColor = '#40a27c',
	this.confirmButtonText = '확인';
	
	return this;
}

var ConfirmOption = function(text) {
	//this.title = '확인',
  	this.text = text,
  	this.icon = 'info',
  	this.showCancelButton = true,
  	this.confirmButtonColor = '#40a27c',
  	this.cancelButtonColor = '#a1a1a1',
  	this.cancelButtonText = '취소',
  	this.confirmButtonText = '확인'
}

var swal = {
	show: function(msg, icon, callback) {
		var alertOption = new AlertOption(msg, icon);
		if (msg.indexOf("<br") > -1 || msg.indexOf("\n") > -1) {
			msg.replace(/(?:\r\n|\r|\n)/g, '<br>');
			alertOption.html = msg;
		}
		
		// 창이 닫히고 실행
		alertOption.didClose = function() {
			if (callback) {
				setTimeout(callback, 10);
			}
		}
		
		Swal.fire(alertOption);
	},
	confirm: function(msg, callback) {
		var confirmOption = new ConfirmOption(msg);
		if (msg.indexOf("<br") > -1 || msg.indexOf("\n") > -1) {
			msg.replace(/(?:\r\n|\r|\n)/g, '<br>');
			confirmOption.html = msg;
		}
		
		Swal.fire(confirmOption).then(function (result) {
			if (result.isConfirmed) {
				if (callback) {
					setTimeout(callback, 10);
				}
			}
		});
	}
}