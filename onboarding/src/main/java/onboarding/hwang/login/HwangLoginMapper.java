package onboarding.hwang.login;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import onboarding.hwang.login.model.HwangSessionVo;
import onboarding.hwang.login.model.HwangVo;

@Mapper
public interface HwangLoginMapper {
	
	public int insertJoin(HwangVo vo);
	
	public int idCheck(String id);
	
	public HwangSessionVo getuserInfo(HwangVo vo);
	
	public HwangVo selectFindID(HwangVo vo);

}
