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


  <br />
  <b>
    <h2 style="text-align:center; color: #FFF">{{!title}}
  </b></h2>

  <div id="myDiv" style="width:800px;height:600px; margin-left: 250px;">

    <script>
      var trace1 = {
        x: {{!day}},
        y: {{!price}},
        type: 'scatter',
        name: 'Close',
        marker: {
          color: "rgb(255, 255, 255)"
        }
      };

      var trace2 = {
        x: {{!day}},
        y: {{!high}},
        type: 'scatter',
        name: 'High',
        marker: {
          color: "rgb(0, 255, 0)"
        }
      };

      var trace3 = {
        x: {{!day}},
        y: {{!low}},
        type: 'scatter',
        name: 'Low',
        marker: {
          color: "rgb(255, 0, 0)"
        }
      };

      var layout = {
        plot_bgcolor: "rgba(0, 0, 0, 0.5)",
        paper_bgcolor: "rgba(0, 0, 0, 0.5)",
        xaxis: {
      tickcolor: '#FFF'
      },
      font:{
        color: "#FFF"
      },
      yaxis: {
        tickcolor: '#FFF'
      }
      }
      var data = [trace1, trace2, trace3];

      Plotly.newPlot('myDiv', data, layout);
    </script>


  </div>
</body>

</html>
