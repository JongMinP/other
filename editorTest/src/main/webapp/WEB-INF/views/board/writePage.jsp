<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
  <script src="/resources/editor/dist/summernote.js"></script>
  
  
  <script type="text/javascript">
  	
  	function sendFile(file, editor){
  		//html5에 기능중 하나인 FormData를 생성 : <form>태그로 만든 데이터의 전송 방식과 동일하게 파일 데이터를 전송할 수 있음.
  		var formdata = new FormData();
  		formdata.append("file", file);
  		$.ajax({
  			type:"POST",
  			url:'/uploadEditorForm',
  			data:formdata,
  			dataType:'text',
  			cache : false,
  			//데이터를 일반적인 query string으로 변활 할것인지 결정, 다른 데이터형식으로 데이터를 보내기위해 자동 변환 방지
  			//dafault:application/x-www-form-urlencoded -변경> 
  			processData:false,
  			//dafalut:application/x-www-form-urlencoded -변경> multipart/form-data 
  			contentType:false,
  			success:function(data){
  				console.log(data);
  				//서버명과 로컬호스트가 없어서 안된거였음.
  				var url = data;
  				console.log(url);
  				$('#summernote').summernote('insertImage', url);
  				//url를 받아서 li<input type=hidden name='files' value="url을 넣어준다.">
  				var dataname = data.substring(url.indexOf("_") + 1);
 				$(".list-group").append("<li class='list-group-item'>"+dataname+"<input type='hidden' name='file_url' value='"+url+"'/></li>");
  			}
  		});
  	}
  	
  	function deleteFile(file){
  		//이미지를 클릭후 삭제버튼을 클릭했을때 url이 깨져서 들어것을 다시 디코딩
		var currentFileName = decodeURIComponent(file);
  		
		$.ajax({
			url:'/deleteFile',
			type:'post',
			data:{fileName:currentFileName},
			dataType:'text',
			success:function(result){
				if(result == 'deleted'){
					//---/2016/09/19/5e617c4d-998f-4db7-bb55-554dec4d8e94_[스프링 생명주기.png] 잘라내기
					currentFileName = currentFileName.substring(currentFileName.indexOf("_") + 1);
					
					$(".list-group-item").each(function(index){
						var value = $(this).text();
						//루프를 돌면서 하나씩 텍스트 내용과 삭제되는 파일이름을 비교
						if(currentFileName === value){
							//에디터에 있는 이미지가 삭제된다면 하단에 표시된 파일명도 같이삭제 된다.
							$(this).remove();
						}
			  		});
				}
			}
		});
  	}
  </script>
</head>
<body>
<!-- header start -->
<!-- header end -->
	
<div class="container-fluid text-center">
  <div class="row content">
  	<!-- left start-->
    <!-- left end -->
    <div class="col-sm-8 text-left">
    <div class="page-header">
    	<h4>글작성 페이지</h4>
    </div>
    <form name="f" role="form" id="editorForm" method="post" action="/board/writeProc">
    
    <!-- 히든을 통해서 카테고리 넘버를 넘겨준다. -->
    <input type="hidden" name="cateidx" value="10000" >
    <input type="hidden" name="parentidx" value="">
    <!-- 히든을 통해서 유저의 아이디정보를 넘겨준다. -->
    <input type="hidden" name="userid" value="admin">
  	<!-- 작성자 -->
  	 <div class="form-group">
    	<input type="text" class="form-control" name="writer" readonly="readonly" value="관리자황">
  	</div>
  	
  	<hr style="margin-top: 0px; margin-bottom: 10px;">
  	
    <!-- 글제목  -->
  	<div class="form-group">
    	<label for="exampleInputEmail1">글 제목</label>
    	<input type="text" class="form-control" name="title" id="title" placeholder="글 제목을 입력하세요.">
  	</div>
  	
 	<!-- 글내용 -->
  	<div class="form-group">
  		<label for="comment">글 내용</label>
 		 <textarea class="form-control" rows="5" name="content" id="summernote"></textarea>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
  		$('#summernote').summernote({
  			//이미지 업로드를 위함
			callbacks : {
						onImageUpload : function(files, editor, welEditable) {
							sendFile(files[0], this);
						},
  						onMediaDelete:function($target, editor, $editable){
  							deleteFile($target[0].src);
  						},
  						lang: 'ko-KR'
					}
			});
		});
	</script>
	<div class="form-group">
 		 <ul class="list-group">
		</ul>
	</div>
	<div class="form-group">
  		<p class="text-right">
  			<button type="button" id="goListBtn" class="btn btn-default">글목록</button>
  			<button type="submit" id="submitBtn" class="btn btn-default">전송하기</button>
  		</p>
  	</div>
	</form>
    </div>
    
    <!-- right start -->
    <!-- right end -->
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
</body>
</html>