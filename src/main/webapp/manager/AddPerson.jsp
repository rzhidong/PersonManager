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

<title>添加人员</title>

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
				<a class="navbar-brand"> <span class="h3">添加人员</span>
				</a>
			</div>
		</div>
		<form class="form-horizontal" method="post" action="manager/AddPerson">
			<div class="form-group">
				<label class="control-label col-lg-1"><span style="color:red;">*</span>帐号</label>
				<div class="col-lg-5">
					<input type="text" name="username" class="form-control"
						placeholder="请输入用户名" required="required" maxlength="20"/>
				</div>
				<label class="control-label col-lg-1"><span style="color:red;">*</span>密码</label>
				<div class="col-lg-5">
					<input type="text" name="password" class="form-control"
						placeholder="请输入密码" required="required" maxlength="20"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-lg-1">性别</label>
				<div class="col-lg-5">
					<select name="sex" class="form-control">
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</div>
				<label class="control-label col-lg-1">邮箱</label>
				<div class="col-lg-5">
					<input type="email" name="email" class="form-control"
						placeholder="请输入邮箱" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-lg-1">电话</label>
				<div class="col-lg-5">
					<input type="tel" name="phone" class="form-control"
						placeholder="请输入电话" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-6">
					<button class="btn btn-primary form-control" type="submit">
						<span class="glyphicon glyphicon-plus"></span> 添加
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
