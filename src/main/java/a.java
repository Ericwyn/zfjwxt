import java.time.LocalDateTime;
import java.util.Date;

public class a {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		LocalDateTime localdatetime=LocalDateTime.now();
		int i = localdatetime.getYear();
		int m = localdatetime.getMonth().getValue();
		System.err.println(localdatetime.getYear());
		System.err.println();
	}

}
