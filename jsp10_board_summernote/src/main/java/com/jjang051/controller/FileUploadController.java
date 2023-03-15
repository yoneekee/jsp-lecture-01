package com.jjang051.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.jjang051.utils.ScriptWriter;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
@WebServlet("/board/summernoteFileUpload")
public class FileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FileUploadController() {
        super();
    }

	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		int maxFileSize = 1024*1024*50; // 50메가
		String encoding = "UTF-8";
		DefaultFileRenamePolicy fileRenamePolicy = new DefaultFileRenamePolicy();
		
		String savePath = "summerNoteUpload";// 저장할 폴더 이름
		ServletContext context = this.getServletContext();
		String realPath = context.getRealPath(savePath);
		File dir = new File(realPath);
		if(!dir.exists()) {
			dir.mkdir();
		}
		MultipartRequest mutipartRequest = 
				new MultipartRequest(request, realPath, maxFileSize, 
						encoding, fileRenamePolicy);
		
		String fileRealName = 
				mutipartRequest.getFilesystemName("uploadFile"); // 중복된 이름 처리하는 곳
		
		
		System.out.println(fileRealName);
		
		
		String fileUploadedUrl =  
				"/jsp10_board_summernote/"+savePath+"/"+fileRealName;
		HashMap<String, String> fileUrlMap = new HashMap<>();
		fileUrlMap.put("fileUrl",fileUploadedUrl);
		Gson gson = new Gson();
		String fileUrl = gson.toJson(fileUrlMap);
		request.setAttribute("fileUrl", fileUrl);
		RequestDispatcher dispatcher = 
		request.getRequestDispatcher("/WEB-INF/board/summernoteFileUpload.jsp");
		dispatcher.forward(request, response);
		//json으로 응답예정
		
	}
}





