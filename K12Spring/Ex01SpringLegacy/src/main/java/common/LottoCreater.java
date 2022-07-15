package common;

import java.util.Random;

public class LottoCreater {

	Random rnd = new Random();
	
	public void randomCreate(int[] arrParam) {
		rnd.setSeed(System.currentTimeMillis());
		while(true) {
			for(int i=0 ; i<arrParam.length ; i++) {
				arrParam[i] = rnd.nextInt(45) + 1;
			}
			boolean rndFlag = false;
			for(int i=0 ; i<arrParam.length ; i++) {
				for(int j=0 ; j<arrParam.length ; j++) {
					if(i!=j && arrParam[i]==arrParam[j]) {
						rndFlag = true;
					}
				}
			}
			if(rndFlag==false) break;
		}
	} 
	public static void bubbleSort(int[] arrParam) {
		int temp;
		for(int i=0 ; i<arrParam.length-1 ; i++) {
			for(int j=0 ; j<(arrParam.length-1)-i ; j++) {
				if(arrParam[j] > arrParam[j+1]) {
					temp = arrParam[j];
					arrParam[j] = arrParam[j+1];
					arrParam[j+1] = temp;
				}
			}
		}
	}	
	public int[] lotto() {
		int[] arr = new int[6];
		randomCreate(arr);		
		bubbleSort(arr);
		return arr;
	}
}
