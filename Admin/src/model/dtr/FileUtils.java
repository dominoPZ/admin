package model.dtr;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;




//파일과 관련된 업무처리 로직 클래스]
public class FileUtils {

	//파일업로드 로직]
	public static MultipartRequest upload(
			HttpServletRequest req,
			String saveDirectory){
		MultipartRequest mr = null;
		try {
			System.out.println("fileupload logic");
			mr = new MultipartRequest(
					req,
					saveDirectory,
					1024*2000,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);
		} 
		catch (Exception e) {e.printStackTrace();}
		return mr;
	}/////////////////////////////upload
	
	
	
	
	
}
