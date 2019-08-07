<%
	'파일명: logchk.asp

id = request.Form("id")
password = request.Form("password")

'1. DB연결을 위한 connection 객체 생성
Set conn = server.CreateObject("ADODB.connection")

'2. conn을 이용해서 DB연결
conn.open "boardDB"

strQuery = "Select * From Member Where id = '" &id& "' and password= '" &password& "'"
Set rs = conn.execute(strQuery)

If rs.eof Then
	conn.close
	Set conn = Nothing
%>
		<script language="javascript">
		alert("아이디, 암호를 다시 확인하시고 로그인하세요")
		history.back()
		</script>
<%
Else
	session("user") = id
	conn.close
	Set conn = Nothing
%>
		<script language="javascript">
		alert("환영홥니다.")
		Document.Location.Replace("list.asp")
		</script>
<%
End If 
%>


