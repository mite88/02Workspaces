package autoscan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LottoService {
	
	public LottoService() {
		System.out.println("LottoService생성자호출");
	}
	
	@Autowired
	LottoDAO lottoDAO =null;

	public LottoVO getLottoProcess(int lottoNum, LottoVO lottoVO) {
		int randomNumber = lottoDAO.getLottoNumber();
		lottoVO.setRendomLottoNum(randomNumber);
		
		System.out.println("---난수 : "+randomNumber);
		System.out.println("---입력한 수 : "+lottoNum);
		
		if(randomNumber == lottoNum) {
			lottoVO.setResult("추카추카!!!");
		}else {
			lottoVO.setResult("다음기회에!!!");
		}
		return lottoVO;
	}

}
