package onboarding.hwang.login;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import onboarding.hwang.login.model.HwangSessionVo;
import onboarding.hwang.login.model.HwangVo;
import onboarding.hwang.main.SHA256;




@Controller
@RequestMapping(value = "/hwang/user")
public class HwangLoginCtrl {
	
	
	@Autowired
	private HwangLoginSvc hwangloginSvc;
	
	public static final String HWANG_SESSION =  "userinfo";
	public static final String HWANG_LOGIN_VIEW =  "/WEB-INF/classes/onboarding/hwang/login/view";

	
	//로그인 화면 
	@RequestMapping(value = "/loginView.dcp")
	public ModelAndView login(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception 
	{
		ModelAndView mv = new ModelAndView( HWANG_LOGIN_VIEW + "/login.empty_tiles" );
		
		session.invalidate();
		
		return mv; 
	}
	
	//회원가입 화면  
	@RequestMapping(value = "/join.dcp")
	public ModelAndView join(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception 
	{
		ModelAndView mv = new ModelAndView( HWANG_LOGIN_VIEW + "/join.empty_tiles" );
		
		session.invalidate();
		
		return mv; 
	}
	
	//회원가입 등록 
	@RequestMapping(value = "/joinAction.dcp" , method = RequestMethod.POST)
	public void joinAction(HttpServletRequest req, HttpServletResponse res , HwangVo vo ) throws Exception 
	{
		SHA256 sha256 = new SHA256();
		
		String result ="";
		int check = 0 ;
		String id = vo.getUser_id();
		
		check = hwangloginSvc.idCheck(id);
		
		if( check == 0 ) {
			//중복없으면 
			
			String passwoad= vo.getPassword();
			String cryptogram = sha256.encrypt(passwoad);
			
			//비밀번호 단방향 암호화 
			vo.setPassword(cryptogram);
			
			hwangloginSvc.insertJoin(vo);
		}else {
			result = "fail";
		}
		
		res.setContentType("text/html;charset=utf-8");
    	PrintWriter out = res.getWriter();

    	out.print(result);
	
	}
	
	//아이디 중복 체크 
	@RequestMapping(value = "/idcheckAction.dcp" )
	public void idCheck(HttpServletRequest req, HttpServletResponse res , @RequestParam("id") String id ) throws Exception 
	{	
		int result = 0;
		
		result = hwangloginSvc.idCheck(id);
		
    	res.setContentType("text/html;charset=utf-8");
    	PrintWriter out = res.getWriter();

    	out.print(result);
		
	}
	
	//로그인 하기 
	@RequestMapping(value = "/loginAction.dcp" )
	public @ResponseBody String login(HttpServletRequest req, HttpServletResponse res , HwangVo vo) throws Exception 
	{	
		SHA256 sha256 = new SHA256();
		
		Map<String, String> map = new HashMap<String,String>(); 
		
		HttpSession session = req.getSession(true);
		
		String passwoad= vo.getPassword();
		String cryptogram = sha256.encrypt(passwoad);
		
		//비밀번호 단방향 암호화 
		vo.setPassword(cryptogram);
		
		HwangSessionVo userinfo = hwangloginSvc.getuserInfo(vo);
		
		if(userinfo != null ) {
			session.setAttribute( HWANG_SESSION , userinfo );
			 map.put("msg","success");
			 map.put("url","/hwang/board/boardList.dcp");
		}else {
			 map.put("msg","fail");
		}
		
		//로그인 제한 구현하기  --
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(map); // jsonData
		  
	    return json;
	}
	
	
	//로그아웃 
	@RequestMapping(value = "/logOutAction.dcp" )
	public void logOutAction(HttpServletRequest req, HttpServletResponse res ,HttpSession session  ) throws Exception 
	{	
		String result ="1";
		
		session.invalidate(); //초기화 
	
    	res.setContentType("text/html;charset=utf-8");
    	PrintWriter out = res.getWriter();

    	out.print(result);
	}
	

	//찾기 화면 
	@RequestMapping(value = "/findView.dcp")
	public ModelAndView findView(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception 
	{
		ModelAndView mv = new ModelAndView( HWANG_LOGIN_VIEW + "/findIDView.empty_tiles" );
		
		String findKey  = req.getParameter("findkey");
		
		if( null != findKey && ("password").equals(findKey) ) {
			mv.setViewName(HWANG_LOGIN_VIEW + "/findPasswordView.empty_tiles" );
		}
		
		return mv; 
	}
	
	//등록정보로 아이디 찾기 
	@RequestMapping(value = "/idFindkAction.dcp" , produces = "application/json; charset=utf-8")
	public @ResponseBody String idFindkAction(HttpServletRequest req, HttpServletResponse res , HwangVo vo ) throws Exception 
	{
		Map<String, String> map = new HashMap<String,String>(); 
		
		vo = hwangloginSvc.selectFindID(vo);
		
		if( vo == null || vo.getUser_id() == null || vo.getUser_id().isEmpty() ){
		    map.put("msg","noFind");
		}else {
			map.put("msg","Find");
			map.put("ID",vo.getUser_id());
		}
    
    	ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(map); // jsonData
		  
	    return json;
	
	}

}


