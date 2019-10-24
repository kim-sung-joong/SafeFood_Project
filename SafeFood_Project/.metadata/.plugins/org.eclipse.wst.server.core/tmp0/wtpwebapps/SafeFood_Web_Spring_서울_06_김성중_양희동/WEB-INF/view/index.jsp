<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Bocor bootstrap 3 one page template</title>
  <!-- Vue -->
<script src="https://unpkg.com/vue"></script>
<!-- Vue 최신버전 반영cdn -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<!-- axios cdn -->


  <!-- css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ncss/css/bootstrap.min.css">
  <link href="${pageContext.request.contextPath}/static/ncss/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link href="${pageContext.request.contextPath}/static/ncss/css/nivo-lightbox.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/static/ncss/css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
  <link href="${pageContext.request.contextPath}/static/ncss/css/animations.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/static/ncss/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/static/ncss/color/default.css" rel="stylesheet">
  <style type="text/css">
  
  </style>
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="display: grid;">
  <section class="hero" id="intro">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-right navicon">
          <a id="nav-toggle" class="nav_slide_button" href="#"><span></span></a>
        </div>
      </div>
      <div class="row">
        <div class="col-md-8 col-md-offset-2 text-center inner">
          <div class="animatedParent">
          <div style="opacity: 1;">
            <h1 class="animated fadeInDown">SAFE FOOD</h1>
            <p class="animated fadeInUp" style="font-style: italic;">SAFE AND HEALTHY FOR YOU</p>
          </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 col-md-offset-3 text-center">
          <a href="foodSelectAll.food" class="learn-more-btn btn-scroll" style="opacity:1;">COME HERE</a>
        </div>
      </div>
    </div>
  </section>

 <footer id="footer">
    <div class="container" style="margin-left: 0px; margin-right: 0px; width : 100%;">
      <div class="row">
        <div class="col-md-6">
          <ul class="footer-menu">
            <li><a href="#">Home</a></li>
            <li><a href="#">Press release</a></li>
          </ul>
        </div>
        <div class="col-md-6 text-right copyright">
          &copy;Copyright - KSJYHD
          <div class="credits">
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
          </div>
        </div>
      </div>
    </div>
  </footer>


  <!-- Core JavaScript Files -->
  <script src="${pageContext.request.contextPath}/static/ncss/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/ncss/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/ncss/js/jquery.sticky.js"></script>
  <script src="${pageContext.request.contextPath}/static/ncss/js/jquery.easing.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/ncss/js/jquery.scrollTo.js"></script>
  <script src="${pageContext.request.contextPath}/static/ncss/js/jquery.appear.js"></script>
  <script src="${pageContext.request.contextPath}/static/ncss/js/stellar.js"></script>
  <script src="${pageContext.request.contextPath}/static/ncss/js/nivo-lightbox.min.js"></script>

  <script src="${pageContext.request.contextPath}/static/ncss/js/custom.js"></script>
  <script src="${pageContext.request.contextPath}/static/ncss/js/css3-animate-it.js"></script>
  <script src="${pageContext.request.contextPath}/static/ncss/contactform/contactform.js"></script>
</body>
</html>
