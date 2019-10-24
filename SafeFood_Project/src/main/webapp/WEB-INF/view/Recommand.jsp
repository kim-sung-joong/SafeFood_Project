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
<link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/util.css" rel="stylesheet">
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
		<!-- Contents -->
		<h2 style="text-align: center; background-color:#3dc9b3;">BEST FOOD TOP 3</h2>
		<div id="td">
			<c:forEach var="temp" items="${list}">
				<button type="button" data-toggle="modal" id="${temp.code }"  data-target="#code_${temp.code }">
				<img src= "view/${temp.img }"/><br>
				<p>${temp.name }</p>
			</button>
			</c:forEach>
		</div>
		
		<%
		if(!session.getAttribute("id").equals("")){
		%>
			<p style="text-align: right; font-size: 5px; ">※ 회원은 알러지 유발 성분을 제외 , 가장 인기가 많은 상품을 추천해드립니다!</p>
		<%
		} else {
		%>
			<p style="text-align: right; font-size: 5px; ">※ 비회원은 가장 인기가 많은 상품을 추천해드립니다!</p>
		<%
		}
		%>
		<div id="addModal">
			<c:forEach var="temp" items="${list}">
			<form method="post" action="userAddEat.food" class="form-horizontal" role="form">
				<div class="modal fade" id="code_${temp.code }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header" style="text-align: center;">
								<h4 class="modal-title" id="myModalLabel">${temp.name }</h4>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							</div>
							<div class="modal-body" style="text-align: center;">
								<img src="view/${temp.img }" width="150" height="150" />
							</div>
							<div class="modal-body">
							<c:set var="mat" value='${temp.material}'/>
							<%
							boolean flag = true;
							if(!session.getAttribute("id").equals("")){
								String temp = (String)pageContext.getAttribute("mat");
								String temp1 = (String)session.getAttribute("allergy");
								String[] temp2 = temp1.split(",");
								for(int i=0;i<temp2.length;i++){
								if(temp.contains(temp2[i])){
									flag = false;
							%>
								<p style="color:red; font: bold;">먹지마세요 위험해요</p>
							<%
								break;}
							}
							}
							%>
							<p style="font-style: italic; color:blue; text-align: center;">원재료</p>
							<p>${temp.material }</p>
							</div>
							<div class="modal-body" style="text-align: center;">
								<div class="limiter">
									<div class="container-table100">
										<div class="wrap-table100">
										<p style="font-style: italic; color:blue; text-align: center;">성분함량</p>
												<div class="table">
													<div class="row header">
														<div class="cell">
															성분
														</div>
														<div class="cell">
															성분량
														</div>
													</div>
													<div class="row">
														<div class="cell" data-title="성분">
															일회 제공량
														</div>
														<div class="cell" data-title="성분량">
															${temp.supportpereat } g
														</div>
													</div>
													<div class="row">
														<div class="cell" data-title="성분">
															칼로리
														</div>
														<div class="cell" data-title="성분량">
															${temp.calory } kcal
														</div>
													</div>
													<div class="row">
														<div class="cell" data-title="성분">
															탄수화물
														</div>
														<div class="cell" data-title="성분량">
															${temp.carbo} g
														</div>
													</div>
													<div class="row">
														<div class="cell" data-title="성분">
															단백질
														</div>
														<div class="cell" data-title="성분량">
															${temp.protein} g
														</div>
													</div>
													<div class="row">
														<div class="cell" data-title="성분">
															지방
														</div>
														<div class="cell" data-title="성분량">
															${temp.fat} g
														</div>
													</div>
													<div class="row">
														<div class="cell" data-title="성분">
															당류
														</div>
														<div class="cell" data-title="성분량">
															${temp.sugar} g
														</div>
													</div>
													<div class="row">
														<div class="cell" data-title="성분">
															나트륨
														</div>
														<div class="cell" data-title="성분량">
															${temp.natrium} mg
														</div>
													</div>
													<div class="row">
														<div class="cell" data-title="성분">
															콜레스테롤
														</div>
														<div class="cell" data-title="성분량">
															${temp.chole} mg
														</div>
													</div>
													<div class="row">
														<div class="cell" data-title="성분">
															포화지방산
														</div>
														<div class="cell" data-title="성분량">
															${temp.fattyacid} g
														</div>
													</div>
													<div class="row">
														<div class="cell" data-title="성분">
															트랜스지방
														</div>
														<div class="cell" data-title="성분량">
															${temp.transfat } mg
														</div>
													</div>
												</div>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-body">
							<p style="font-style: italic; color:blue; text-align: center;">그래프</p>
								<div class="panel-body" style="width: 100%;">
									<div style="width: 100%;">
										<fmt:formatNumber var="calory" pattern=".00" value="${temp.calory/23}"></fmt:formatNumber>
										칼로리 <div class="charts__chart" data-percent="${calory}%" style="width: ${calory}%"></div>
									</div>
									<fmt:formatNumber var="carbo" pattern=".00" value="${temp.carbo/4}"></fmt:formatNumber>
									탄수화물 <div class="charts__chart" data-percent="${carbo }%" style="width: ${carbo }%"></div>
									<fmt:formatNumber var="protein" pattern=".00" value="${temp.protein/0.55 }"></fmt:formatNumber>
									단백질 <div class="charts__chart" data-percent="${protein }%" style="width: ${protein }%"></div>
									<fmt:formatNumber var="fat" pattern=".00" value="${temp.fat/1.5}"></fmt:formatNumber>
									지방 <div class="charts__chart" data-percent="${fat }%" style="width: ${fat }%"></div>
									<div style="width: 100%;">
										<fmt:formatNumber var="sugar" pattern=".00" value="${temp.sugar/0.5}"></fmt:formatNumber>
										당류 <div class="charts__chart" data-percent="${sugar }%" style="width: ${sugar }%"></div>
									</div>
									<fmt:formatNumber var="natrium" pattern=".00" value="${temp.natrium/23}"></fmt:formatNumber>
									나트륨 <div class="charts__chart" data-percent="${natrium }%" style="width: ${natrium }%"></div>
									<fmt:formatNumber var="chole" pattern=".00" value="${temp.chole/3.3}"></fmt:formatNumber>
									콜레스테롤 <div class="charts__chart" data-percent="${chole }%" style="width: ${chole }%"></div>
									<fmt:formatNumber var="fattyacid" pattern=".00" value="${temp.fattyacid/0.15}"></fmt:formatNumber>
									포화지방산 <div class="charts__chart" data-percent="${fattyacid }%" style="width: ${fattyacid }%"></div>
									<c:if test="${temp.transfat} > 0">
										트랜스지방 <div class="charts__chart" data-percent="100%" style="width: 100%"></div>
									</c:if>
									<c:if test="${temp.transfat} == 0">
										트랜스지방 <div class="charts__chart" data-percent="0%" style="width: 0%"></div>
									</c:if>
								</div>
							</div>
							<div class="modal-footer">
								<input type="text" value="${temp.code}" style="display: none;" name="code">
								<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
								<%
								if(!session.getAttribute("id").equals("") && flag){
								%>
									<button type="submit" class="btn btn-primary" id="dataSave">섭취</button>
								<%
								}
								%>
							</div>
						</div>
					</div>
				</div>
			</form>
			</c:forEach>
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