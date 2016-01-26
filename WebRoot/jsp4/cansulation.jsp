<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'cansulation.jsp' starting page</title>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>律师事务所</title>
<link rel="stylesheet" type="text/css" href="../css/comm.css"/>
<link rel="stylesheet" type="text/css" href="../css/lisw.css"/>

<link rel="stylesheet" type="text/css" href="../css/jquery.slider.css" />
</head>
<body>

<!--右悬浮-->
<script type="text/javascript" src="../css/jquery-1.8.1.min.js"></script>

<script type="text/javascript" src="../css/jquery.slider.min.js"></script>
<script type="text/javascript" src="../css/jquery.nicescroll.js"></script>
<script type="text/javascript" src="../css/jquery.zoomImgRollover.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $(".testimg").zoomImgRollover();
});

	$(function() {
		$('#submitV').click(function() {
			if ($('#title').val() == ""||$('#question').val() == ""||$('#name').val() == ""||$('#phone').val() == "") {
				alert(
					"请将内容填写完整"
				)
			} else { 
					alert(
					"提交成功，我们会尽快与您联系"
				)               								
				$("form").submit();
			}
		});
		
		$('#clear').click(function() {
			$('#title').val('');
			$('#question').val('');
			$('#name').val('');
			$('#phone').val('');
		})
	})
</script>
<script type="text/javascript">
$(document).ready(function($){
  var $width=window.screen.width;
  var $height;
  
 if ($.browser.msie && $.browser.version <= 6.0) {
  $height=700;
}else{
	
 if($width>=1440){
  $height=document.documentElement.clientHeight;
  }else{
	  $height=700;
	  }
}
	$(".slider").slideshow({
		width      : $width,
		height     : $height,
		transition : ['explode', 'square','Rain','squareRandom']
		//transition:'explode/square'
	});
});
</script>

<div class="flash theme-default" >
    
	<div class="slider">
		<div><img src="../image/s1.jpg" alt="" width="100%" height="100%"/></div>
		<div><img src="../image/s2.jpg" alt="" width="100%" height="100%"/></div>
        <div><img src="../image/s3.jpg" alt="" width="100%" height="100%"/></div>
	</div> 
</div>



  <div class="headtopnb"> 
  <div class="zsp1"><img src="../image/guaj.jpg" /></div>
  <div class="zsp2"><img src="../image/guaj2.jpg" /></div>
<div class="menuw">
  <div class="logo left"><img src="../image/logo.jpg" /></a></div>
  <div class="menulist left">
  <a href="../index.html">网站首页</a>
  <a href="qyjj.html">关于我们</a>
  <a href="example.html">成功案例</a>
  <a href="list.html">视频资料</a>
  <a href="order.html">事务预约</a>
  <a href="cansulation.html" class="on">法律咨询</a>
  <a href="contact.html">联系我们</a>
  <a href="../login.jsp" target="_blank">管理系统</a>
  </div>
 <div class="clear"></div> 
<div class="clear"></div>
</div>  

  </div>

<script language="javascript">
$(document).ready(function(){
 $(".gpic").mouseover(function(){
	 $(".gpw").slideDown();

	 }).mouseleave(function(){
	 $(".gpw").slideUp();	 
	 })
	
	})

</script>



<div id="counter2">
   <div class="counter">
<script language="javascript">
$(document).ready(function(){
	$(".gstelist a").mouseover(function(){
		$(this).stop().animate({paddingLeft:5},500)
		}).mouseout(function(){
		$(this).stop().animate({paddingLeft:0},500)	
			})
	})
</script>

<div class="new_left left">
<div class="wentel mbot">类别</div>
<div class="gstelist">
<a href="qyjj.html"><font>·</font>关于我们</a>
<a href="order.html"><font>·</font>事务预约</a>
<a href="cansulation.html"><font>·</font>法律咨询</a>
</div>

<div class="wentel mbot top10">联系我们</div>
 <div class="lxwmimg"><img src="../image/lxwm.jpg" /></div>
 <div class="lxadr">
<p>
<font>地址：</font>
江苏省无锡市滨湖区
</p>
<p>
<font>电话：</font>
4234563
</p>
<p>
<font>手机：</font>
13608197694
</p>
<p>
<font>邮箱：</font>
</p>
<p>
<font>联系人：</font>

</p>
</div>


</div>
<div class="new_right left">
	
	
	
<div class="casetel"><p>法律咨询</p></div>
<form id="form" action="addCansulation" method="post">
    <table class="table table-striped table-bordered table-condensed">
        <tr>
            <td>标题：</td>
            <td>
                <input type="text"  style="width:700px;height:20px;" name="title" id="title"/>(限50字)</td>
        </tr>
        <tr>
            <td>内容：</td>
            <td>
                <textarea rows="3" cols="12" style="width:700px;height:140px;" name="question" id="question"></textarea>(限15000字)</td>
        </tr>
        <tr>
            <td>姓名: </td>
            <td>
                <input type="text"  style="width:700px;height:20px;" name="name" id="name"/></td>
        </tr>
        <tr>
            <td>电话: </td>
            <td>
                    <input type="text"  style="width:700px;height:20px;" name="phone" id="phone"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input class="btn btn-inverse" id="submitV" type="button" value="提交" style="width:70px;height:30px;"/>&nbsp;
                <input class="btn btn-inverse" type="button" id="clear" value="清空" style="width:70px;height:30px;"/></td>
        </tr>
    </table>
</form>
</div>

<div class="clear"></div>
</div>
</div>

</body>
</html>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    This is my JSP page. <br>
  </body>
</html>
