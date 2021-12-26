% rebase('base.tpl', title = 'Graph')

<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script src='https://cdn.plot.ly/plotly-latest.min.js'></script>


</head>
<body>


<br/>
<b><h2 style="text-align:center;">{{!title}}</b></h2>

 <div id="myDiv" style="width:800px;height:600px; margin-left: 250px;">

	    <script>
		      var wykr1 = {
              x: {{!day}},
              y: {{!price}},
              type: 'scatter'
                     };

            var data = [wykr1];

		Plotly.newPlot('myDiv', data);
		</script>


</div>
</body>
</html>
