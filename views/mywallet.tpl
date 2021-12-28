% rebase('base.tpl', title = 'wallet')

<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src='https://cdn.plot.ly/plotly-latest.min.js'></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<body>

<canvas id="myChart" style="width:100%;max-width:600px"></canvas>

<script>
var xValues = {{!values}};
var yValues = {{!labels}};
var barColors = [
  "#b91d47",
  "#00aba9",
  "#2b5797",
  "#e8c3b9",
  "#1e7145"
];
new Chart("myChart", {
  type: "doughnut",
  data: {
    labels: yValues,
    datasets: [{
      backgroundColor: barColors,
      data: xValues
    }]
  },
  options: {
    title: {
      display: true,
      text: "Currently held assets"
    }
  }
});
</script>

</head>
<body>
<div id="chartContainer" style="height: 300px; width: 100%;">
</div>
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

  <h1>All transactions</h1>
  <div class="col-sm-11" "margin-top:50px">

    <br />
    <table style="align=right;width:100%">{{!data}}</table>



  </div>

</body>
</html>
