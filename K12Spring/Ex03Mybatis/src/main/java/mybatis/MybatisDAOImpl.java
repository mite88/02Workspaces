package mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

/*
해당 인터페이스는 컨트롤러와 DAO사이세넌 매개역할을 하는 서비스객체로 사용된다. 
@Service 어노테이션은 빈을 자동으로 생성하기 위한 용도이지만 여기서는 단순히
역할을 명시하기 위한 표현으로 사용되었다. 따라서 필수사항은 아니다.
 */
@Service
public interface MybatisDAOImpl {
  	
	/*
	방명록에서 게시물의 갯수를 카운트한다. 매개변수가 없으므로 항상 전체 게시물을
	대상으로 카운트한다. 
	 */
	public int getTotalCount();
	/*
	매개변수로 전달된 s, e에 해당하는 게시물을 select하여 List형으로 반환한다. 
	 */
	public ArrayList<MyBoardDTO> listPage(int s, int e);
	
	/*
	@Param 어노테이션을 통해 파라미터를 Mapper에서 사용할 수 있는 별칭을 부여한다. 
	해당 별칭으로 쿼리문의 인파라미터로 사용할 수 있다.
	 */
	public int write(@Param("_name") String name, 
			@Param("_contents") String contents,
			@Param("_id") String id);
	

	
	
	
	
	 
	
	
	
	
	
}