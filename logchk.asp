<%
	'���ϸ�: logchk.asp

id = request.Form("id")
password = request.Form("password")

'1. DB������ ���� connection ��ü ����
Set conn = server.CreateObject("ADODB.connection")

'2. conn�� �̿��ؼ� DB����
conn.open "boardDB"

strQuery = "Select * From Member Where id = '" &id& "' and password= '" &password& "'"
Set rs = conn.execute(strQuery)

If rs.eof Then
	conn.close
	Set conn = Nothing
%>
		<script language="javascript">
		alert("���̵�, ��ȣ�� �ٽ� Ȯ���Ͻð� �α����ϼ���")
		history.back()
		</script>
<%
Else
	session("user") = id
	conn.close
	Set conn = Nothing
%>
		<script language="javascript">
		alert("ȯ���d�ϴ�.")
		Document.Location.Replace("list.asp")
		</script>
<%
End If 
%>


