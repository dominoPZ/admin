package controller.lyj;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

// 파일과 관련된 업무처리 로직 클래스
public class FileUtils {

	// 파일업로드 로직]
	public static MultipartRequest upload(HttpServletRequest req, String saveDirectory){
		MultipartRequest mr = null;
		req.setAttribute("page", "event");
		try {
			mr = new MultipartRequest(
					 (HttpServletRequest) req,
					 saveDirectory,
					 1024*5000000,
					 "UTF-8",
					 new DefaultFileRenamePolicy()
					);
		} catch (Exception e) {e.printStackTrace();}
		return mr;
	}//////////////////////////////upload
	// 파일 삭제 로직
	public static void deleteFile(HttpServletRequest req, String directory, String original){
		req.setAttribute("page", "event");
		directory = "E:\\LYJ\\JAVA\\WorkSpace\\Admin\\WebContent\\EventImage";
		// 서버의 물리적 경로 얻기
		String saveDirectory = "E:\\LYJ\\JAVA\\WorkSpace\\Admin\\WebContent\\EventImage";
		// 파일 객체 생성
		File file = new File(saveDirectory+File.separator+original);
		// 파일 존재여부 판단 후 삭제
		if(file.exists()) file.delete();
	
	}//////////////////deleteFile()
	
}
