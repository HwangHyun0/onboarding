<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/include.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
<link rel="stylesheet" type="text/css" href="/res/css/hwang-css/hwang-common.css">

   <!-- body -->
   <body class="main-layout">
      <!-- loader  -->
   	 <%@include file="/WEB-INF/jsp/hwang/hwang-header.jsp"%>
      <!-- end header -->
      <!-- start slider section -->
      <div class=" banner_main">
         <div class="container-fluid">
            <div class="row">
               <div class="col-md-5">
                  <div class="bluid">
                     <h1>Best <br><span class="black">lovely Bro <br> Photo</span></h1>
                  </div>
               </div>
               <div class="col-md-7">
                  <div id="myCarousel" class="carousel slide" data-ride="carousel">
                     <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                     </ol>
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <div class="container">
                              <div class="carousel-caption relative">
                                 <div class="banner_img">
                                    <figure><img src="/res/img/hwang/broSmail.jpeg" alt="#"/></figure>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="carousel-item">
                           <div class="container">
                              <div class="carousel-caption relative">
                                 <div class="banner_img">
                                    <figure><img src="/res/img/hwang/broSmail.jpeg" alt="#"/></figure>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="carousel-item">
                           <div class="container">
                              <div class="carousel-caption relative">
                                 <div class="banner_img">
                                    <figure><img src="/res/img/hwang/broSmail.jpeg" alt="#"/></figure>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                     <i class="fa fa-angle-left" aria-hidden="true"></i>
                     <span class="sr-only">Previous</span>
                     </a>
                     <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                     <i class="fa fa-angle-right" aria-hidden="true"></i>
                     <span class="sr-only">Next</span>
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
       <%@include file="/WEB-INF/jsp/hwang/hwang-footer.jsp"%>
      
   </body>
