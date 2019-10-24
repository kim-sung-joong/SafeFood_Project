<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue"></script>
<!-- Vue 최신버전 반영cdn -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<%@include file="nav.jsp"%>
<div id='app'>
	<table>
		<tr style="display: inline-block; width: 90%; margin-left: 80px;">
			<template v-for="temp in list">
					<td style="margin: 10px; width:400px; border: 1px groove; float: left; height: 300px; padding-left: 5px; padding-right: 5px;">
						<div>
							<p style="margin-top: 10px;"><a v-bind:href="temp.link" v-html="temp.title"></a></p>
						</div>
						<hr>
						<div>
							<p v-html="temp.description"></p>
						</div>
						<hr>
						<div>
							<p>{{temp.pubDate}}</p>
						</div>
					</td>
			</template>
		</tr>
	</table>
</div>
<%@include file="footer.jsp" %>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data() {
			return {
				list : [],
				loading : true,
				errored : false
			}
		},
		mounted() {
			axios.get('news')
				 .then(response => {
					 console.log(response.data.items)
					 this.list = response.data.items
				 })
				 .catch(error => {
					 console.log(error)
					 this.errored = true
				 })
				 .then(() => (this.loading = false))
		}
	});
</script>
</body>
</html>