package mybatis;

import org.apache.ibatis.annotations.Param;

public interface MybatisMemberImpl {
	
	public MemberVO login(String id, String pass);
	

	
}
