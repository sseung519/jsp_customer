package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import DAO.CustomerDAO;
import DTO.Customer;



@WebServlet("/")
@MultipartConfig(maxFileSize=1024*1024*50, location="/Users/sseung/Desktop/project/Temp/profile_img")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CustomerDAO dao;
    private ServletContext ctx;
    
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new CustomerDAO();
		ctx = getServletContext();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //request 객체 한글깨짐 방지
		String command = request.getServletPath();
		String site = null;
		
		System.out.println("command: " + command);
		
		switch (command) {
		case "/index" : site = getList(request); break;
		case "/view" :  site = getView(request); break;
		case "/register" : site = "register.jsp"; break;
		case "/insert" : site = insertCustomer(request); break;
		case "/edit" : site = getViewForEdit(request); break;
		case "/update" : site = updateCustomer(request); break;
		case "/delete" : site = deleteCustomer(request); break;
		}
		
		if(site.startsWith("redirect:/")){ //redirect 처리
			String rview = site.substring("redirect:/".length()); //index: 10
			response.sendRedirect(rview); //rview: /index
		}else { //forward 처리
			ctx.getRequestDispatcher("/" + site).forward(request, response);
		}
	}
	
	//고객리스트
	public String getList(HttpServletRequest request) {
		List<Customer> list;
		
		try {
			list = dao.getList();
			request.setAttribute("customerList", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "index.jsp";
	}
    
	//고객 상세 정보
	public String getView(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			Customer c = dao.getView(id);
			request.setAttribute("customer", c);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "고객정보를 정상적으로 불러오지 못했습니다.");
		}
		
		return "view.jsp";
	}

	
	//고객 등록
	public String insertCustomer(HttpServletRequest request) {
		Customer c = new Customer();
		
		try {
			BeanUtils.populate(c, request.getParameterMap());
			
			//1. 이미지 파일 서버(/Users/sseung/Desktop/project/Temp/img)컴퓨터에 저장
			Part part = request.getPart("file"); //파일에 대한 정보
			String fileName = getFileName(part); //파일명 얻음
			
			if(fileName != null && !fileName.isEmpty()) { //fileName이 null이 아니고 length()도 0이 아니라면
				part.write(fileName); //write(): 파일을 서버에 업로드함
			
			
				//2. 경로를 포함한 이미지 파일 이름을 Customer객체에 저장
				c.setImg("/img/" + fileName);
			} else {
				c.setImg("/img/default.jpeg"); //업로드한 이미지가 없을 경우 빈문자열 저장
			}
			
			dao.insertCustomer(c);
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				//쿼리스트링의 한글깨짐을 방지하기 위해 UTF-8로 인코딩
				String encodeName = URLEncoder.encode("고객이 정상적으로 등록되지 않았습니다!", "UTF-8");
				return "redirect:/index?error=" + encodeName;
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		} 
		
		return "redirect:/index"; 
	}
	
	//수정할 고의 기존 데이터를 가지고 와서 request 객체에 넣어준다.
	public String getViewForEdit(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			Customer c = dao.getView(id);
			request.setAttribute("customer", c);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "edit.jsp";
	}
	
	//고객 정보 수정
	public String updateCustomer(HttpServletRequest request) {
		Customer c = new Customer();
		
		String origin_file = request.getParameter("origin_file");
		
		try {
			BeanUtils.populate(c, request.getParameterMap());
			
			//1. 이미지 파일 서버(/Users/sseung/Desktop/project/Temp/img)컴퓨터에 저장
			Part part = request.getPart("file"); //파일에 대한 정보
			String fileName = getFileName(part); //파일명 얻음
			
			
			if(fileName != null && !fileName.isEmpty()){
				part.write(fileName);  //서버에 파일 업로드
				c.setImg("/img/" + fileName);					
			}else { //업로드된 파일이 없을때
				if(origin_file == null || origin_file.equals("")) {
				}else {
					c.setImg(origin_file);
				}
			}
			
			dao.updateCustomer(c);
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				//쿼리스트링의 한글깨짐을 방지하기 위해 UTF-8로 인코딩
				String encodeName = URLEncoder.encode("게시물이 정상적으로 수정되지 않았습니다!", "UTF-8");
				return "redirect://view?board_no="+c.getId()+"&error=" + encodeName;
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		} 
		
		return "redirect:/view?id=" + c.getId();
	}

	//고객 삭제
	public String deleteCustomer(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			dao.deleteCustomer(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
		
			e.printStackTrace();
			try {
				//쿼리스트링의 한글깨짐을 방지하기 위해 UTF-8로 인코딩
				String encodeName = URLEncoder.encode("고객정보가 정상적으로 삭제되지 않았습니다!", "UTF-8");
				return "redirect://index?error=" + encodeName;
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		return "redirect:/index";
	}
	
	//파일에서 이미지명을 추출하는 메소드
		private String getFileName(Part part) {
			String fileName = null;
			//파일이름이 들어있는 헤더영역을 가지고옴
			String header = part.getHeader("content-disposition");
			//form-data; name="img", filename="사진5.jpg"
			System.out.println("Header => " + header);
			
			//파일 이름이 들어있는 속성부분의 시작위치(인덱스 번호)를 가지고옴
			int start = header.indexOf("filename=");
			//쌍따옴표 사이의 값 부분만 가져온다. fileName=" 10 header의 길이-1 하여 "전까지
			fileName = header.substring(start + 10, header.length() - 1);
			return fileName;
		}
}
