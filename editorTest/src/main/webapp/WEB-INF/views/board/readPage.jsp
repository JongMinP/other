<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <style type="text/css">
  	.widget .panel-body { padding: 0;}
  	.widget .panel-title {display:inline;}
  	.widget .list-group { margin: 0 auto; padding: 0 auto; }
  	.widget li.list-group-item:hover { background-color: rgba(86,61,124,.1); }
  	.widget li.list-group-item {border-radius: 0; border:0; 
  		border-bottom: 1px solid #ddd; padding-top: 5px; padding-bottom: 0px; margin: 0;}
  	.widget .rep_head{font-size: 12px; font-weight: bold; color:#201C1D; height: 12px;}
  	.widget .rep_finduserlist{font-size: 12px;; font-weight: bold; color:#4845FB;}
  	.widget .comment-text { font-size: 12px; font-family: '나눔고딕',NanumGothic,'맑은 고딕','Malgun'; }
	.widget .rep_footer{font-size: 10px; font-weight: bold; color:"#3074a5"; margin: 0 auto; float: right;}
	.finduser {width:20px; background-color:#ccff00; margin-right:7px;}
	#showMeReplyList{cursor:pointer;}
/* 	#newReplyText{border-bottom: 1px; border-top: 1px;}	 */
 	#newReplyText{ border: none;  overflow: auto; outline: none;  -webkit-box-shadow: none; -moz-box-shadow: none; box-shadow: none;}	 
  	.ui-autocomplete {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    float: left;
    display: none;
    min-width: 160px;   
    padding: 4px 0;
    margin: 0 0 10px 25px;
    list-style: none;
    background-color: #ffffff;
    border-color: #ccc;
    border-color: rgba(0, 0, 0, 0.2);
    border-style: solid;
    border-width: 1px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    -webkit-background-clip: padding-box;
    -moz-background-clip: padding;
    background-clip: padding-box;
    *border-right-width: 2px;
    *border-bottom-width: 2px;
}
.ui-helper-hidden-accessible {display: none;}
.ui-menu-item > a.ui-corner-all {
    display: block;
    padding: 3px 15px;
    clear: both;
    font-weight: normal;
    line-height: 18px;
    color: #555555;
    white-space: nowrap;
    text-decoration: none;
}

.ui-state-hover, .ui-state-active {
    color: #ffffff;
    text-decoration: none;
    background-color: #0088cc;
    border-radius: 0px;
    -webkit-border-radius: 0px;
    -moz-border-radius: 0px;
    background-image: none;
}

	</style>
</head>
<body>
<!-- header start -->
<!-- header end -->

<div id="wrapDIV" class="container-fluid text-center">
  <div class="row content">
  	<!-- left start-->
    <!-- left end -->
    
   
    <div class="col-sm-8 text-left">
	<!-- 글수정 혹은 글삭제페이지에 전달된 값들 -->
    <form name="f" role="form">
    	<input type="hidden" name="bno" value="${boardVO.bno}">
    	<input type="hidden" name="cateidx" value="${cri.cateidx }">
    	<input type="hidden" name="page" value="${cri.page }">
    	<input type="hidden" name="searchType" value="${cri.searchType}">
    	<input type="hidden" name="keyword" value="${cri.keyword }">
    </form>
    
  	<!-- 작성자 -->
	  	 <div class="form-group" style="margin-bottom: 0;">
	    	<label for="exampleInputEmail1">${boardVO.writer }</label>
	    	<span style="height:15px; background-color: #eee; font-size: 5px;">${boardVO.regdate}</span>
	  	</div>
	  	<hr style="margin-top: 0px; margin-bottom: 10px;">
	    <!-- 글제목  -->
	  	<div class="form-group">
	    	<label for="exampleInputEmail1">글 제목</label>
	    	<input type="text" class="form-control" name="title" id="title" value="${boardVO.title}" readonly="readonly">
	  	</div>
	  	<hr>
	 	<!-- 글내용 -->
	  	<div class="form-group">
	  		<label for="comment">글 내용</label>
	  		<div class="form-group">${boardVO.content}</div>
		</div>
		<!-- 파일리스트 -->
		<div class="form-group">
			<ul class="list-group">
			<c:forEach items="${filesList}" var="list">
				<c:forEach items="${list}" var="map">
					 <li class="list-group-item">
					 <a href="${map.value}" target="_blank">${map.key}</a>
					 </li>
				</c:forEach>
	  		</c:forEach>
	  		</ul>
		</div>
		<div class="form-group">
	  		<p class="text-right">
				<button type="submit" id="modifyBtn" class="btn btn-warning">수정하기</button>
				<button type="submit" id="removeBtn" class="btn btn-danger">삭제하기</button>
	  		</p>
	  	</div>
	    <!-- right start -->
	    <!-- right end -->
	  </div>
	</div>
</div>
<!-- footer start -->
<!-- footer end -->
</body>
</html>