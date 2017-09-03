package com.manager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.manager.action.IPersonAction;
import com.manager.action.impl.PersonActionImpl;
import com.manager.enity.PersonEnity;

public class PersonServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	IPersonAction personAction = new PersonActionImpl();

	/**
	 * Constructor of the object.
	 */
	public PersonServlet() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getRequestURI().endsWith("/ViewPerson")) {
			request.getRequestDispatcher("/manager/ViewPerson.jsp").forward(
					request, response);
		} else if (request.getRequestURI().endsWith("/AddPerson")) {
			doAddPerson(request, response);
		} else if (request.getRequestURI().endsWith("/UpdatePerson")) {
			doUpdatePerson(request, response);
		} else if (request.getRequestURI().endsWith("/DeletePerson")) {
			doDeletePerson(request, response);
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

	public void doAddPerson(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		PersonEnity personEnity = new PersonEnity();

		personEnity.setUserName(request.getParameter("username"));
		personEnity.setPassWord(request.getParameter("password"));
		personEnity.setSex(request.getParameter("sex"));
		personEnity.setEmail(request.getParameter("email"));
		personEnity.setPhone(request.getParameter("phone"));

		personAction.insertPerson(personEnity);

		response.sendRedirect("index.jsp");

	}

	public void doUpdatePerson(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		PersonEnity personEnity = new PersonEnity();

		personEnity.setId(Integer.parseInt(request.getParameter("id")));
		personEnity.setUserName(request.getParameter("username"));
		personEnity.setPassWord(request.getParameter("password"));
		personEnity.setSex(request.getParameter("sex"));
		personEnity.setEmail(request.getParameter("email"));
		personEnity.setPhone(request.getParameter("phone"));

		personAction.updatePerson(personEnity);

		response.sendRedirect("index.jsp");

	}

	public void doDeletePerson(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		personAction.deletePerson(Integer.parseInt(request.getParameter("id")));

		response.sendRedirect("index.jsp");
	}

}
