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
<title></title>
<link rel="stylesheet" type="text/css"
	href="../Styles/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../Styles/admin-all.css" />
<script type="text/javascript" src="../Scripts/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="../Scripts/jquery-ui-1.8.22.custom.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
<script type="text/javascript">
	$(function() {
		$('.modal').show();

		$(".datepicker").datepicker();
	})

	$(function() {
		$('#submit').click(function() {
			if ($('#name').val() == "") {
				var $parent = self.parent.$;
				$parent('body').alert({
					type : 'warning',
					title : 'ϵͳ��ʾ', //����
					content : '��������Ϊ�գ�', //��ʾ������Ϣ
					btntext : 'ȷ��', //��ť����
					modal : true, //ģʽ�����ص�
					draggable : false
				//�Ƿ���϶�
				})
			} else {
				$("form").submit();
			}
		});
	})
</script>
</head>
<body>
	<div class="alert alert-info">
		��ǰλ��<b class="tip"></b>��ʦ����<b class="tip"></b>������ʦ
	</div>
	<form id="form" action="addemployee" method="post">
		<table class="table table-striped table-bordered table-condensed list">
			<thead>
				<tr>
					<td colspan="4"><b>�����ʦ</b></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="15%">����</td>
					<td width="500"><input id="name" name="name" value=""
						type="text" />
					</td>
					<td width="500">�Ա�</td>
					<td width="500"><select name="sex">
							<option value="��">��</option>
							<option value="Ů">Ů</option>
							<option selected="selected"></option>
					</select></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input name="nation" value="" type="text" /></td>
					<td>������</td>
					<td><input name="birthArea" value="" type="text" /></td>
				</tr>
				<tr>
					<td>�Ļ��̶�</td>
					<td><input name="education" value="" type="text" /></td>
					<td>��ҵԺУ</td>
					<td><input name="graduate" value="" type="text" /></td>
				</tr>
				<tr>
					<td>��ҵʱ��</td>
					<td>
						<div class="input-append">
							<input class="span2 datepicker" name="graduateTime" size="16"
								type="text" /><span class="add-on"><i
								class="icon-calendar"></i> </span>
					</td>
					</div>
					</td>
					<td>������ʼʱ��</td>
					<td>
						<div class="input-append">
							<input class="span2 datepicker" name="workTime" size="16"
								type="text" /><span class="add-on"><i
								class="icon-calendar"></i> </span>
					</td>
					</div>
					</td>
				</tr>
				<tr>
					<td>����˾ʱ��</td>
					<td>
						<div class="input-append">
							<input class="span2 datepicker" size="16" name="inTime"
								type="text" /><span class="add-on"><i
								class="icon-calendar"></i> </span>
					</td>
					</div>
					</td>
					<td>��ͬ����</td>
					<td><input name="contractTime" value="" type="text" /></td>
				</tr>
				<tr>
					<td>ְλ</td>
					<td><select name="work">
							<option value="��ʦ ">��ʦ</option>
							<option value="��ʦ���� ">��ʦ����</option>
							<option selected="selected"></option>
					</select></td>
					<td>���</td>
					<td><select name="typeWork">
							<option value="�ɲ� ">�ɲ�</option>
							<option value="ְ�� ">ְ��</option>
							<option value="ʵϰ�� ">ʵϰ��</option>
							<option selected="selected"></option>
					</select></td>
				</tr>
				<tr>
					<td>����״��</td>
					<td><select name="health">
							<option value="����">����</option>
							<option value="�м�">�м�</option>
							<option selected="selected"></option>
					</select></td>
					<td>���֤��</td>
					<td><input name="cardID" value="" type="text" /></td>
				</tr>
				<tr>
					<td>��������</td>
					<td>
						<div class="input-append">
							<input class="span2" id="Text2" size="16" name="baseSalary"
								type="text" /><span class="add-on">��</span>
						</div></td>
					<td>��λ����</td>
					<td>
						<div class="input-append">
							<input class="span2" id="Text2" size="16" name="workSalary"
								type="text" /><span class="add-on">��</span>
						</div></td>
				</tr>
				<tr>
					<td>����</td>
					<td>
						<div class="input-append">
							<input class="span2" id="Text2" size="16" name="allowance"
								type="text" /><span class="add-on">��</span>
						</div></td>
					<td>����״��</td>
					<td><select name="marrage">
							<option value="�ѻ�">�ѻ�</option>
							<option value="δ��">δ��</option>
							<option value="����">����</option>
							<option selected="selected"></option>
					</select></td>
				</tr>
				<tr>
					<td>��ͥסַ</td>
					<td><input name="homeAddress" value="" type="text" /></td>
					<td>��ͥ�绰</td>
					<td><input name="homeTel" value="" type="text" /></td>
				</tr>
				<tr>
					<td>�ֻ�</td>
					<td><input name="mobile" value="" type="text" /></td>
					<td>��������</td>
					<td><input name="creditLevel" type="radio" value="��" /> �� <input
						type="radio" name="creditLevel" value="��" /> �� <input
						type="radio" name="creditLevel" value="�� " /> �� <input
						type="radio" name="creditLevel" value="��" /> ��</td>
				</tr>
				<tr>
					<td width="15%">��ע</td>
					<td width="500" colspan="3" height=""><textarea name="memo"
							style="width: 95%" rows="4" cols="5"></textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>

			</tfoot>
		</table>
		</form>
		<div style="text-align:center; ">
			<input class="btn btn-inverse" id="submit" type="button" value="����" />
		</div>
	
</body>
</html>

