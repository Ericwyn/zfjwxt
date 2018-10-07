package z.talent.utils;

import java.util.concurrent.TimeUnit;

import okhttp3.OkHttpClient;

public class okht {
	
	public static OkHttpClient okHttpClient = new OkHttpClient().newBuilder().readTimeout(3, TimeUnit.SECONDS).connectTimeout(3, TimeUnit.SECONDS).followRedirects(false).build();

}
