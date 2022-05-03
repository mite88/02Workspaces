package ex08Class;
/*
구슬치기 하는 아이들을 추상화하여 클래스로 정의해보자.
*어린아이가 보유하고 있는 구슬의 개수 정보를 담는다
*놀이를 통해 구슬을 획득 또는 상실하는 것을 표현한다.
*어린이의 현재 보유하고 있는 구슬의 개수를 표현한다.
초기화는 다음과 같이 진행한다.
◆어린이1의 보유갯수 : 구슬 20개
◆어린이2의 보유갯수 : 구슬 15개
게임은 다음과 같이 진행한다.
◆1차게임 : 어린이1은 어린이2의 구슬 5개를 획득한다.
◆2차게임 : 어린이2는 어린이1의 구슬 9개를 획득한다.
# 어린이 객체를 생성시 구슬의 보유갯수는 생성자를 통해 초기화 되어야 한다.

*/
class ChildProperty{

	int bead_count;

	//생성자
	public ChildProperty(int bead_count) {
		this.bead_count = bead_count;
	}

	public void showProperty() {
		System.out.println(bead_count+"개");
	}

	//구슬치기 게임중 - 상대어린이, 가져간갯수
	public void obtainBead(ChildProperty child, int count) {

		//가져갈려는 구슬수가 상대편이 가진구슬수보다 많이가져가면…
		if(child.bead_count < count) {
			//System.out.println("child.bead_count:"+child.bead_count);
			//System.out.println("count:"+count);
			
			bead_count=bead_count+child.bead_count; 
			//해당어린이는 지금구슬수에서 상대방구슬갯수만큼더함
			child.bead_count= 0 ; //상대편은 구슬이없음
		}else {
			bead_count+=count; //해당어린이는 구슬획득
			child.bead_count-= count ; //상대편은 구슬을 잃고
		}
		
	}
	
}

public class QuMarbles {
	public static void main(String[] args)
	{        	
		ChildProperty child1 = new ChildProperty(20);
		ChildProperty child2 = new ChildProperty(15);

		System.out.println("게임 전 구슬의 보유 개수");
		System.out.print("어린이1 : ");
		child1.showProperty(); 
		System.out.print("어린이2 : ");
		child2.showProperty(); 
	
		/*1차게임 : 어린이1은 어린이2의 구슬 5개 획득*/
		child1.obtainBead(child2, 5);
	
		/*2차게임 : 어린이2가 어린이1의 구슬 9개 획득*/
		child2.obtainBead(child1, 9);
	
		System.out.println("\n게임 후 구슬의 보유 개수");
		System.out.print("어린이1 : ");
		child1.showProperty(); 
		System.out.print("어린이2 : ");
		child2.showProperty();
	}


}
