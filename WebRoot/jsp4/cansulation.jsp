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
<title>��ʦ������</title>
<link rel="stylesheet" type="text/css" href="../css/comm.css"/>
<link rel="stylesheet" type="text/css" href="../css/lisw.css"/>

<link rel="stylesheet" type="text/css" href="../css/jquery.slider.css" />
</head>
<body>

<!--������-->
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
					"�뽫������д����"
				)
			} else { 
					alert(
					"�ύ�ɹ������ǻᾡ��������ϵ"
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
  <a href="../index.html">��վ��ҳ</a>
  <a href="qyjj.html">��������</a>
  <a href="example.html">�ɹ�����</a>
  <a href="list.html">��Ƶ����</a>
  <a href="order.html">����ԤԼ</a>
  <a href="cansulation.html" class="on">������ѯ</a>
  <a href="contact.html">��ϵ����</a>
  <a href="../login.jsp" target="_blank">����ϵͳ</a>
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
<div class="wentel mbot">���</div>
<div class="gstelist">
<a href="qyjj.html"><font>��</font>��������</a>
<a href="order.html"><font>��</font>����ԤԼ</a>
<a href="cansulation.html"><font>��</font>������ѯ</a>
</div>

<div class="wentel mbot top10">��ϵ����</div>
 <div class="lxwmimg"><img src="../image/lxwm.jpg" /></div>
 <div class="lxadr">
<p>
<font>��ַ��</font>
����ʡ�����б�����
</p>
<p>
<font>�绰��</font>
4234563
</p>
<p>
<font>�ֻ���</font>
13608197694
</p>
<p>
<font>���䣺</font>
</p>
<p>
<font>��ϵ�ˣ�</font>

</p>
</div>


</div>
<div class="new_right left">
	
	
	
<div class="casetel"><p>������ѯ</p></div>
<form id="form" action="addCansulation" method="post">
    <table class="table table-striped table-bordered table-condensed">
        <tr>
            <td>���⣺</td>
            <td>
                <input type="text"  style="width:700px;height:20px;" name="title" id="title"/>(��50��)</td>
        </tr>
        <tr>
            <td>���ݣ�</td>
            <td>
                <textarea rows="3" cols="12" style="width:700px;height:140px;" name="question" id="question"></textarea>(��15000��)</td>
        </tr>
        <tr>
            <td>����: </td>
            <td>
                <input type="text"  style="width:700px;height:20px;" name="name" id="name"/></td>
        </tr>
        <tr>
            <td>�绰: </td>
            <td>
                    <input type="text"  style="width:700px;height:20px;" name="phone" id="phone"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input class="btn btn-inverse" id="submitV" type="button" value="�ύ" style="width:70px;height:30px;"/>&nbsp;
                <input class="btn btn-inverse" type="button" id="clear" value="���" style="width:70px;height:30px;"/></td>
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
