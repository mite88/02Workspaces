package ex16exception;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Ex04MultiCatch {
	/*
	예외처리 시 필요에 따라 여러개의 catch블록을 사용한다
	이경우 반드시 자식 예외클래스부터 추가해야함
	
	Exception클래스는 모든 예외를 catch하기때문에 마지막에 사용해야함
	*/

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int array[] = new int[3];
		
		try {
			for (int i = 0; i < array.length; i++) {
				System.out.print("array["+i+"]에 저장할 숫자입력:");
				array[i] = Integer.parseInt(scanner.nextLine());
			}
			
			System.out.println("배열에 저장된 두 숫자나누기:"+(array[0]/array[1]));
			System.out.print("나이를 입력하세요:");
			int age = scanner.nextInt();
			System.out.println("당신의 나이는:"+age);
			
			array[3] = age;
			
		} catch (InputMismatchException e) {
			System.out.println("숫자로만 입력해야 합니다.");
			
		} catch (ArithmeticException e) {
			System.out.println("산술연산이 불가능 합니다.");
			
		} catch (NumberFormatException e) {
			System.out.println("숫자형태의 문자만 입력가능합니다.");
			
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("배열의 인덱스를 초과하였습니다.");
			
		} catch (Exception e) {
			System.out.println("예외가 발생하였습니다");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		System.out.println("===프로그램 끝===");

	}

}
