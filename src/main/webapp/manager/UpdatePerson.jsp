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

<title>修改人员</title>

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
	<%
		IPersonAction personAction = new PersonActionImpl();
		int id = Integer.parseInt(request.getParameter("id"));
		PersonEnity personEnity = personAction.getOnePerson(id);
	%>
	<div class="container">
		<div class="navbar navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand"> <span class="h3">修改人员</span>
				</a>
			</div>
		</div>
		<form class="form-horizontal" method="post"
			action="manager/UpdatePerson">
			<div class="form-group">
				<label class="control-label col-lg-1">ID</label>
				<div class="col-lg-5">
					<input type="text" name="id" value="<%=personEnity.getId()%>"
						class="form-control" maxlength="20" readonly="readonly" />
				</div>
				<label class="control-label col-lg-1">帐号</label>
				<div class="col-lg-5">
					<input type="text" name="username"
						value="<%=personEnity.getUserName()%>" class="form-control"
						maxlength="20" readonly="readonly" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-lg-1">密码</label>
				<div class="col-lg-5">
					<input type="text" name="password"
						value="<%=personEnity.getPassWord()%>" class="form-control" />
				</div>
				<label class="control-label col-lg-1">性别</label>
				<div class="col-lg-5">
					<select name="sex" class="form-control">
						<%
							if (personEnity.getSex().toString().equals("男")) {
						%>
						<option value="男" selected="selected">男</option>
						<option value="女">女</option>
						<%
							} else {
						%>
						<option value="男">男</option>
						<option value="女" selected="selected">女</option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-lg-1">邮箱</label>
				<div class="col-lg-5">
					<input type="text" name="email" value="<%=personEnity.getEmail()%>"
						class="form-control" />
				</div>
				<label class="control-label col-lg-1">电话</label>
				<div class="col-lg-5">
					<input type="text" name="phone" value="<%=personEnity.getPhone()%>"
						class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-6">
					<button class="btn btn-primary form-control" type="submit">
						<span class="glyphicon glyphicon-plus"></span>更新
					</button>
				</div>
				<div class="col-lg-6">
					<a class="btn btn-info form-control" href="manager">返回</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
