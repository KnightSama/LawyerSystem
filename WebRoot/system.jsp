<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<title>��ʦ�й���ϵͳ</title>
<link rel="stylesheet" type="text/css" href="Styles/admin-all.css" />
<link rel="stylesheet" type="text/css" href="Styles/base.css" />
<link rel="stylesheet" type="text/css" href="Styles/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="Styles/chur.css" />
<link rel="stylesheet" type="text/css"
	href="Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
<script type="text/javascript" src="Scripts/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="Scripts/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="Scripts/ChurAlert.min.js?skin=blue"></script>
<script type="text/javascript" src="Scripts/chur-alert.1.0.js"></script>
<script type="text/javascript" src="Scripts/index.js"></script>

<script type="text/javascript">
	function exit() {
		$('body').alert({
			title : '��ʾ', //����
			content : 'ȷ��Ҫע����¼��', //��ʾ������Ϣ
			modal : true, //ģʽ�����ص�
			draggable : false,
			type : 'info',
			buttons : [ {
				id : 'yes',
				name : 'ȷ��',
				callback : function() {
					top.location = 'login.jsp';
				}
			}, {
				id : 'no',
				name : 'ȡ��',
				callback : function() {
				}
			} ]
		})
	}
</script>

<s:if test="hasActionMessages()">
	<s:set name="result" value="actionMessages[0]" />
	<s:if test="#result =='success'">
		<script type="text/javascript">
			$(function() {
				$('body').alert({
					type : 'success',
					title : '��ӭ', //����
					content : '��½�ɹ���', //��ʾ������Ϣ
					btntext : 'ȷ��', //��ť����
					modal : true, //ģʽ�����ص�
					draggable : false
				//�Ƿ���϶�
				})
			})
		</script>
	</s:if>
</s:if>
<s:else>
	<script language="javascript">
		top.location = 'login.jsp';
	</script>
</s:else>

</head>
<body>
	<div class="warp">
		<!--ͷ����ʼ-->
		<div class="top_c">
			<div class="top-menu">
				<ul class="top-menu-nav">
					<li><a target="Conframe" href="welcome.action">��ҳ</a></li>
					<li><a href="#">��������<i class="tip-up"></i> </a>
						<ul class="kidc">
							<li><a target="Conframe" href="jsp/addcase.jsp">��������</a>
							</li>
							<li><a target="Conframe" href="jsp/findcase.jsp">������ѯ</a>
							</li>
						</ul>
					</li>
					<li><a href="#">�ͻ�����<i class="tip-up"></i> </a>
						<ul class="kidc">
							<li><b class="tip"></b><a target="Conframe"
								href="jsp/addclient.jsp">���ӿͻ�</a></li>
							<li><b class="tip"></b><a target="Conframe"
								href="jsp/findclient.jsp">�ͻ���ѯ</a></li>
						</ul>
					</li>
					<li><a href="#">��ʦ����<i class="tip-up"></i> </a>
						<ul class="kidc">
							<li><b class="tip"></b><a target="Conframe"
								href="jsp/addemployee.jsp">������ʦ</a></li>
							<li><b class="tip"></b><a target="Conframe"
								href="jsp/findemployee.jsp">��ʦ��ѯ</a></li>
						</ul>
					</li>
					<li><a href="#">����<i class="tip-up"></i> </a>
						<ul class="kidc">
							<li><b class="tip"></b><a target="Conframe"
								href="jsp2/findcase.jsp">��������</a></li>
						</ul>
					</li>
					<li><a href="#">ϵͳ����<i class="tip-up"></i> </a>
						<ul class="kidc">
							<li><b class="tip"></b><a target="Conframe"
								href="jsp/addmanager.jsp">��ӹ���Ա</a></li>
							<li><b class="tip"></b><a target="Conframe"
								href="jsp/changepassword.jsp">�޸�����</a></li>
							<li><b class="tip"></b><a target="Conframe"
								href="jsp/findmanager.jsp">�鿴����Ա</a></li>
							<li><b class="tip"></b><a target="Conframe"
								href="jsp/findlog.jsp">�鿴��־</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="top-nav">
				��ӭ����
				<s:property value="#session.username" />
				��&nbsp;&nbsp;<a class="btn btn-mini btn-primary" target="Conframe" href="jsp/changepassword.jsp">�޸�����</a> | <a class="btn btn-mini btn-danger" href="javascript:exit();">ע����¼</a>
			</div>
		</div>
		<!--ͷ������-->
		<!--��߲˵���ʼ-->
		<div class="left_c left">
			<h1>ϵͳ�����˵�</h1>
			<div class="acc">
				<div>
					<a class="one">��������</a>
					<ul class="kid">
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/addcase.jsp">��������</a></li>
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/findcase.jsp">������ѯ</a></li>
					</ul>
				</div>
				<div>
					<a class="one">�ͻ�����</a>
					<ul class="kid">
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/addclient.jsp">���ӿͻ�</a></li>
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/findclient.jsp">�ͻ���ѯ</a></li>
					</ul>
				</div>
				<div>
					<a class="one">��ʦ����</a>
					<ul class="kid">
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/addemployee.jsp">������ʦ</a></li>
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/findemployee.jsp">��ʦ��ѯ</a></li>
					</ul>
				</div>
				<div>
					<a class="one">�� ��</a>
					<ul class="kid">
						<li><b class="tip"></b><a target="Conframe"
							href="jsp2/findcase.jsp">��������</a></li>
					</ul>
				</div>
				<div>
					<a class="one">����</a>
					<ul class="kid">
						<li><b class="tip"></b><a target="Conframe"
							href="findorder">ԤԼ����</a></li>
							<li><b class="tip"></b><a target="Conframe"
							href="findcansulation">��ѯ����</a></li>
					</ul>
				</div>
				<div>
					<a class="one">ϵͳ����</a>
					<ul class="kid">
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/addmanager.jsp">��ӹ���Ա</a></li>
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/changepassword.jsp">�޸�����</a></li>
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/findmanager.jsp">�鿴����Ա</a></li>
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/findlog.jsp">�鿴��־</a></li>
					</ul>
				</div>
				<div id="datepicker"></div>
			</div>

		</div>
		<!--��߲˵�����-->
		<!--�ұ߿�ܿ�ʼ-->
		<div class="right_c">
			<div class="nav-tip" onclick="javascript:void(0)">&nbsp;</div>

		</div>
		<div class="Conframe">
			<iframe name="Conframe" id="Conframe" src="welcome.action"></iframe>
		</div>
		<!--�ұ߿�ܽ���-->

		<!--�ײ���ʼ-->
		<div class="bottom_c">���ϴ�ѧ��ҵ��� ��ʦ�й���ϵͳ by������</div>
		<!--�ײ�����-->
	</div>
</body>
</html>
