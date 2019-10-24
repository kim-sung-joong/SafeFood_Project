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
<link href="${pageContext.request.contextPath}/static/css/main2.css" rel="stylesheet">
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

#td1 button {
    margin-left:70px;
    margin-bottom: 20px;
    margin-top: 25px;
    border:none;
    height: 20%;
    text-align: center;
    display: inline-block;
    background-color: white;
}

#td1 img {
	width: 35%;
}

td1{
	padding : 10px;
}

#td1 table{
	text-align: center;
	margin: auto;
	border: 1px solid;
}
#td1 td{
	text-align : center;
	border: 1px solid;
	border-left : 1px solid white;
	border-right : 1px solid white;
}
#td1 th{
	text-align : center;
}

#gra{
	background-color: skyblue;
	height : 15px;
}

td{
	padding-left : 5px;
	padding-right : 5px;
}

</style>
</head>
<body>
	<%@include file="nav.jsp" %>

	<!-- Contents -->
	<div id="app">
				<div id="td" style="text-align: center; width:40%; margin-top:5px; margin-right:auto;margin-left:auto;">
					<form method="get" action="" @submit.prevent="search">
						<div id="custom-search-input">
							<div class="input-group col-md-12">
								<input type="text" class="form-control input-lg" id="searchdata" placeholder="키워드를 검색해주세요." name="keyword"
										v-model="keyword" /> 
								<span class="input-group-btn">
									<button class="btn btn-primary" id="search" type="submit" style="background-color: gray; margin-top: 0px; height: auto; margin-left: 5px;">검색</button>
									<%if(!session.getAttribute("id").equals("")){ %>
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#write" style="margin-top: 0px; height: auto; margin-left: 5px;">글쓰기</button>
									<%} %>
								</span>
							</div>
						</div>
					</form>
				</div>
		
<!-- 	   	<div id="td" style="padding-bottom: 10px; padding-top:10px;text-align: center; margin-top:5px; margin-right:auto;margin-left:auto;">
			<div class="container" style="margin:auto;">
				<div class="row" style="text-align: center; padding-left:30%; padding-right:30%">
							<div id="custom-search-input">
								<div class="input-group col-md-12">
							<form method="get" action="" @submit.prevent="search">
									<input type="text" class="form-control input-lg"
										id="searchdata" placeholder="키워드를 검색해주세요." name="keyword"
										v-model="keyword" /> <span class="input-group-btn">
										<button class="btn btn-primary" id="search" type="submit" style="background-color: gray; margin-top: 0px; height: auto; margin-left: 5px; float:right;">
											검색</button>
									</span>
							</form> -->
									<%
			if (!session.getAttribute("id").equals("")) {
		%>
			<!-- make modal -->
			
			<!-- Modal start -->
			<div class="modal fade" id="write" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">글쓰기</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						
						<form method="post" action="" class="form-horizontal" role="form" @submit.prevent="insert">
						<div class="modal-body">
								<div class="form-group">
									<div class="col-sm-10">
										제목 <input type="text" class="form-control" id="inputEmail" name="title" v-model="qtitle">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-10">
										내용 <textarea rows="7" cols="30" class="form-control" id="inputPassword" name="summary" v-model="qsummary"></textarea>
									</div>
								</div>
						</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
								<button type="submit" class="btn btn-primary">등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- Modal end -->

		<%
			}
		%>	
								<div id="addModal1">
								<div class="limiter">
									<div class="container-table100">
										<div class="wrap-table100">
										<p style="font-style: italic; color:blue; text-align: center;"></p>
												<div class="table">
													<div class="row header">
														<div class="cell">
															제목
														</div>
														<div class="cell">
															글쓴이
														</div>
														<div class="cell">
															조회수
														</div>
														<div class="cell">
															게시일
														</div>
													</div>
													<div class="row" v-for="question in qlist">
														<div class="cell" data-toggle="modal" v-bind:id="question.qnum" style="margin-left:0px;" v-bind:data-target="pluscode(question.qnum)" v-on:click="countup(question.qnum)"data-title="제목">
															{{question.qtitle}}
														</div>
														<div class="cell" data-toggle="modal" v-bind:id="question.qnum" style="margin-left:0px;" v-bind:data-target="pluscode(question.qnum)" v-on:click="countup(question.qnum)" data-title="글쓴이">
															{{question.qid}}
														</div>
														<div class="cell" data-toggle="modal" v-bind:id="question.qnum" style="margin-left:0px;" v-bind:data-target="pluscode(question.qnum)" v-on:click="countup(question.qnum)" data-title="조회수">
															{{question.qcount}}
														</div>
														<div class="cell" data-toggle="modal" v-bind:id="question.qnum" style="margin-left:0px;" v-bind:data-target="pluscode(question.qnum)" v-on:click="countup(question.qnum)" data-title="게시일">
															{{question.qtime}}
														</div>
													</div>
												</div>
										</div>
									</div>
								</div>
								</div>
		<div id="addModal">
			<template v-for="temp in qlist">
			<div class="modal fade" v-bind:id="pluscode2(temp.qnum)" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<template v-if="pageupdate">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel"
								style="text-align: center;">{{temp.qtitle }}</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p>{{temp.qsummary }}</p>
							<%
								if (!session.getAttribute("id").equals("")) {
							%>
							<div style="float: right;">
								<template v-if="available(temp.qid)">
									<button v-on:click="changeupdate">수정</button>
									<button v-on:click="deleteQ(temp.qnum)">삭제</button>
								</template>
							</div>
							<%
								}
							%>
						</div>
						<div class="modal-body" style="border-top: 0.5px solid #e6e6e6">
							<template v-for="ans in alist">
								<template v-if="ans.qnum == temp.qnum">
									<span>
										<p style="font-style: italic; padding-left: 10px;">{{ans.aid}} : {{ans.asummary}}</p>
									</span>
								</template>
							</template>
						</div>
							<%
								if(!session.getAttribute("id").equals("")){
							%>
									<div class="modal-footer">
										<form action="" @submit.prevent="writeAnswer(temp.qnum)">
										<p style="text-align: left;">댓글달기</p>
										<textarea rows="3" cols="30" class="form-control"
												id="inputText" name="asummary" v-model="asummary"></textarea>
										<button type="submit" style="float: right;">댓글등록</button>
										</form>
									</div>
							<%
								}
							%>
						</template>
						<template v-else="pageupdate">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">수정</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close" v-on:click="changeupdate2">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form method="post" action="" class="form-horizontal" role="form" @submit.prevent="update(temp.qnum, temp.qtitle, temp.qsummary)">
									<div class="form-group">
									<label for="inputEmail" class="col-sm-5 control-label">제목</label>
									<input type="hidden" v-model="temp.qnum">
										<div class="col-sm-10">
											<input type="text" class="form-control" name="qtitle" v-model="temp.qtitle">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-sm-5 control-label">내용</label>
										<div class="col-sm-10">
											<textarea rows="7" cols="30" class="form-control"
												id="inputPassword" name="qsummary" v-model="temp.qsummary"></textarea>
										</div>
									</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal" v-on:click="changeupdate2">취소</button>
								<button type="submit" class="btn btn-primary">수정</button>
							</div>
						</form>
						</template>
					</div>
				</div>
			</div>
			</template>
		</div>
	<%@include file="footer.jsp" %>
	</div>

