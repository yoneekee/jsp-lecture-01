package com.jjang051.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/board/fileUpload")
public class FileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FileUploadController() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String savePath = "upload";
		ServletContext context = this.getServletContext(); // 이 프로젝트의 경로
		String realPath = context.getRealPath(savePath);
		
		int maxFileSize = 1024 * 1024 * 50; // 50메가
		String encoding = "UTF-8";
		DefaultFileRenamePolicy fileRenamePolicy = new DefaultFileRenamePolicy(); // cos.jar가 제공해주는 policy
		
		File dir = new File(realPath);
		if(!dir.exists()) {
			//저장경로로 해 둔 폴더가 없으면 만들어라
			dir.mkdir();
		}
		
		// 1.request 2.파일저장경로 3.파일사이즈 4.인코딩 5.중복파일이름처리
		MultipartRequest multipartRequest = 
				new MultipartRequest(request, realPath, maxFileSize, encoding, fileRenamePolicy);
		
		
		String title = multipartRequest.getParameter("title");
		String originalFile = multipartRequest.getOriginalFileName("file");
		String renameFile = multipartRequest.getFilesystemName("file");
		
		System.out.println("title : " + title + " / originalFile : " + originalFile + " / renameFile : " + renameFile);
	}

}
