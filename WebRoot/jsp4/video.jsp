<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>��ʦ������</title>
<link rel="stylesheet" type="text/css" href="../css/comm.css"/>
<link rel="stylesheet" type="text/css" href="../css/lisw.css"/>

<link rel="stylesheet" type="text/css" href="../css/jquery.slider.css" />
<s:set name="video_address" value="address" scope="page"/>
<%
   String address = (String)pageContext.getAttribute("video_address");
	String video_path = basePath+"video/"+address;
 %>
 <script src="../Scripts/swfobject.js" type="text/javascript"></script>
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
  <a href="qyjj.html" >��������</a>
  <a href="example.html" >�ɹ�����</a>
  <a href="list.html" class="on">��Ƶ����</a>
  <a href="order.html" >����ԤԼ</a>
  <a href="cansulation.html" >������ѯ</a>
  <a href="contact.html">��ϵ����</a>
  <a href="../login.jsp" target="_blank">����ϵͳ</a>
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



<div class="casetelgsjs"><p>&nbsp;</p></div>
<div  id="CuPlayer" align="center"/>




</div>
<script src="../js/jquery.nicescroll.js"></script>
<script>
$(".newcontext").niceScroll({  
cursorcolor:"#08699a",  
cursoropacitymax:1,  
touchbehavior:true,  
cursorwidth:"5px",  
cursorborder:"0",  
cursorborderradius:"5px"  
}); 
</script>


<script type="text/javascript">
var so = new SWFObject("CuPlayerMiniV4.swf","CuPlayerV4","600","410","9","#000000");
so.addParam("allowfullscreen","true");
so.addParam("allowscriptaccess","always");
so.addParam("wmode","opaque");
so.addParam("quality","high");
so.addParam("salign","lt");
so.addVariable("CuPlayerSetFile","CuPlayerSetFile.xml"); //�����������ļ���ַ,��SetFile.xml��SetFile.asp��SetFile.php��SetFile.aspx
so.addVariable("CuPlayerFile","<%=video_path%>"); //��Ƶ�ļ���ַ
so.addVariable("CuPlayerImage","../image/start.jpg");//��Ƶ����ͼ,��ͼƬ�ļ�������ȷ
so.addVariable("CuPlayerWidth","600"); //��Ƶ���
so.addVariable("CuPlayerHeight","410"); //��Ƶ�߶�
so.addVariable("CuPlayerAutoPlay","no"); //�Ƿ��Զ�����
so.write("CuPlayer");
</script>


</div>

</div>

<div class="clear"></div>

</div>
</div>



<script language="javascript">
$(document).ready(function(){
 $(".dbfx a").mouseover(function(){
    $(this).children(".img").stop().animate({marginTop:"0px"},300)
	}).mouseleave(function(){
   $(this).children(".img").stop().animate({marginTop:"-33px"},300)
	 })
	
	})

</script>

<div class="dblist">
 <div class="opty">
 <div class="dbfx"></div>      
</div>

</body>
</html>
