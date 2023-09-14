// by Ditongs

var PrintPage = null;

function dcPrint(layout, sub)
{
	var obj = $(sub)[0];
	var w = obj.offsetWidth;     
    var h = obj.offsetHeight;    
    var features = "menubar=no,toolbar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=yes,width="+ w +",height="+ h +",left=0,top=0";    
    PrintPage = window.open("about:blank", obj.id, features);
    
    PrintPage.document.open();
	    PrintPage.document.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">");
	    PrintPage.document.write("<html><head>");
	    PrintPage.document.write("<link rel='stylesheet' type='text/css' href='"+ layout +"/res/css/sub.css' />");
	    PrintPage.document.write("<link rel='stylesheet' type='text/css' href='/ext/bbs/css/common.dcp' />");
	    PrintPage.document.write("<style type='text/css'>");
	    PrintPage.document.write(".print {display:none;}");
	    PrintPage.document.write("</style>");
	    PrintPage.document.write("</head>");
	    PrintPage.document.write("<body>");
	    PrintPage.document.write(obj.innerHTML);
	    PrintPage.document.write("</body></html>");
	    PrintPage.document.title = document.domain;
	PrintPage.document.close();

	setTimeout(function() {
		try {
			PrintPage.print();
		} catch (e) {
			alert(e.message);
		}
	}, 1000);
}

function dcPopup(id, url, w, h, left, top)
{
	if (top == undefined) {
		top = 0;
	}
	if (left == undefined) {
		left = 0;
	}
    var features = "menubar=no,toolbar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=yes,width="+ w +",height="+ h +",left=" + left + ",top=" + top;    
	return window.open(url, id, features);
}

function delete_cookie( name, path, domain ) {
	if( get_cookie( name ) ) {
		document.cookie = name + "=" +
	    	((path) ? ";path="+path:"")+
	    	((domain)?";domain="+domain:"") +
	    ";expires=Thu, 01 Jan 1970 00:00:01 GMT";
	}
}

function createCookie(name,value,days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else var expires = "";
    document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

