package ex13interface;

abstract class Bird{

    public abstract void sing();

    public void fly(){
        System.out.println("날다.");
    }
}
class Duck extends Bird{
@Override
    public void sing() {
        System.out.println("꽥꽥!!");
    }
}
public class test { 
    public static void main(String[] args) {
        Duck duck = new Duck();
        duck.sing();
        duck.fly();

        //Bird b = new Bird();
    }   
}