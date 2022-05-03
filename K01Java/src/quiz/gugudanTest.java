package quiz;

public class gugudanTest {

	public static void main(String[] args) {

		String count = "";
		int result = 0;

		for (int j = 2; j < 10; j++) {
			for (int i = 0; i < 9; i++) {

				if (i != 0) {
					count += j;
					result = (int) Math.pow(j,  (i + 1))  ;
					System.out.println(count + "=" + result);
				} else {
					count += j;
					System.out.println(j + "*" + (i + 1) + "=" + (j * (i + 1)) );
				}
				if (i < 9) {
					count += "*";
				}

			}
			count ="";
		}

	}

}
