package com.jjang051.controller;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjang051.model.ClockDao;
import com.jjang051.model.ClockDto;
import com.jjang051.utils.ScriptWriter;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/board/fileupload")
public class FileUploadController extends HttpServlet {
	public FileUploadController() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		
		
		int fileSize = 1024*1024*50; // 한번에 업로드되는 파일 사이즈 최대 용량 
		String encoding = "UTF-8";   // 파일 인코딩 무조건 UTF-8
		DefaultFileRenamePolicy fileRenamePolicy = new DefaultFileRenamePolicy(); // 이름이 중복된 파일의 처리...
		
		String savePath = "uploadClock";
		ServletContext context = this.getServletContext();
		String realPath =  context.getRealPath(savePath);
		
		System.out.println(realPath);
		
		File dir = new File(realPath);
		if(!dir.exists()) {
			dir.mkdir();
		}
		MultipartRequest multipartRequest = 
				new MultipartRequest(request, realPath, fileSize, encoding, fileRenamePolicy);
		
		String title = multipartRequest.getParameter("title");
		String category = multipartRequest.getParameter("category");
		int depth =  Integer.parseInt( multipartRequest.getParameter("depth"));
		int price = Integer.parseInt( multipartRequest.getParameter("price"));
		String originalFile = multipartRequest.getOriginalFileName("file");
		String renameFile = multipartRequest.getFilesystemName("file");
		System.out.println(originalFile+"===="+renameFile);
		
		ClockDto clockDto = new ClockDto();
		ClockDao clockDao = new ClockDao();
		clockDto.setTitle(title);
		clockDto.setCategory(category);
		clockDto.setDepth(depth);
		clockDto.setPrice(price);
		clockDto.setClockImg(originalFile);
		clockDto.setClockRealImg(renameFile);
		int result = clockDao.insertClock(clockDto);
		if(result>0) {
			ScriptWriter.alertAndNext(response, "파일 업로드 성공", "../index/");
		} else {
			ScriptWriter.alertAndBack(response, "파일 업로드 실패");
		}
	}
}








