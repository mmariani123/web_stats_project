<!DOCTYPE HTML>

<?php
// PHP code goes here
if(isset($_POST["var1"])&&isset($_POST["var2"])&&isset($_POST["var3"])&&isset($_POST["var4"]))
{
	$var1 = $_POST["var1"];
	$var2 = $_POST["var2"];
	$var3 = $_POST["var3"];
	$var4 = $_POST["var4"];
	$result = $var1+$var2+$var3+$var4;
	#echo($result);
}
if(isset($_POST["valuesArea"]))
{
	$var = $_POST["valuesArea"][0][4];
	echo($var);
}
?>



<html lang = "en">
  <head>
    <title>formDemo.html</title>
    <meta charset = "UTF-8" />
	 <img src="uvm.png" alt="Banner Image"/>
  </head>
  <body style="position:relative;height:100%;width:100%">
 <!-- <div style="width:200px;float:left;display:inline-block;"> -->
	<div style="width:400px;position:absolute;left:50px;top:110px;"> 
    <h1>Statistical Calculator</h1>
    <form action="index.php" method="post">
      <fieldset style="height:310px;">
        <legend>Variable input</legend>
        <p>
			<label>Variable 1</label>
			<input type="text" name="var1"> 
        </p>
        <p>
			<label>Variable 2</label>
			<input type="text" name="var2"> 
        </p>
		<p>
			<label>Variable 3</label>
			<input type="text" name="var3"> 
        </p>
		<p>
			<label>Variable 4</label>
			<input type="text" name="var4"> 
        </p>
		<p>
			<input type="submit" value="Submit">
		</p>
        <p>
          <label>Output P-value:</label>
		  </br>
			<textarea rows="4" cols="50"> P-value = <?php echo($result); ?> </textarea>
        </p>
      </fieldset>
	 </form>
	</div>
	<div id="thisDiv" style="width:400px;height:400px;position:absolute;left:500px;top:200px;">
		
		<!--
		<p>Click the button to change the contents of the text area.</p>
		<button type="button" onclick="myFunction()">Try it</button>
		<script type=text/javascript>
		function myFunction() 
		{
			document.getElementById("valuesArea").value = "Fifth Avenue, New York City";
		}
		</script>
		-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="jquery-3.2.1.min.js"></script>
		<script>
		function myFunction2()
		{	
			//alert("Fun!");
			//$(document).ready(function(){
			//$("#clickButton").click(function(){
			//$(this).hide();
			//var obj = { "name":"John", "age":30, "city":"New York"};
			//Use the JavaScript function JSON.stringify() to convert it into a string.
			//var myJSON = JSON.stringify(obj);
			$(document).ready(function(){
				//$(this).hide();
				$.ajax({
					method: 'POST',
					url: 'script.php',
					data: {players: "Title_sent_from_website"},
					//data: myJSON,
					dataType:'text',
					success: function(data) {
						//	$('#thisDiv').text(data);
						alert(data);
					}
				});
			});		
			
				function sleepFunction()
				{
					alert("wait time is over");
					var img = document.createElement("IMG");
					img.src = "rplot.jpg";
					img.height = "300";
					img.width="400"
					$('#imageDiv').html(img); 
					//loadImage('rplot.jpg', 800, 800, '#imageDiv');
					//var img = new Image();
					//img.src = 'rplot.jpg';
					//img.height = "200";
					//img.width = "200";
					//var ctx = canvas.getContext("2d");
					//ctx.drawImage(img, 0, 0, 400, 400);
					//img.appendTo('#imageDiv');
				}
				
				
				function WriteFile()
				{
					var fh = fopen("MyFile.txt", 3); // Open the file for writing
					if(fh!=-1) // If the file has been successfully opened
					{
						var str = "Some text goes here...";
						fwrite(fh, str); // Write the string to a file
						fclose(fh); // Close the file 
					}

				}
				
			try 
			{
				//alert("Hello");
				var area = document.getElementById("valuesArea");
				var values = area.value;
				//var numValues = area.value.length;
				var rows = area.value.split(/\n/);
				var firstLine = rows[0];
				//alert(areaValueString);
				var firstLineCount = firstLine.split(/\s+/).length;
				var lineCount = rows.length;
				
				//Let's sum the rows:
				var rowSums = new Array(lineCount);
				//alert(rowSums.length);
				for (index = 0; index < lineCount; index++) 
				{
					var rowSub = rows[index].split(/\s+/).map(Number);
					//alert(rowSub);
					sum=0;
					for (index2 = 0; index2 < rowSub.length; index2++)
					{
						sum+=rowSub[index2];
					}
					rowSums[index] = sum;
				}
				
				//Let's sum the columns:
				var allVals = area.value.replace(/\n/g," ").split(/\s+/)
				//alert(allVals);
				var numCols = Math.floor(allVals.length/lineCount);
				//alert(numCols);
				
				var colSums = new Array(numCols);
				//alert(colSums.length);
				for (index3 = 0; index3 < numCols; index3++) 
				{
					sum2=0;
					for (index4 = index3; index4 < allVals.length; index4+=numCols)
					{
						sum2+=parseInt(allVals[index4]);
					}
					colSums[index3] = sum2;
				}
				
				//alert(rowSums[1]);
				//alert(colSums[1]);
				var colResults = colSums.join();
				var rowResults = rowSums.join();
				document.getElementById("outputArea").value = "Row Sums = "+rowResults+"\nColumn Sums = "+colResults;
				
				setTimeout(sleepFunction, 3000);
				WriteFile();
				
				
			}
			catch(err)
			{
				alert("Error!");
			}
		}
		</script>
		
		 <fieldset style="height:300px;">
		 <p>
			<label>Input rows and columns:</label>
			</br>
			<textarea rows="15" cols="50" id="valuesArea" name ="valuesArea[]" > Paste rows and columns here </textarea>
			<button type="button" onclick="myFunction2()">Try it</button>
        </p>
		</fieldset>
	</div>	
	
	<div style="width:400px;height:400px;position:absolute;left:950px;top:200px;">
		<fieldset style="height:300px;">
		 <p>
			<label>Output:</label>
			</br>
			<textarea rows="15" cols="50" id="outputArea" name ="outputArea" > Results are output here. </textarea>
        </p>
		</fieldset>
	</div>
	
	<div id="imageDiv" style="width:400px;height:400px;position:absolute;left:1400px;top:200px;">
	</div>
	
	<img src="mmg_2.jpg" alt="Banner Image" height="300" width=100% style="position:absolute; top:600px; left:0px;"/>
  </body>
</html>
