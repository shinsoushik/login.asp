<%
	'filename: view.asp
%>
<HTML>
 <HEAD>
  <TITLE> �󼼺��� </TITLE>
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
		function alert1() {
			alert("�ƹ��ų� �Է��ϼ���~~!!");
		}
		</script>
 </HEAD>

<*		<script language="javascript">
		function upload_chhk() {
			if (document.myform.author.value=="")
			{
				alert("�̸��� �Է��ϼ���!!");
				document.myform.author.focus();
				return false;
			}
			if (document.myform.pwd.value=="")
			{
				alert("��й�ȣ�� �Է��ϼ���!!");
				document.myform.pwd.focus();
				return false;
			}
			if (document.myform.comment.value=="")
			{
				alert("����� �Է��ϼ���!!");
				document.myform.comment.focus();
				return false;
			}
			document.myform.submit();
		}
		</script>
<%
num = request("num")
page= request("Page")

Set conn = server.CreateObject("ADODB.connection")
conn.open "BoardDB"

strQuery = "Select * From board Where num= "&num

Set rs = conn.execute(strQuery)
If rs.eof Then
	response.write "DB Error: �ش� ���ڵ尡 �������� ����"
Else
	content = Replace(rs("letter"), Chr(13), "<br>")
%>


367 page line 52


</HTML>
