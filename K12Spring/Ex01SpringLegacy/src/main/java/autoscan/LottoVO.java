package autoscan;

public class LottoVO {
	private int userLottoNum;
	private int rendomLottoNum;
	private String result;
	
	public LottoVO() {
		System.out.println("LottoVO Create object");
	}
	public int getUserLottoNum() {
		return userLottoNum;
	}
	public void setUserLottoNum(int userLottoNum) {
		this.userLottoNum = userLottoNum;
	}
	public int getRendomLottoNum() {
		return rendomLottoNum;
	}
	public void setRendomLottoNum(int rendomLottoNum) {
		this.rendomLottoNum = rendomLottoNum;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	
}
