<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ambulance Portal</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

</head>
<body>
	<div class="container table-responsive">
		<label style="margin-top:30px;">You Will be Notified when a patient requires ambulance</label>
		<table id="example" class="table" style="margin-top:30px;">
			<thead>
				<tr>
					<th>Patient Name</th>
					<th>Phone Number</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				</tr>
			</tbody>
		</table>
	</div>
	<script>
		var websocket=new WebSocket("ws://localhost:8080/WebSocket/VitalCheckEndpoint");
		websocket.onmessage=function processMessage(message){
			var jsonData=JSON.parse(message.data);
			if(jsonData.message!=null)
			{
				var details=jsonData.message.split(',');
				var row=document.getElementById('example').insertRow();
				row.innerHTML="<td>"+details[0]+"</td><td>"+details[1]+"</td><td>"+details[2]+"</td>";
				alert(details[0]+" requires an ambulance");
			}
		}
	</script>
</body>
</html>
