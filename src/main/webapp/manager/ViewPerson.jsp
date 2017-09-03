<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="com.manager.enity.PersonEnity"%>
<%@ page import="com.manager.action.IPersonAction"%>
<%@ page import="com.manager.action.impl.PersonActionImpl"%>

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

<title>查看人员</title>

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
				<a class="navbar-brand"> <span class="h3">查看人员</span>
				</a>
			</div>
		</div>
		<%
			IPersonAction personAction = new PersonActionImpl();
			int id = Integer.parseInt(request.getParameter("id"));
			PersonEnity personEnity = personAction.getOnePerson(id);

			if (personEnity != null) {
		%>
		<form class="form-horizontal" method="post"
			action="${pageContext.request.contextPath}/manager/ViewPerson">
			<div class="form-group">
				<label class="control-label col-lg-1">ID</label>
				<div class="col-lg-5">
					<input type="text" value="<%=personEnity.getId()%>"
						disabled="disabled" class="form-control" />
				</div>
				<label class="control-label col-lg-1">帐号</label>
				<div class="col-lg-5">
					<input type="text" value="<%=personEnity.getUserName()%>"
						disabled="disabled" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-lg-1">密码</label>
				<div class="col-lg-5">
					<input type="text" value="<%=personEnity.getPassWord()%>"
						disabled="disabled" class="form-control" />
				</div>
				<label class="control-label col-lg-1">性别</label>
				<div class="col-lg-5">
					<input type="text" value="<%=personEnity.getSex()%>"
						disabled="disabled" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-lg-1">邮箱</label>
				<div class="col-lg-5">
					<input type="text" value="<%=personEnity.getEmail()%>"
						disabled="disabled" class="form-control" />
				</div>
				<label class="control-label col-lg-1">电话</label>
				<div class="col-lg-5">
					<input type="text" value="<%=personEnity.getPhone()%>"
						disabled="disabled" class="form-control" />
				</div>
			</div>
		</form>
		<%
			} else {
		%>
		<label class="control-label h2">ID=<%=id%> 不存在或已删除
		</label>
		<%
			}
		%>
		<div class="form-group">
			<a class="btn btn-info form-control" href="manager">返回</a>
		</div>
	</div>
</body>
</html>
