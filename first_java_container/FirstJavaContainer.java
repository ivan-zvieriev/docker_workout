import java.util.Scanner;

public class FirstJavaContainer {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		System.out.println("Starting");
		for (int i=0; i<3; i++) {
			System.out.println("Enter your name: ");
			String s = in.nextLine();
			System.out.println("Hello " + s);
		}
	}
}