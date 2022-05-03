package ex05method;

import java.util.Scanner;

public class QuTemperature {

	/*
	섭씨(Celsius)를 입력받아서 화씨(Fahrenheit)로 변환하여 
	리턴하는 함수와 화씨를 입력받아서 섭씨로 변환하여 리턴하는 함수를 만들어라. 
	함수명은 본인이 결정하면 된다. 

	공식]섭씨에서 화씨로
	화씨 = 1.8 * 섭씨 + 32
	섭씨 = (화씨 - 32) / 1.8

	*/
	public static void main(String[] args) {
		Scanner scanner =new Scanner(System.in);
		System.out.print("섭씨입력:");
		double celsius=scanner.nextDouble();
		
		System.out.print("화씨입력:");
		double fahrenhei=scanner.nextDouble();
		
		System.out.println("씨에서 화씨로 변경: " + celsiusToFahrenheit(celsius));
		System.out.println("화씨에서 섭씨로 변경: " + fahrenheiToCelsius(fahrenhei));

	}
	
	static double celsiusToFahrenheit(double celcius) {
		return 1.8 * celcius + 32;
	}
	static double fahrenheiToCelsius(double fahrenheit) {
		return (fahrenheit - 32) / 1.8;
	}


}
