/* 
#########################################################
############                                 ############
############         Common Javscript        ############
############        Desc = 공통스크립트      ############
############                                 ############
#########################################################
*/

/**
 * @functionName  : isEmpty
 * @description   : 매개변수 값 유무 체크
 * @Modification
 * @ 수정일      수정자    수정내용
 * @ ----------  -------   --------
 * @ 2023.05.12  전형상    최초 생성
 *
 * @param  value
 * @return boolean
*/
var isEmpty = function(value){
    if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
        return true
    }else{
        return false
    }
}; 

/**
 * @prototypeName  : trim
 * @description    : string prototype에 trim 추가
 * @Modification
 * @ 수정일      수정자    수정내용
 * @ ----------  -------   --------
 * @ 2023.05.12  전형상    최초 생성
 *
 * @return 문자열 시작점과 끝점 기준 띄어쓰기 replace
*/
String.prototype.trim = function() {
    return this.replace(/^\s+|\s+$/g,"");
}

/**
 * @functionName  : str_to_yyyymmdd
 * @description   : 구분자를 통해 날짜 형식 변경
 * @Modification
 * @ 수정일      수정자    수정내용
 * @ ----------  -------   --------
 * @ 2023.05.12  전형상    최초 생성
 *
 * @param  str 문자열 파라미터
 * @param  gubun 구분자
 * @return 문자열 시작점과 끝점 기준 띄어쓰기 replace
*/
function str_to_yyyymmdd(str, gubun) {
    if(isEmpty(str)){
        return false;
    } else {
        if(typeof(str) == 'string'){
            var year  = str.substring(0,4);
            var month = str.substring(5,7);
            var day   = str.substring(8,11);
        } else {
            str = toString(str);
            var year  = str.substring(0,4);
            var month = str.substring(5,7);
            var day   = str.substring(8,11);
        }
        return year + gubun + month + gubun + day;
    }
}

/**
 * @functionName  : specialReplaceStr
 * @description   : 특수문자, 띄어쓰기 제거
 * @Modification
 * @ 수정일      수정자    수정내용
 * @ ----------  -------   --------
 * @ 2023.05.26  전형상    최초 생성
 *
 * @param  str 문자열 파라미터
 * @param  id DOM id
 * @return 띄어쓰기, 특수문자 replace
 test : "문자열"이 "정규표현식"과 매칭되면 true, 아니면 false반환
*/
function specialReplaceStr(str, id){    
    var reg        = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
    var replaceStr = "";
    if(reg.test(str)){
        alert("특수문자는 입력하실수 없습니다.");
        replaceStr = str.replaceAll(reg, "");
        $('#' + id).val(replaceStr);
    }
}

/**
 * @functionName  : textXSS
 * @description   : XSS 처리된 데이터 원복
 * @Modification
 * @ 수정일      수정자    수정내용
 * @ ----------  -------   --------
 * @ 2023.05.29  전형상    최초 생성
 *
 * @param  str 문자열 파라미터
 * @return replace 된 문자열
*/
function textXSS(str){
    str = str.replaceAll("<br>"  , "\r\n");
    str = str.replaceAll("&amp;" , "&");
    str = str.replaceAll("&lt;"  , "<");
    str = str.replaceAll("&gt;"  , ">");
    str = str.replaceAll("&#34;" , "\"");
    str = str.replaceAll("&#39;" , "\'");
    str = str.replaceAll("&#37;" , "%");    
    return str
}


/**
 * @functionName  : getPageNavi
 * @description   : 페이징 처리 및 DIV 태그 삽입
 * @Modification
 * @ 수정일      수정자    수정내용
 * @ ----------  -------   --------
 * @ 2023.05.29  전형상    최초 생성
 *
 * @param  div_id    페이징 div ID
 * @param  callback  리스트 호출
 * @param  page_data PageVo 데이터
 * @return divId.html 삽입 str
*/
function getPageNavi(div_id, callback, page_data) {
    $("#" + div_id).empty();
    
    var list_total_count = page_data.list_total_count   // 게시글 전체개수
    var current_page     = page_data.current_page       // 현재 페이지 번호
    var end_page         = page_data.end_page           // 페이징 라인 기준으로 끝 페이지 번호
    var line_page        = page_data.line_page          // 페이징 라인 기준
    var list_count       = page_data.list_count         // 게시글 갯수 기준
    var start_page       = page_data.start_page         // 완전 시작 페이지 번호
    var last_page        = page_data.last_page          // 완전 끝 페이지 번호
    var str              = "";                          // HTML 태그 담을 변수
    
    str += "<div class='container'>";
    str +=     "<ul class='pagination justify-content-center'>";
    
    // 완전 시작 페이지로 이동
    if (current_page > 1) {
        str += "<li class='ms-1 page-item'><span class='page-link hand-corsur' aria-hidden='true' onClick=\"" + callback + "(1);\"> First </span></li>";
    }else{
        str += "<li class='disabled ms-1 page-item'><span class='page-link'> First </span></li> ";
    }
    
    // 현재 기준 이전 페이지로 이동
    if (current_page == 1) {
        str += "<li class='disabled ms-1 page-item'><span class='page-link' aria-hidden='true'>Previous</span></li> ";
    }else{
        str += "<li class='ms-1 page-item'><span class='page-link hand-corsur' aria-hidden='true' onClick=\""+ callback +"("+ (current_page - 1) +");\"> Previous </span></a></li> ";
    }
    
    // 페이징 라인 기준으로 번호출력
    for (var i = start_page; i <= end_page; i++){
        if (i != current_page) {
            str += "<li class='ms-1 page-item'><span class='page-link hand-corsur' onClick=\""+ callback +"("+ i +");\">"+ i +"</span></li> ";
        }else{
            str += "<li class='active ms-1 page-item'><span class='page-link defult-corsur'>"+ i +"</span></li> ";
        }
    }
    
    // 현재 기준 다음 페이지
    if (last_page > current_page ) {
        str += "<li class='ms-1 page-item'><span class='page-link hand-corsur' aria-hidden='true' onClick=\""+ callback +"("+ (current_page + 1) +");\">Next</span></li> ";
    }else{
        str += "<li class='disabled ms-1 page-item'><span class='page-link' aria-hidden='true'>Next</span></li> ";
    }
    
    // 완전 끝 페이지로 이동
    if (current_page < last_page) { 
        str += "<li class='ms-1 page-item'><span class='page-link hand-corsur' aria-hidden='true' onClick=\""+ callback +"("+ last_page +");\">Last</span></li>";
    }else{
        str += "<li class='disabled ms-1 page-item'><span class='page-link' aria-hidden='true'>Last</span></li>";
    }
    
    str +="</ul></div>";

    $("#"+ div_id).html(str);
}