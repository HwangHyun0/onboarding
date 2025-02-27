package onboarding.hwang.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onboarding.hwang.login.model.HwangSessionVo;
import onboarding.hwang.login.model.HwangVo;

@Service
public class HwangLoginSvc {

	@Autowired
	private HwangLoginMapper hwangLoginMapper;
	
	
	public int insertJoin(HwangVo vo) throws Exception {
		return hwangLoginMapper.insertJoin(vo);
	}
	
	public int idCheck(String id) throws Exception {
		return hwangLoginMapper.idCheck(id);
	}
	
	public HwangSessionVo getuserInfo(HwangVo vo) throws Exception {
		return hwangLoginMapper.getuserInfo(vo);
	}
	
	public HwangVo selectFindID(HwangVo vo) throws Exception {
		return hwangLoginMapper.selectFindID(vo);
	}

}
