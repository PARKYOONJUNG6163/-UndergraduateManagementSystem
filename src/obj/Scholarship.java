package obj;
// ���б�
public class Scholarship {
	private String type; // ����
	private int money; // ���бݾ�
	
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
