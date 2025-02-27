package onboarding.hwang.board;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import onboarding.hwang.board.model.HwangBoardVo;
import onboarding.hwang.login.model.HwangSessionVo;

@Controller
@RequestMapping(value = "/hwang/board")
public class HwnagBoardCtrl {
	
	
	@Autowired
	private HwangBoardSvc hwangboardSvc;
	
	public static final String HWANG_SESSION =  "userinfo";
	public static final String HWANG_BOARD_VIEW =  "/WEB-INF/classes/onboarding/hwang/board/view";

	//게시판리스트 화면 
	@RequestMapping(value = "/boardList.dcp")
	public ModelAndView boardList(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception 
	{
		ModelAndView mv = new ModelAndView( HWANG_BOARD_VIEW + "/boardList.empty_tiles" );
		
		HwangSessionVo sessionVo = (HwangSessionVo)session.getAttribute( HWANG_SESSION );
		
		if (session == null || !req.isRequestedSessionIdValid() || sessionVo == null ) {
			mv.addObject("msg", "로그인 필요합니다. 로그인 화면으로 이동합니다. ");
			mv.addObject("afterUrl", "/hwang/user/loginView.dcp");
			mv.setViewName( HWANG_BOARD_VIEW + "/msgView.empty_tiles" );
		}else {
			sessionVo.setMenu("board"); // board 메뉴 값 주기 
		}
		
		//글 가져오기
		HwangBoardVo boardVo = new HwangBoardVo();
		boardVo.setBoardList((List<HwangBoardVo>)hwangboardSvc.selectBoardList());
		
		mv.addObject("userinfo", sessionVo);
		mv.addObject("boardVo", boardVo);
		
		return mv; 
	}
	
	
	//게시판 등록 화면 
	@RequestMapping(value = "/boardWrite.dcp")
	public ModelAndView boardWrite(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception 
	{
		ModelAndView mv = new ModelAndView( HWANG_BOARD_VIEW + "/boardWrite.empty_tiles" );
		
		HwangSessionVo sessionVo = (HwangSessionVo)session.getAttribute( HWANG_SESSION );
		
		//게시판 기본 
		if (session == null || !req.isRequestedSessionIdValid() || sessionVo == null ) {
			mv.addObject("msg", "로그인 필요합니다. 로그인 화면으로 이동합니다. ");
			mv.addObject("afterUrl", "/hwang/user/loginView.dcp");
			mv.setViewName( HWANG_BOARD_VIEW + "/msgView.empty_tiles" );
		}else {
			sessionVo.setMenu("board"); // board 메뉴 값 주기 
		}
		
		return mv; 
	}

	//글 저장 
	@RequestMapping(value = "/boardSave.dcp" , method = RequestMethod.POST)
	public void boardSave(HttpServletRequest req, HttpServletResponse res , HwangBoardVo vo ,HttpSession session ) throws Exception 
	{
		String result ="";
		HwangSessionVo sessionVo = (HwangSessionVo)session.getAttribute( HWANG_SESSION );
		vo.setUser_id(sessionVo.getUser_id());  //작성자
		
		hwangboardSvc.insertBoard(vo);
		res.setContentType("text/html;charset=utf-8");
    	PrintWriter out = res.getWriter();

    	result = "1";
    	out.print(result);
	
	}
	
	
}
