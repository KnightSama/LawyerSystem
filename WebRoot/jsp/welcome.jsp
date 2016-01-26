<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Welcome</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type="text/css">
			#code1
			{
				font-weight:bold;
				border:0;
				font-size:40px;
				color:blue;
			}
			#code2
			{
				font-weight:bold;
				border:0;
				font-size:50px;
				color:red;
			}
			#code3
			{
				font-weight:bold;
				border:0;
				font-size:40px;
				color:blue;
			}
		</style>
  </head>
  
  <body>
  	<div style="text-align:center; ">
    <span id="code1">欢迎</span><span id="code2"><s:property value="#session.username"/></span><span id="code3">使用律师行管理系统。</span>
    </div>
    <div style="text-align:center; ">
    <img src="img/front.jpg"/>
    </div>
  </body>
</html>