<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/static/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">

	var app = new Vue({
		el : "#app",
		data() {
			return{
				qlist : [],
				loading : true,
				errored : false,
				question : '',
				qtitle : '',
				qsummary : '',
				qid : '',
				qcount : '',
				keyword : '',
				pageupdate : true,
				qnum : 0,
				sid : '',
				asummary : '',
				aid : '',
				alist : []
			}
		},
		mounted(){
			axios.get('searchQuestionAll')
			.then( response => {
				this.qlist = response.data.qlist
				this.alist = response.data.alist
			})
			.catch(error => {
				console.log(error)
				this.errored = true
			})
			.then(() => this.loading = false)
		},
		methods : {
			insert(){
				console.log("insert에 들어와");
				axios.post('insertQuestion', {
					qtitle : this.qtitle,
					qsummary : this.qsummary,
					qid : '<%=session.getAttribute("id")%>',
					})
					 .then(response => {
						 console.log("성공한거야?")
					 })
					 .catch(error => {
						 console.log(error)
						 this.errored = true
					 })
					 .then(() => {
						 this.loading = false
						 location.href='qna.food'
					 })
			},
			pluscode(d){
				return "#code_" + d;
			},
			pluscode2(d){
				return "code_" + d;
			},
			search(){
				axios.get('searchQuestion', {
					params : {
						keyword : this.keyword
					}
				})
				.then( response => {
					this.qlist = response.data
				})
				.catch(error => {
					console.log(error)
					this.errored = true
				})
				.then(() => this.loading = false)
			},
			changeupdate(){
				this.pageupdate = false
				console.log(this.pageupdate)
			},
			changeupdate2(){
				this.pageupdate = true
			},
			update(num, title, summary){
				this.qnum = num;
				this.qtitle = title;
				this.qsummary = summary;
				axios.put('updateQuestion', {	// params 먼데
					qnum : this.qnum,
					qtitle : this.qtitle,
					qsummary : this.qsummary,
					qid : '<%=session.getAttribute("id")%>'
					})
					 .then(response => {
						 console.log("성공한거야?")
					 })
					 .catch(error => {
						 console.log(error)
						 this.errored = true
					 })
					 .then(() => {
						 this.loading = false
						 this.pageupdate = true
					 })
			},
			available(qid){
				 sid = '<%=(String)session.getAttribute("id")%>';
				if(sid == qid){
					return true;
				} else{
					return false;
				}
			},
			deleteQ(Qnum){
				console.log(Qnum);
				axios.delete('deleteQuestion',{
					params :{
					qnum : Qnum
					}
				})
					 .then(response => {
						 console.log("성공한거야?")
					 })
					 .catch(error => {
						 console.log(error)
						 this.errored = true
					 })
					 .then(() => {
						this.loading = false 
						location.href='qna.food'
					 })
			},
			countup(num){
				this.qnum = num;
				axios.get('countUp', {
					params : {
						num : this.qnum
					}
				})
					 .then(response => {
						 console.log("성공")
					 })
					 .catch(error => {
						 console.log(error)
						 this.errored = true
					 })
					 .then(() => {
						 this.loading = false
					 })
			},
			writeAnswer(num){
				console.log('<%=session.getAttribute("id")%>')
				axios.post('insertAnswer', {
					qnum : num,
					asummary : this.asummary,
					aid : '<%=session.getAttribute("id") %>'
				})
					 .then(response => {
						 console.log("성공")
					 })
					 .catch(error => {
						 console.log(error)
						 this.errored = true
					 })
					 .then(() => {
						 this.loading = false
						 location.href='qna.food'
					 })
			}
		}
	});

</script>
</body>
</html>