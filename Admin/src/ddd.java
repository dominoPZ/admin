import java.io.IOException;

public class ddd {
	

	
	
	public static void main(String[] args) throws IOException {
		int randomNo = (int)(Math.random()*(9)+1);
		System.out.println(randomNo);
		while(true){
		System.out.println("숫자를 입력하세요");
		int in = System.in.read()-48;
			System.in.skip(2);
			
			if(randomNo>in)
				System.out.println("업");
			else if(randomNo<in) System.out.println("다운");
			else{
				System.out.println("정답입니다.");
				break;
			}
		}
		
		
		
	}
	
}
