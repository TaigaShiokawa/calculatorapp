<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator App</title>

<script>
	let lastFocusedInput; //入力フィールドの追跡変数
	/* フォーカスイベント */
	window.onload = function() {
	    let inputs = document.getElementsByTagName('input'); 
	    for(let i = 0; i < inputs.length; i++) {
	        if(inputs[i].type.toLowerCase() === 'text') { //inputタグのname属性がtextなものを追跡
	            inputs[i].onfocus = function() {
	                lastFocusedInput = this; //inputタグを格納
	            };
	        }
	    }
	};
	
	function addToInput(value) {
	    if(lastFocusedInput != null) {
	        lastFocusedInput.value += value; //追跡(フォーカス)されたテキストフィールドに、valueに設定した値を入れる
	    }
	}
	
	function clearInput() {
	    if(lastFocusedInput != null) {
	        lastFocusedInput.value = '0'; //追跡(フォーカス)されたテキストフィールドに0を設定(入力値クリア)
	    }
	}
	
	function backspace() {
	    if(lastFocusedInput != null) {
	        lastFocusedInput.value = lastFocusedInput.value.slice(0, -1);
	    }
	}
</script>

</head>
<body>
<h2>Calculator App</h2>
<form action="calculation-servlet" method="post">
	<label for="add">
	<input type="radio" name="calc" id="add" value="add">＋
	</label>
	<label for="min">
	<input type="radio" name="calc" id="min" value="min">−
	</label>
	<label for="multi">
	<input type="radio" name="calc" id="multi" value="multi">＊
	</label>
	<label for="dev">
	<input type="radio" name="calc" id="dev" value="dev"> ÷ &nbsp;<br>
	</label>
	<input type="text" name="calc1" autocomplete="off"><br>
	<input type="text" name="calc2" autocomplete="off"><br>
	
	<input type="radio" name="calcMulti" value="multi2">＊<br>
    <input type="text" name="calc3" autocomplete="off"><br>
<% 
   Integer result = (Integer)request.getAttribute("result");
   int res = (result != null) ? result.intValue() : 0;
%>
	<div><%= res %></div> <!-- 計算結果 -->

	<button type="submit" name="action" value="clearResult">Clear Result</button><!-- 計算結果クリア -->
	
	<div><br>
		<button type="button" onclick="backspace()">C</button> / 
		<button type="button" onclick="clearInput()">A</button><br><!-- 入力値クリア -->
		<button type="button" onclick="addToInput('7')">7</button>
		<button type="button" onclick="addToInput('8')">8</button>
		<button type="button" onclick="addToInput('9')">9</button><br>
		<button type="button" onclick="addToInput('4')">4</button>
		<button type="button" onclick="addToInput('5')">5</button>
		<button type="button" onclick="addToInput('6')">6</button><br>
		<button type="button" onclick="addToInput('1')">1</button>
		<button type="button" onclick="addToInput('2')">2</button>
		<button type="button" onclick="addToInput('3')">3</button><br>
		<button type="button" onclick="addToInput('0')">0</button>
		<button type="button" onclick="addToInput('00')">00</button>
		<button type="submit" name="action" value="calculation">＝</button>
	</div>
</form>
</body>
</html>
