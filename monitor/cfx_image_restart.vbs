strComputer = "."
Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
' Create an HTTP object
myURL = "http://www.photoeye.com/monitor/cfx_imagecr_test.cfm"
Set objHTTP = CreateObject( "WinHttp.WinHttpRequest.5.1" )
objHTTP.SetTimeouts 5000, 5000, 5000, 5000

' log to file 
strFile = ".\cfxtest.log"
Const ForAppending = 8
set objFSO = CreateObject("Scripting.FileSystemObject")
set objFile = objFSO.OpenTextFile(strFile, ForAppending, True)

' Download the specified URL
WScript.Echo "Fetching the test url: " & myURL

On Error Resume Next
Err.Clear
objHTTP.Open "GET", myURL, False
objHTTP.Send
If Err.Number <> 0 Then
	objFile.WriteLine("Error: " & Err.Number)
	objFile.WriteLine("Error (Hex): " & Hex(Err.Number))
	objFile.WriteLine("Source: " &  Err.Source)
	objFile.WriteLine("Description: " &  Err.Description)
    Err.Clear
Else
	resp = objHttp.ResponseText
End If

' server is running (200) but cfx_image failing, which is caught CF exception
' do this to limit possibly stopping when don't really need to
If IsNull(resp) or IsEmpty(resp) or inStr(resp, "success") <= 0 Then

	objFile.WriteLine(Date & " " & Time & ":" )

	Set colProcess = objWMIService.ExecQuery ("Select Name, State, Status from Win32_Service where Name = 'Efflare ImageCR 3 Service'")

	For Each objProcess in colProcess
		objFile.WriteLine("Current State " & objProcess.State) 
		objFile.WriteLine("Current Status " & objProcess.Status)
		if objProcess.State = "Running" Then
			objFile.WriteLine(objProcess.Name & " Stopping")
			objFile.WriteLine( "Graceful Stop: " & objProcess.StopService() )
		end if
	Next 

	' wait 3 seconds to see if the service stopped, if not kill the process
	Wscript.Sleep 5000	
	Set cp = objWMIService.ExecQuery ("Select Name, State from Win32_Service where Name = 'Efflare ImageCR 3 Service'")
	For Each op in cp
		if op.State <> "Stopped" Then
		
			objFile.WriteLine("Still not stopped. Forcing with taskkill")
			Set procs = objWMIService.ExecQuery ("Select * from Win32_Process where Name = 'ImageCR3Service.exe'")
			for each proc in procs
				Set oShell = CreateObject("WScript.Shell")
				objFile.WriteLine("Killing PID: " & proc.ProcessID)
				objFile.WriteLine(oShell.Run("taskkill /F /pid " & proc.ProcessID, , True))
			Next
		end if 
	Next 


	objFile.WriteLine("Starting Service")

	' This will attempt to start the service, OK to run no matter what
	' as it will just return already started
	Set colServiceList = objWMIService.ExecQuery _
	    ("Select * from Win32_Service where Name='Efflare ImageCR 3 Service'")
	For each objService in colServiceList
	    objFile.WriteLine(objService.StartService())
	Next

	objFile.WriteLine("Done Start attempt")
	

	objFile.WriteLine("--------------------------------------")

End If

objFile.Close