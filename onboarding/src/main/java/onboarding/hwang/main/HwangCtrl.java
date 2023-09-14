package onboarding.hwang.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value = "/hwang")
public class HwangCtrl {
	
	@Autowired
	private HwangSvc hwangSvc;
	
	public static final String HWANG_SESSION =  "userinfo";
	public static final String HWANG_MAIN_VIEW =  "/WEB-INF/classes/onboarding/hwang/main/view";
	
	@RequestMapping(value = "/main.dcp")
	public ModelAndView login(HttpServletRequest req, HttpServletResponse res , HttpSession session) throws Exception 
	{
		ModelAndView mv = new ModelAndView( HWANG_MAIN_VIEW + "/main.empty_tiles" );
		
		//session.invalidate(); //초기화 
		
		return mv; 
	}

}
