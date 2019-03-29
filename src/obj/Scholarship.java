package obj;
// 장학금
public class Scholarship {
	private String type; // 종류
	private int money; // 장학금액
	
	public Scholarship(String type,int money){
			this.setType(type);
			this.setMoney(money);
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}
	
	
}
