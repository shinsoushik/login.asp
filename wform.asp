<%
	'파일명: wform.asp
	'action:=write.asp
%>

<HTML>
 <HEAD>
  <TITLE> 새게시물 작성 </TITLE>
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
		</script>
 </HEAD>

	<form name="myform" action="write.asp" enctype="multipart/form-data" method="post">
		<p align=center><font size=3>새게시물 쓰기</font><br><br>
			<table border=0>
				<tr bgcolor="#e6e8fa">
					<td align=center>이 름</td>
					<td><input type=text size=15 name="author"></td>
				</tr>
				<tr bgcolor="#e6e8fa">
					<td align=center>Email</td>
					<td><input type=text size=30 name="email"></td>
				</tr>
				<tr bgcolor="#e6e8fa">
					<td align=center>비밀번호</td>
					<td><input type=password size=10 name="pwd"><font size=2>(글 수정/삭제시 필요합니다.)</td>
				</tr>
				<tr bgcolor="#e6e8fa">
					<td align=center>제목</td>
					<td><input type=text size=50 name="title"></td>
				</tr>
				<tr bgcolor="#e6e8fa">
					<td align=center>내용</td>
					<td><textarea wrap=hard  name="letter" cols=50 rows=15></textarea></td>
				</tr>
				<tr bgcolor="#e6e8fa">
					<td align=center>첨부파일</td>
					<td><input type=file size=40 name="afile"></td>
				</tr>
				<tr>
					<td colspan=2 height=40 align=center>
						<input type=button value="등록하기" onclick="javascript:upload_chk();">
						<input type=reset value="다시쓰기" >
						<input type=button value="뒤로" onclick="javascript:void(history.back())">
					</td>
				</tr>
			</table>
	</form>
</HTML>
