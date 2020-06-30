package mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface MybatisDAOImpl {

//	public ArrayList<MyBoardDTO> list();
	
	/*
	 방명록 리스트에서 사용할 메소드를 추상메소드로 정의함.
	 아래 추상메소드를 통해 컨트롤러는 Mapper의 각 엘리먼트를
	 호출하게 된다.
	 */
	public int getTotalCount();
	public ArrayList<MyBoardDTO> listPage(int s, int e);
	
	/*
	 방명록 글쓰기
	 파라미터 전달시 Mapper에서 즉시 사용할 이름을 지정하고 싶을때
	 @Param 어노테이션을 사용한다. 아래와 같이 지정하면 Mapper에서
	 #{_name} 과 같이 사용할 수 있다.
	 */
	public void write(@Param("_name") String name,
			@Param("_contents") String contents,
			@Param("_id") String id);
	
	//수정폼 로딩하기
	public MyBoardDTO view(ParameterDTO parameterDTO);
	
	public int modify(MyBoardDTO myBoardDTO);
	
}
