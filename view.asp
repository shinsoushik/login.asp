<%
	'filename: view.asp
%>
<HTML>
 <HEAD>
  <TITLE> 상세보기 </TITLE>
		<style  type=text/css>
			body, table, tr, td {font-family:굴림; font-size:9pt; color:#333333; line-height:180%}
			A:link {text-decoration:none; color:#555555}
			A:visited {text-decoration:none; color:#666666}
			A:active {text-decoration:none; color:#666666}
			A:hover {text-decoration:none; color:#000000}
		</style>
		<script language="javascript">
		function upload_chhk() {
			if (document.myform.author.value=="")
			{
				alert("이름을 입력하세요!!");
				document.myform.author.focus();
				return false;
			}
			if (document.myform.email.value=="")
			{
				alert("이메일 주소를 입력하세요!!");
				document.myform.email.focus();
				return false;
			}
			if (document.myform.pwd.value=="")
			{
				alert("비밀번호를 입력하세요!!");
				document.myform.pwd.focus();
				return false;
			}
			if (document.myform.title.value=="")
			{
				alert("제목을 입력하세요!!");
				document.myform.title.focus();
				return false;
			}
			if (document.myform.letter.value=="")
			{
				alert("내용을 입력하세요!!");
				document.myform.letter.focus();
				return false;
			}
			document.myform.submit();
		}
		function alert1() {
			alert("아무거나 입력하세요~~!!");
		}
		</script>
 </HEAD>

<*		<script language="javascript">
		function upload_chhk() {
			if (document.myform.author.value=="")
			{
				alert("이름을 입력하세요!!");
				document.myform.author.focus();
				return false;
			}
			if (document.myform.pwd.value=="")
			{
				alert("비밀번호를 입력하세요!!");
				document.myform.pwd.focus();
				return false;
			}
			if (document.myform.comment.value=="")
			{
				alert("댓글을 입력하세요!!");
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
	response.write "DB Error: 해당 레코드가 존재하지 않음"
Else
	content = Replace(rs("letter"), Chr(13), "<br>")
%>


367 page line 52


</HTML>
