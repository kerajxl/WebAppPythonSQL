% rebase('base.tpl', title = 'Graph')

<head>
  <title>Pie Chart</title>
  <script src="https://cdn.anychart.com/releases/8.0.1/js/anychart-core.min.js"></script>
  <script src="https://cdn.anychart.com/releases/8.0.1/js/anychart-pie.min.js"></script>
</head>

<body>
  <div id="container" style="width: 100%; height: 100%"></div>
  <script>
    anychart.onDocumentReady(function() {

      // set the data
      var data = [{
        x: {
          {
            !name
          }
        },
        value: {
          {
            !quantity
          }
        }
      }, ];

      // create the chart
      var chart = anychart.pie();

      // set the chart title
      chart.title("Distribution of current assets");

      // add the data
      chart.data(data);
      // set legend position
      chart.legend().position("right");
      // set items layout
      chart.legend().itemsLayout("vertical");
      chart.sort("desc");
      // display the chart in the container
      chart.container('container');
      chart.draw();

    });
  </script>
</body>
