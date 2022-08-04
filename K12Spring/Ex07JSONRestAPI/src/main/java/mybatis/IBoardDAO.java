package mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface IBoardDAO {
	

	public int getTotalCount(ParameterDTO parameterDTO);
	public ArrayList<BoardDTO> listPage(ParameterDTO parameterDTO);
	public ArrayList<BoardDTO> view(ParameterDTO parameterDTO);
	
}
