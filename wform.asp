<%
	'���ϸ�: wform.asp
	'action:=write.asp
%>

<HTML>
 <HEAD>
  <TITLE> ���Խù� �ۼ� </TITLE>
		<style  type=text/css>
			body, table, tr, td {font-family:����; font-size:9pt; color:#333333; line-height:180%}
			A:link {text-decoration:none; color:#555555}
			A:visited {text-decoration:none; color:#666666}
			A:active {text-decoration:none; color:#666666}
			A:hover {text-decoration:none; color:#000000}
		</style>
		<script language="javascript">
		function upload_chhk() {
			if (document.myform.author.value=="")
			{
				alert("�̸��� �Է��ϼ���!!");
				document.myform.author.focus();
				return false;
			}
			if (document.myform.email.value=="")
			{
				alert("�̸��� �ּҸ� �Է��ϼ���!!");
				document.myform.email.focus();
				return false;
			}
			if (document.myform.pwd.value=="")
			{
				alert("��й�ȣ�� �Է��ϼ���!!");
				document.myform.pwd.focus();
				return false;
			}
			if (document.myform.title.value=="")
			{
				alert("������ �Է��ϼ���!!");
				document.myform.title.focus();
				return false;
			}
			if (document.myform.letter.value=="")
			{
				alert("������ �Է��ϼ���!!");
				document.myform.letter.focus();
				return false;
			}
			document.myform.submit();
		}
		</script>
 </HEAD>

	<form name="myform" action="write.asp" enctype="multipart/form-data" method="post">
		<p align=center><font size=3>���Խù� ����</font><br><br>
			<table border=0>
				<tr bgcolor="#e6e8fa">
					<td align=center>�� ��</td>
					<td><input type=text size=15 name="author"></td>
				</tr>
				<tr bgcolor="#e6e8fa">
					<td align=center>Email</td>
					<td><input type=text size=30 name="email"></td>
				</tr>
				<tr bgcolor="#e6e8fa">
					<td align=center>��й�ȣ</td>
					<td><input type=password size=10 name="pwd"><font size=2>(�� ����/������ �ʿ��մϴ�.)</td>
				</tr>
				<tr bgcolor="#e6e8fa">
					<td align=center>����</td>
					<td><input type=text size=50 name="title"></td>
				</tr>
				<tr bgcolor="#e6e8fa">
					<td align=center>����</td>
					<td><textarea wrap=hard  name="letter" cols=50 rows=15></textarea></td>
				</tr>
				<tr bgcolor="#e6e8fa">
					<td align=center>÷������</td>
					<td><input type=file size=40 name="afile"></td>
				</tr>
				<tr>
					<td colspan=2 height=40 align=center>
						<input type=button value="����ϱ�" onclick="javascript:upload_chk();">
						<input type=reset value="�ٽþ���" >
						<input type=button value="�ڷ�" onclick="javascript:void(history.back())">
					</td>
				</tr>
			</table>
	</form>
</HTML>
