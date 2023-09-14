var dcRegex = {
	isUrl: function(str) {
		var regex = /(http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!-\/]))?/;
		return (regex.test(str));
	}, 
	isEngNum: function(str) {
		var regex = /^(?!(?:[0-9]+)$)([a-zA-Z]|[0-9a-zA-Z])*$/;
		return (regex.test(str));
	},
	isEmail: function(str) {
		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return (regex.test(str));
	},
	isPhone: function(str) {
		var regex = /^\d{2,3}-\d{3,4}-\d{4}$/;
		if (regex.test(str) == false) {
			regex = /^\d{11}$/;
			return (regex.test(str));
		} else {
			return true;
		}
	},
	isPassword: function(str) {
		var regex = /^.*(?=^.{10,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=]).*$/;
		return (regex.test(str));
	},
	isTel: function(str) {
		var regex = /^\d{2,3}-\d{3,4}-\d{4}$/;
		if (regex.test(str) == false) {
			regex = /^\d{9,11}$/;
			return (regex.test(str));
		} else {
			return true;
		}
	}
	
}