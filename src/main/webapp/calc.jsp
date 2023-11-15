<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator App</title>
<script>
let lastFocusedInput;
/* フォーカスイベント */
window.onload = function() {
    let inputs = document.getElementsByTagName('input');
    for(let i = 0; i < inputs.length; i++) {
        if(inputs[i].type.toLowerCase() === 'text') {
            inputs[i].onfocus = function() {
                lastFocusedInput = this;
            };
        }
    }
};

function addToInput(value) {
    if(lastFocusedInput != null) {
        lastFocusedInput.value += value;
    }
}

function clearInput() {
    if(lastFocusedInput != null) {
        lastFocusedInput.value = '0';
    }
}
</script>

</head>
<body>
<h2>Calculator App</h2>
<form action="calculation-servlet" method="post" id="calcForm">
	<input type="radio" name="calc" value="add">+
	<input type="radio" name="calc" value="min">−
	<input type="radio" name="calc" value="multi">＊
	<input type="radio" name="calc" value="dev">÷&nbsp;<br>
	<input type="text" name="calc1" id="inputField" autocomplete="off"><br>
	<input type="text" name="calc2" id="inputField2" autocomplete="off">
	<button type="submit" name="action" value="calculation">=</button>
<% 
   Integer result = (Integer)request.getAttribute("result");
   int res = (result != null) ? result.intValue() : 0;
%>
	<div id="resultDisplay"><%= res %></div> <!-- 計算結果 -->

	<form action="calculation-servlet" method="post">
	    <button type="submit" name="action" value="clearResult">Clear Result</button><!-- 計算結果クリア -->
	</form>

	<div><br>
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
		<button type="button" onclick="clearInput()">Clear</button><!-- 入力値クリア -->
	</div>
</form>
</body>
</html>
