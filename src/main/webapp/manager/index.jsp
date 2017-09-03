<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="com.manager.enity.PersonEnity" %>
<%@ page import="com.manager.action.IPersonAction" %>
<%@ page import="com.manager.action.impl.PersonActionImpl" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>人员管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>

<body>
	<div class="container">
		<div class="navbar navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand" href="manager"> <span
					class="glyphicon glyphicon-user"></span>
					人员管理系统
				</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a
					href="manager/AddPerson.jsp"
					class="btn btn-default"> <span class="glyphicon glyphicon-plus"></span>添加人员
				</a></li>
			</ul>
		</div>
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr class="info">
					<th>ID</th>
					<th>用户名</th>
					<th>密码</th>
					<th>性别</th>
					<th>邮箱</th>
					<th>电话</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<%
					IPersonAction personAction = new PersonActionImpl();
					List<PersonEnity> list = personAction.getAllPersons();
					for (int i = 0; i < list.size(); i++) {
						PersonEnity personEnity = list.get(i);
				%>
				<tr>
					<td><label class="control-label"><%=personEnity.getId()%></label></td>
					<td><label class="control-label"><%=personEnity.getUserName()%></label></td>
					<td><label class="control-label"><%=personEnity.getPassWord()%></label></td>
					<td><%=personEnity.getSex()%></td>
					<td><%=personEnity.getEmail()%></td>
					<td><%=personEnity.getPhone()%></td>
					<td align="center"><a
						href="manager/ViewPerson?id=<%=personEnity.getId() %>"
						class="btn btn-success"> <span
							class="glyphicon glyphicon-zoom-in "></span>查看
					</a> <a
						href="manager/UpdatePerson.jsp?id=<%=personEnity.getId() %>"
						class="btn btn-info"> <span class="glyphicon glyphicon-edit"></span>修改
					</a> <a
						href="manager/DeletePerson?id=<%=personEnity.getId() %>"
						class="btn btn-danger" onclick="return confirm('您确定要删除吗？');">
							<span class="glyphicon glyphicon-trash"></span>删除
					</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>

</body>
</html>
