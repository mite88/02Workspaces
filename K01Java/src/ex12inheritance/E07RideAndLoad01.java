package ex12inheritance;
/*
상속관계에서 오버로딩 vs 오버라이딩
오버로딩 : 메서드명은 같지만 매개변수가 다른경우
오버라이딩 : 상속에서 하위 클래스에서 재정의 한것, 
             부모의 메서드형태가 동일함,
             상위메서드는 가려지게되며
             항상 최하의 클래스의 메서드를 호출(덮어씀)
             즉, 참조변수의 타입에 영향이없음
*/
class A{
    //public A(){}
    public void redeMethod() {
        System.out.println("A의 redeMethod");
    }
    
    public void loadMethod() {
        System.out.println("A의 loadMethod");
    }
}
 
class B extends A{
    //public B(){super();}
    @Override
    public void redeMethod() {
        System.out.println("B의 redeMethod");
    }
    
    public void loadMethod(int num) {
        System.out.println("B의 loadMethod");
    }
}
 
class C extends B{
    //redeMethod()는 오버라이딩 된 메서드로 상위 클래스의 형태와 동일
    
    //public C(){super();}
    @Override
    public void redeMethod() {
        System.out.println("C의 redeMethod");
    }
    
    /*
    loadMethod()는 오버로딩 된 메서드로 
    상위클래스에 정의된 메서드의 매개변수의 타입 및 갯수가 다름
    */
    public void loadMethod(double num) {
        System.out.println("C의 loadMethod");
    }
    
    /*
     C클래스로 객체생성시 
     오버라이딩 된 메서드는 가려짐 =>C만남음
     오버로딩된 메서드는 전부존재
     */
}
 
public class E07RideAndLoad01 {
 
    public static void main(String[] args) {
 
        //부모타입의 참조변수로 자식객체를 참조가능
        A ref1 = new C();
        B ref2 = new C();
        C ref3 = new C();
        
        /*
        오버라이딩 되면 전부가려져 
        참조변수에 상관없이 최하위클래스인C만 남음
        */
        System.out.println("오버라이딩 처리된 메서드");
        ref1.redeMethod();
        ref2.redeMethod();
        ref3.redeMethod();
        
        /*
        각각의 접근범위(접근범위 최하단 클래스가 넓음)
        ref3 : C(A,B)
        ref2 : B(A)
        ref1 : A
        */
        System.out.println("오버로딩 처리된 메서드");
        ref3.loadMethod();
        ref3.loadMethod(1);
        ref3.loadMethod(1.1);
        
        ref2.loadMethod();
        ref2.loadMethod(1);
        //ref2.loadMethod(1.1);
        
        ref1.loadMethod();
        //ref1.loadMethod(1);
        //ref1.loadMethod(1.1);
             
        System.out.println("=======================");
        A refNum1 = new B(); //A가부모
        A refNum2 = new C();  //참조
        B refNum3 = new C();  //참조
        
        C refAddr1 = new C(); //동일
        B refAddr2= refAddr1;  //B ->C o
        A refAddr3= refAddr1; //A -> C x
        
             //이 3줄의 경우 접근범위가 A 
        A refId1 = new C();//A -> C  o
        //B refId2 = refId1;//B -> A x
        //C refId3 = refId1; //C -> A x

        //형변환 (다운캐스팅)
        B refId2 = (B)refId1; //A -> B 다운캐스팅
        C refId3 = (C)refId1; //A -> C 다운캐스팅
    }
}