<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="javax.xml.parsers.*"%>
<%@ page import="java.util.*, java.nio.file.Path, java.nio.file.Paths"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Safe Food</title>
<link rel="stylesheet" href="chart.css">
<link rel="stylesheet" href="https://cdn.rawgit.com/theus/chart.css/v1.0.0/dist/chart.css" />
<!-- Bootstrap core CSS -->
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<!-- Custom styles for this template -->
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://unpkg.com/vue"></script>
<!-- Vue 최신버전 반영cdn -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<!-- axios cdn -->
<style type="text/css">
.btn-primary {
	color: #fff;
	background-color: red;
	border-color: burlywood;
	margin: 5px;
}

.active {
	background-color: #4CAF50;
}

#td button {
    margin-left:70px;
    margin-bottom: 20px;
    margin-top: 25px;
    border:none;
    width: 20%;
    height: 20%;
    text-align: center;
    display: inline-block;
    background-color: white;
}

#td img {
	width: 35%;
}

td{
	padding : 10px;
}

#gra{
	background-color: skyblue;
	height : 15px;
}

</style>
</head>
<body>
<div id="main">
	<%@include file="nav.jsp" %>
<div class="container">
		<h1 style="margin-top:30px; margin-bottom:30px; text-align: center;"><%=request.getAttribute("msg") %></h1>
		</div>		
		<%@include file="footer.jsp" %>

</div>
	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/static/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript">
		var main = new Vue({
			el : '#main',
			data() {
				return{
					sesid : '<%=session.getAttribute("id") %>'
				}
			},
			methods : {
				checkuser(){
					return this.sesid == '';
				},
			}
		});
	</script>
</body>
</html>