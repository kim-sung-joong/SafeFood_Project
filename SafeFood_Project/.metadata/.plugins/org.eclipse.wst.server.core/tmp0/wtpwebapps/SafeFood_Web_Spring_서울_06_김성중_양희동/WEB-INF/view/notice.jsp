<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Safe Food</title>

<!-- Custom fonts for this template -->
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
body {
	position: relative;
}
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

#td table{
	text-align: center;
	margin: auto;
	border: 1px solid;
}
#td td{
	text-align : center;
	border: 1px solid;
	border-left : 1px solid white;
	border-right : 1px solid white;
}

#gra{
	background-color: skyblue;
	height : 15px;
}

</style>
</head>
<body>
	<%@include file="nav.jsp" %>

	<!-- Contents -->
	<div id="app">
		<div id="td" style="margin-top: 15px; margin-bottom: 10px;">
			<table>
				<tr>
					<td style="width: 60%; border-top : 1px solid white;"></td>
					<td style="width: 20%; border-top : 1px solid white;"></td>
				</tr>
				<tr>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">게시일</th>
				</tr>
				<tr v-for="ndata in nlist">
					<td><button type="button" data-toggle="modal"
							v-bind:id="ndata.nnum"
							v-bind:data-target="'#code_' + ndata.nnum" style="margin-left:0px;">{{ndata.ntitle}}</button></td>
					<td>{{ndata.ndate}}</td>
				</tr>
			</table>
		</div>
		
		<div id="addModal">
			<template v-for="temp in nlist">
			<div class="modal fade" v-bind:id="'code_' + temp.nnum" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel"
								style="text-align: center;">{{temp.ntitle }}</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p>{{temp.nsummary }}</p>
						</div>
						<div class="modal-body">
						</div>
					</div>
				</div>
			</div>
			</template>
		</div>
	</div>
	
	<%@include file="footer.jsp" %>

	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/static/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script type="text/javascript">

	var app = new Vue({
		el : "#app",
		data() {
			return {
				nlist : [],
				loading : true,
				errored : false
			}
		},
		mounted() {
			axios.get('noticeList')
			.then( response => {
				this.nlist = response.data
			})
			.catch(error => {
				console.log(error)
				this.errored = true
			})
			.then(() => this.loading = false)
		}
	});

</script>
</body>
</html>