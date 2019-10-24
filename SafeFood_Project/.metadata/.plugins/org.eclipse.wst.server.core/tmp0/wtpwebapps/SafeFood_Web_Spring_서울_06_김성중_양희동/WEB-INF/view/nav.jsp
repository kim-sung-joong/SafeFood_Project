<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
<title>Navigation</title>
<!-- css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/ncss/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/static/ncss/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/static/ncss/css/nivo-lightbox.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/static/ncss/css/nivo-lightbox-theme/default/default.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/static/ncss/css/animations.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/static/ncss/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/static/ncss/color/default.css"
	rel="stylesheet">
<!-- Vue -->
<script src="https://unpkg.com/vue"></script>
<!-- Vue 최신버전 반영cdn -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<!-- axios cdn -->
</head>

<body>
		<div id="navigation">
			<nav class="navbar navbar-custom" role="navigation">
				<div class="container" style="width: 100%;">
					<div class="row">
						<div class="col-md-2">
							<div class="site-logo">
								<a href="main.food" class="brand">SAFE FOOD</a>
							</div>
						</div>
						<div class="col-md-10">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle"
									data-toggle="collapse" data-target="#menu">
									<i class="fa fa-bars"></i>
								</button>
							</div>
							<div class="collapse navbar-collapse" id="menu">
								<ul class="nav navbar-nav navbar-right">
									<li class="active"><a href="notice.food">공지사항</a></li>
									<li><a href="foodSelectAll.food">상품정보</a></li>
									<li><a href="recommand.food">추천섭취정보</a></li>
									<%if(!session.getAttribute("id").equals("")){ %>
									<li><a href="Oneday.food">내섭취정보</a>
									<%} %>
									<li><a href="qna.food">Q&A게시판</a></li>
									<li><a href="news.food">최신뉴스</a>
									<%if(session.getAttribute("id").equals("")){ %>
									<!-- make modal -->
										<li><a href="#" data-toggle="modal" data-target="#userLogin" style="border-left: 1px solid #e6e6e6">로그인</a></li>
										<!-- Modal start -->
										<div class="modal fade" id="userLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h4 class="modal-title" id="myModalLabel">로그인</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<form method="get" action="login.food" class="form-horizontal" role="form">
														<div class="modal-body">
															<div class="form-group">
																<div class="col-sm-10">
																	이메일  <input type="email" class="form-control" id="inputEmail" placeholder="Email" name="id">
																</div>
															</div>
															<div class="form-group">
																<div class="col-sm-10">
																	패스워드  <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="pass">
																</div>
															</div>
														</div>
														
														<div class="modal-footer">
															<button type="button" class="btn btn-primary" style="background-color: white;" data-dismiss="modal">취소</button>
															<button type="submit" class="btn btn-primary" style="background-color: #3dc9b3;">로그인</button>
														</div>
													</form>
												</div>
											</div>
										</div>
									<!-- Modal end --> <!-- make modal -->
										<li><a href="#" data-toggle="modal" data-target="#fp">비번찾기</a></li>
									<!-- Modal start -->
									<div class="modal fade" id="fp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title" id="myModalLabel">비밀번호 찾기</h4>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<form method="post" action="findpass.food"
													class="form-horizontal" role="form">
													<div class="modal-body">
														<div class="form-group">
															<div class="col-sm-10">
																이메일을 입력해주세요.<input type="email" class="form-control" id="inputEmail" placeholder="Email" name="id">
															</div>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-primary" style="background-color: white;" data-dismiss="modal">취소</button>
														<button type="submit" class="btn btn-primary" style="background-color: #3dc9b3;">찾기</button>
													</div>
												</form>
											</div>
										</div>
									</div>
									<!-- Modal end --> <!-- Sign In Modal Start -->
									<li><a href="#" data-toggle="modal" data-target="#myModal">회원가입</a></li>
									<!-- Modal start -->
									<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title" id="myModalLabel">회원 가입</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">×</span>
													</button>
												</div>
												<form method="post" action="addMember.food" class="form-horizontal" role="form">
													<div class="modal-body">
														<div class="form-group">
															<div class="col-sm-10">
																이메일<input type="email" class="form-control" id="inputEmail" name="id" placeholder="Email">
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-10">
																패스워드 <input type="password" class="form-control" id="inputPassword" name="pass" placeholder="Password">
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-10">
																이름 <input type="text" class="form-control" id="inputName" name="name" placeholder="Name">
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-10">
																주소 <input type="text" class="form-control" id="inputAddress" name="address" placeholder="Address">
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-10">
																휴대전화 번호 <input type="text" class="form-control" id="inputPhone" name="phone" placeholder="PhoneNumber">
															</div>
														</div>
																알레르기
														<div class="form-group">
															<div class="col-sm-10">
																<div class="checkbox-inline">
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="대두">대두</label> 
																	</div>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="땅콩">땅콩</label>
																	</div>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="우유">우유</label>
																	</div>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="게">게</label>
																	</div>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="새우">새우</label>
																	</div>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="참치">참치</label> 
																	</div>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="연어">연어</label> 
																	</div>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="쑥">쑥</label> 
																	</div>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="소고기">소고기</label>
																	</div>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="닭고기">닭고기</label> 
																	</div>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="돼지고기">돼지고기</label>
																	</div>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="복숭아">복숭아</label> 
																	</div>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="민들레">민들레</label>
																	</div>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="계란흰자">계란흰자</label>
																	</div>
																	
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-primary" style="background-color: white;" data-dismiss="modal">취소</button>
															<button type="submit" class="btn btn-primary" style="background-color: #3dc9b3;" id="dataSave">제출</button>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
									<!-- Modal end --> <%} else { %>
									<!-- 로그인 안하면 보이는 화면 ^^^^^^^^^ -->

									<li><a href="logout.food" style="border-left: 1px solid #e6e6e6">로그아웃</a></li>
									<li><a href="#" data-toggle="modal" data-target="#myModal">회원정보수정</a></li>
									<!-- Modal start -->
									
									<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title" id="myModalLabel">정보수정</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">×</span>
													</button>
												</div>
												<form method="post" action="updateMember.food" class="form-horizontal" role="form">
													<div class="modal-body">
														<div class="form-group">
															<div class="col-sm-10">
																이메일<input type="email" class="form-control" id="inputEmail"
																	name="id" placeholder="Email"
																	value='<%=session.getAttribute("id")%>' readonly>
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-10">
																이름<input type="text" class="form-control" id="inputName"
																	name="name" placeholder="Name"
																	value="<%=session.getAttribute("name")%>">
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-10">
																주소<input type="text" class="form-control"
																	id="inputAddress" name="address" placeholder="Address"
																	value="<%=session.getAttribute("address")%>">
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-10">
																휴대전화 번호<input type="text" class="form-control" id="inputPhone"
																	name="phone" placeholder="PhoneNumber"
																	value="<%=session.getAttribute("phone")%>">
															</div>
														</div>
														<div class="form-group">
															<label for="inputAllergy" class="col-sm-5 control-label">알레르기</label>
															<div class="col-sm-10">
																<div class="checkbox-inline">
																	<%
																		String aller = (String) session.getAttribute("allergy");
																		if (aller.contains("대두")) {
																	%>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="대두" checked>대두</label>
																	</div>
																	<%
																		} else {
																	%>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="대두">대두</label>
																	</div>
																	<%
																		}
																		if (aller.contains("땅콩")) {
																	%>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="땅콩" checked>땅콩</label>
																	</div>
																	<%
																		} else {
																	%>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="땅콩">땅콩</label>
																	</div>
																	<%
																		}
																		if (aller.contains("우유")) {
																	%>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="우유" checked>우유</label>
																	</div>
																	<%
																		} else {
																	%>
																	<div class="form-check">
																		<label><input type="checkbox" name="allergy" value="우유">우유</label>
																	</div>
																	<%
																		}
																		if (aller.contains("게")) {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="게" checked>게</label>
																		</div>
																	<%
																		} else {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="게">게</label>
																		</div>
																	<%
																		}
																		if (aller.contains("새우")) {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="새우" checked>새우</label>
																		</div>
																	<%
																		} else {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="새우">새우</label>
																		</div>
																	<%
																		}
																		if (aller.contains("참치")) {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="참치" checked>참치</label>
																		</div>
																	<%
																		} else {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="참치">참치</label>
																		</div>
																	<%
																		}
																		if (aller.contains("연어")) {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="연어" checked>연어</label>
																		</div>
																	<%
																		} else {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="연어">연어</label>
																		</div>
																	<%
																		}
																		if (aller.contains("쑥")) {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="쑥" checked>쑥</label>
																		</div>
																	<%
																		} else {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="쑥">쑥</label>
																		</div>
																	<%
																		}
																		if (aller.contains("소고기")) {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="소고기" checked>소고기</label>
																		</div>
																	<%
																		} else {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="소고기">소고기</label>
																		</div>
																	<%
																		}
																		if (aller.contains("닭고기")) {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="닭고기" checked>닭고기</label>
																		</div>
																	<%
																		} else {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="닭고기">닭고기</label>
																		</div>
																	<%
																		}
																		if (aller.contains("돼지고기")) {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="돼지고기" checked>돼지고기</label>
																		</div>
																	<%
																		} else {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="돼지고기">돼지고기</label>
																		</div>
																	<%
																		}
																		if (aller.contains("복숭아")) {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="복숭아" checked>복숭아</label>
																		</div>
																	<%
																		} else {
																	%>
																	
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="복숭아">복숭아</label>
																		</div>
																	<%
																		}
																		if (aller.contains("민들레")) {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="민들레" checked>민들레</label>
																		</div>
																	<%
																		} else {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="민들레">민들레</label>
																		</div>
																	<%
																		}
																		if (aller.contains("계란흰자")) {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="계란흰자" checked>계란흰자</label>
																		</div>
																	<%
																		} else {
																	%>
																	<div class="form-check">
																	<label><input type="checkbox" name="allergy"
																		value="계란흰자">계란흰자</label>
																		</div>
																	<%
																		}
																	%>
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">취소</button>
															<button type="submit" class="btn btn-primary"
																id="dataSave">수정</button>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
									<!-- Modal end -->

									<li><a href="#" data-toggle="modal" data-target="#userSecede">회원탈퇴</a></li>
									<% } %>
									<!-- 로그인 되어있으면 보이는 화면 ^^^^^^ -->
									<!-- make modal -->
									<!-- Modal start -->
									<div class="modal fade" id="userSecede" tabindex="-1"
										role="dialog" aria-labelledby="myModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title" id="myModalLabel">회원 탈퇴</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<form method="post" action="deleteMember.food"
														class="form-horizontal" role="form">
														<div class="form-group">
															<label for="inputEmail" class="col-sm-5 control-label">이메일</label>
															<div class="col-sm-10">
																<input type="email" class="form-control" id="inputEmail"
																	name="id" placeholder="Email">
															</div>
															<div class="form-group">
																<label for="inputPassword"
																	class="col-sm-5 control-label">패스워드</label>
																<div class="col-sm-10">
																	<input type="password" name="pass" class="form-control"
																		id="inputPassword" placeholder="Password">
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">취소</button>
																<button type="submit" class="btn btn-primary">탈퇴</button>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
									<!-- Modal end -->
								</ul>
							</div>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</div>

	<!-- Core JavaScript Files -->
	<script
		src="${pageContext.request.contextPath}/static/ncss/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/ncss/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/ncss/js/jquery.sticky.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/ncss/js/jquery.easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/ncss/js/jquery.scrollTo.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/ncss/js/jquery.appear.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/ncss/js/stellar.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/ncss/js/nivo-lightbox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/ncss/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/ncss/js/css3-animate-it.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/ncss/contactform/contactform.js"></script>
</body>
</html>