package com.manager.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.manager.action.IPageBeanAction;
import com.manager.action.impl.PageBeanActionImpl;
import com.manager.bean.PageBean;
import com.manager.enity.PersonEnity;

public class PageServlet extends HttpServlet {
	
	private IPageBeanAction pageBeanAction = new PageBeanActionImpl();
	
	/**
	 * Constructor of the object.
	 */
	public PageServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 1、获取当前页参数,(第一次访问当前页为null)
			String currentPageTemp = request.getParameter("currentPage");
			
			//判断
			if ("".equals(currentPageTemp) || currentPageTemp == null) {
				// 第一次访问，设置当前页为1
				currentPageTemp = "1";
			}
			
			int currentPage = Integer.parseInt(currentPageTemp);
			
			// 2、创建PageBean对象，设置当前页参数，传入action方法参数
			PageBean<PersonEnity> pageBean = new PageBean<PersonEnity>();
			pageBean.setCurrentPage(currentPage);
			
			// 3、调用service,填充数据
			pageBeanAction.getAll(pageBean);
			
			// 4、保存pageBean 对象到request域中
			request.setAttribute("pageBean", pageBean);
			
			
			// 5、跳转
			request.getRequestDispatcher("/list.jsp").forward(request,
					response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
