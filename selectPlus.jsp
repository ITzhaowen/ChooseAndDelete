<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>选择页</title>
    </head>
    <script type="text/javascript" src="js/jquery-3.2.1.js" ></script>
    <style>
    	/*每一个被选的值 div 的样式*/
    	.ingredients{
    		margin: 3px;
    		float: left;
    		background-color: darkgrey;
    		border-radius: 2px;
    		cursor: pointer;	
    	}
    	
    	/* 显示选中的值 */
    	#chooseFlag{
    		height:200px ;
    		width: 60%;
    		overflow-y:scroll;
    	}
    	
    	#goodingredients{
    		font-size: xx-large;
    		width: 60%;
    		height: 300px;
    	}
    </style>
    <script>
		//页面初始化完毕后执行此方法
		$(function(){
			autoCreateFood();
		});
	
	//自动创建div 展示 食材
	function autoCreateFood(){
	    for(var i = 0; i <= 100; i++){
			//创建每一个显示的 DIV
			var row = $("<div class='ingredients " +
					i +
					"', onclick='chooseClick(" +
					i +
					")'>" +
		     		"&nbsp&nbsp&nbsp&nbsp"+
		     		i +
		     		"&nbsp&nbsp&nbsp&nbsp"+
   				"</div>");
	    	$("#chooseFlag").append(row); 
		}
	}
	
	//点击 食材选项后，将食材中的内容，添加到指定位置
	function chooseClick(value){
		var oldValue = $("#goodingredients").val();
		var split = oldValue.split("，");
		var indexOfValue = oldValue.indexOf(value);
		var changeBg = "."+value; //拼接 class 的值
		//再次点击后，如果输入区域有相同的值，将值从输入区域去掉。
		if(indexOfValue != -1){ // oldValue 中不包含 value
			var oneStr = oldValue.substring(0,indexOfValue);
			//value/10：由于，十位数，千位数的时候去除的个数不一样，所以加这个值做控制
			var twoStr = oldValue.substring(indexOfValue+2+value/10,oldValue.length);
			$("#goodingredients").val(oneStr+twoStr);
			$(changeBg).css("background-color","darkgrey");
		}else{
			$("#goodingredients").val(oldValue + value +"，");
			$(changeBg).css("background-color","#E2E2E2");
		}
	}
    </script>
    <body>
    	<!-- <textarea>这里的值会在输入区域显示（包括空格）</textarea> -->
    	<textarea id="goodingredients"> </textarea>
    	<div id="chooseFlag">
    	</div>
 	</body>
</html>