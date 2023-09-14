package onboarding.hwang.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onboarding.hwang.board.model.HwangBoardVo;

@Service
public class HwangBoardSvc {
	
	@Autowired
	private HwangBoardMapper hwangBoardMapper;
	
	public int insertBoard(HwangBoardVo vo) throws Exception {
		return hwangBoardMapper.insertBoard(vo);
	}
	
	public List<HwangBoardVo> selectBoardList() throws Exception {
		return hwangBoardMapper.selectBoardList();
	}
	
	
	
}