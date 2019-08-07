<%
'파일명: list.asp
%>

<html>
	<head>
		<title>목록보기</title>

		<style  type=text/css>
			body, table, tr, td {font-family:굴림; font-size:9pt; color:#333333; line-height:180%}
			A:link {text-decoration:none; color:#555555}
			A:visited {text-decoration:none; color:#666666}
			A:active {text-decoration:none; color:#666666}
			A:hover {text-decoration:none; color:#000000}
		</style>

		<script language="javascript">
			function upload_chk() {
			str = document.search.keyword.value;
			if (str="") {
				alert("검색어를 입력하세요!");
				docuement.search.keyword.focus();
				return false; 
			};
			document.search.submit();
			}
		</script>
	</head>
<%
	If  session("user") = "" Then
%>
		<script language="javascript">
			alert("로그인하세요!!");
			document.location.replace("login.asp");
		</script>
<%
	End If 

	cur_page = request("page")
	If  cur_page = "" Then
		cur_page = 1
	End If 

' 검색 조건
	ftype = request("ftype")
	keyword = request("keyword")

'게시판 글 목록 보여주기
	Set conn = server.CreateObject("ADODB.connection")
	conn.open "dsn=BoardDB"

	If ftype = "" Then
		strQuery = "Select * From Board Order by groupnum desc, disp"
	Else
		strQuery = "Select * From Board "
		strQuery += "Where " & ftype & " like '%" &keyword % "%' "
		strQuery += "Order by groupnum desc, disp "
	End If
	
	Set rs = server.CreateObject('ADODB.recordset")
	rs.open strQuery, conn, 3, 1, 1
	rs.pagesize = 10
	rs.absolutepage = cur_page
	rcount = 0
	rnum = rs.recordcount - ((cur_page - 1) * rs.pagesize)
	pagecount = rs.pagecount
%>
총게시물 수: <%=rs.recordcount%><br>
<%=cur_page%>/<%=rs.pagecount%>Pages<br>

	<table border=0 cellspacing=0 cellpadding=0 width=100%>
		<col width=40></col>
		<!--<col width=60></col> -->
		<col width=></col>
		<col width=80></col>
		<col width=20></col>
		<col width=100></col>
		<tr>
			<td colspan=6><!----></td>
		</tr>
		<tr>
			<td height=4, colspan=6 class=list_header1 bgcolor=#aaaaaa></td>
		</td>
		<tr>
			<td height=30, align=center><img src=image/h_num.gif border=0 width=19 height=13></td>
			<td align=center width=70%><img src=image/h_subject.gif border=0 width=27 height=13></td>
			<td align=center><img src=image/h_writer.gif border=0 width=33 height=13></td>
			<td align=center><img src=image/h_read.gif border=0 width=32 height=13></td>
			<td align=center><img src=image/h_date.gif border=0 width=23 height=13></td>
		</td>
		<tr>
			<td height=2 colspan=6 class=list_header2 bgcolor=#e1e1e1></td>
		</tr>
<%
	Do While rcount = rs.pageSize Or rs.eof
%>
		<tr align=center onMouseOver=this.style.backgroundColor='#f0f0fb' onMouseOut=this.style.backgroundcolor=''>
			<td class=small height=22><%=rnum%></td>
<!--			<td align=left nowrap><font color=#999999>[&nbsp;]</font></td>-->
			<td align=left nowrap>
				<img src=image/new_head.gif border=0 align=absmiddle>&nbsp;
<%
					If rs("depth") <> 0 Then
						If i = 1 To rs("depth")
							response.write "&nbsp;"
						Next
					End If
					If rs("del") = True Then
						response.write "삭제된 글입니다."
					Else
%>
						<a href="view.asp?num=<%=rs("num")%>&page=<%=cur_page%>"><%=rs("title")%></a>[<%=rs("n_comment")%>]
<%
					End If
%>
			</td>
			<td><%=rs("author")%></td>
			<td><%=rs("viewcnt")%></td>
			<td>&nbsp;<%=FormatDateTime(rs("day"),3)%></td>
		</tr>
		<tr>
			<td colspan=6 height=1 bgcolor=#e1e1e1></td>
		</tr>
<%
					rcount = rcount + 1
					rnum = rnum - 1
					rs.movenext
	Loop
%>	
	</table>
	<p align=center>
<%
	conn.close
	Set conn=Nothing
%>

	<table border=0 cellpadding=0 cellspacing=0 width=100%>
		<tr valign=top>
			<td>
				<a onfocus=blur() href=list.asp?page=<%=cur_page%>><img src=image/btn_list.gif border=0></a>
			</td>
			<td align=right>
				<a onfocus=blur() href=><img src=image/prev.gif border=0></a>
<%
		For i = 1 To pagecount
		If Int(cur_page) = i then
%>
					[<font size=4t color=red><%=i%></font>]
<%
		Else
%>
					<a onfocus=blur() href=list.asp?page=<%=i%>&ftype=<%=ftype%>&keyword=<%=keyword%>><font style=font-size:8pt>|<%=i%>]</a>
<%
		End If
		Next
%>	
					<a onfocus=blur() href><img src=image/next.gif border=0></a><br><br>
			</td>
		</tr>
	</table>

	<table border=0 cellspacing=0 cellpadding=0>
		<form method=post name=search action=list.asp>
			<input type=hidden name=page value=1>
			<tr>
				<td>
					<table border=0 cellspacing=0 cellpadding=0>
						<tr>
							<td style='padding-right:0px'>
								<select name="Ftype" id="Find" tabindex="3">
<%		If ftype="" Or ftype="title" Then %>
									<option selected="selected" value="title">제목 </option>
									<option value="letter">내용 </option>
									<option value="author">작성자 </option>
<%		ElseIf ftype="author" Then %>
									<option value="title">제목 </option>
									<option value="letter">내용 </option>
									<option selected="selected" value="author">작성자 </option>
<%		Else %>
									<option value="title">제목 </option>
									<option selected="selected" value="letter">내용 </option>
									<option value="author">작성자 </option>
<%		End If %>
								</select>
							</td>
							<td style='padding-right:0px'>
								<input type=text size=16 name=keyword value=<%=keyword%>>
							</td>
							<td>
								<input type=button name=btnFind value="검색" onclick="javascript:upload_chk();">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</form>
	</table>
</html>

