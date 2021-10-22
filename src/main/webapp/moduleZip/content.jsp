<%@ page contentType="text/html; charset=utf-8"%>

<div class="contentWrap">
	
	<div class="content1">
		<img src="/homepage2/images/content1.jpg">
	</div>
	
	<div class="content2">
		<div class="images">
			<div class="img1">
				<a href="#" class="notyet2"><img src="/homepage2/images/content2_1.jpg"></a>
			</div>
			
			<div class="img2">
				<a href="#" class="notyet2"><img src="/homepage2/images/content2_2.jpeg"></a>
			</div>
		</div>
	</div>
	
</div>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

$(".notyet2").on("click", function(){
	alert("기능 미구현");
})

</script>