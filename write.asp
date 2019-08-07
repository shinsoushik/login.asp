<%
	'파일명:write.asp

Set upload = server.CreateObject("TABS.Upload")
Upload.Start "c:\temp"
downdir = "c:\temp"

If upload.Form("aFile").filesize <> 0 Then
	bfilename = upload.Form("aFile").filename 

	Set fso = server.CreateObject("Scripting.FileSystemObject")

	dot = InstrRev(bfilename,".")
	leftfile = Left(bfilename, dot-1)
	fileext = Mid(bfilename, dot+1)
	tempfile = downdir & "\" & leftfile & "." &  fileext
	filecount = 0
	Do Until Not fso.fileexist(tempfile)
		filecount = filecount + 1
		temp = leftfile & filecount
		tempfile = downdir & "\" & temp & "." & fileext
	Loop
	
	upload.Form("aFile".saveas(tempfile)

	If filecount <> 0 Then	'파일명 변경한 경우
		filename = temp & "." & fileext
	Else
		filename = bfilename
	End If 
	filesize = upload.Form("afile").filesize
End If 

title = upload.Form("title")
author = upload.Form("author")
letter = upload.Form("letter")
pwd = upload.Form("pwd")
email = upload.Form("email")


Set conn = server.CreateObject("ADODB.connection")
conn.open "BoardDB"

strQuery = "Select max(groupnum) From Board "
Set rs = conn.execute(strQuery)
groupnum = rs(0) + 1

If upload.Form("afile").FileSize <> 0 Then			'첨부파일 있는 경우
	strQuery = "insert into Board (pwd, title, author, letter, day, viewcnt, filename, filesize, email, groupnum, depth, disp) values ( "
	strQuery = strQuery & "'" & pwd & "', "
	strQuery = strQuery & "'" & title & "', "
	strQuery = strQuery & "'" & author & "', "
	strQuery = strQuery & "'" & letter & "', "
	strQuery = strQuery & "'" & Now() & "', "
	strQuery = strQuery & "0, "
	strQuery = strQuery & "'" & filename & "', "
	strQuery = strQuery & filesize & ", "
	strQuery = strQuery & "'" & email & "', "
	strQuery = strQuery & groupnum& ", "
	strQuery = strQuery & "0, "
	strQuery = strQuery & "0)"
Else
	strQuery = "insert into Board (pwd, title, author, letter, day, viewcnt, email, groupnum, depth, disp) values ( "
	strQuery = strQuery & "'" & pwd & "', "
	strQuery = strQuery & "'" & title & "', "
	strQuery = strQuery & "'" & author & "', "
	strQuery = strQuery & "'" & letter & "', "
	strQuery = strQuery & "'" & Now() & "', "
	strQuery = strQuery & "0, "
	strQuery = strQuery & "'" & email & "', "
	strQuery = strQuery & groupnum& ", "
	strQuery = strQuery & "0, "
	strQuery = strQuery & "0)"
End If

conn.execute(strQuery)
conn.close

Set conn = Nothing 
Set upload = Nothing

response.redirect "list.asp"
%>