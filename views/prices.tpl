% rebase('base.tpl', title = 'Prices')
<link rel="stylesheet" href="/static/css/table.css">
<h1 style="text-align: center; color: #FFFFFF;">Actual data of cryptocurrency prices</h1>



<div class="container" style="text-align: center;">
  <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for cryptocurrency..">
  <!--button type="button" class="btn btn-success">Buy</button-->
  <!--button type="button" class="btn btn-danger">Sell</button-->
  <a href="/orderbefore" class="btn btn-success">Buy</a>
  <a href="/orderbefore" class="btn btn-danger">Sell</a>
<div style="margin:auto">
  <table id="myTable" class="center">
    <tr class="header">
      % for id, elem in enumerate(data):
        % if id == 0:
      <th style="width:60px;" onclick="sortTable(0)">ID</th>
      <th style="width:40px;" onclick="sortTable(1)">{{data[id][0]}}</th>
      <th style="width:40px;" onclick="sortTable(2)">{{data[id][1]}}</th>
      <th style="width:40px;" onclick="sortTable(3)">{{data[id][2]}}[milions]</th>
      <th style="width:40px;" onclick="sortTable(4)">{{data[id][3]}}[milions]</th>
    </tr>
        % else:
          <tr>
            <td>{{id}}</td>
            <td>{{elem[0]}}</td>
            <td>${{elem[1]}}</td>
            <td>{{elem[2]//1000000}}</td>
            <td>{{elem[3]//1000000}}</td>
          </tr>
        % end
      % end
  </table>
</div>

</div>

<script>
function myFunction() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
</script>
<script>
function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("myTable");
  switching = true;
  // Set the sorting direction to ascending:
  dir = "asc";
  /* Make a loop that will continue until
  no switching has been done: */
  while (switching) {
    // Start by saying: no switching is done:
    switching = false;
    rows = table.rows;
    /* Loop through all table rows (except the
    first, which contains table headers): */
    for (i = 1; i < (rows.length - 1); i++) {
      // Start by saying there should be no switching:
      shouldSwitch = false;
      /* Get the two elements you want to compare,
      one from current row and one from the next: */
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /* Check if the two rows should switch place,
      based on the direction, asc or desc: */
      if (dir == "asc") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          // If so, mark as a switch and break the loop:
          shouldSwitch = true;
          break;
        }
      } else if (dir == "desc") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          // If so, mark as a switch and break the loop:
          shouldSwitch = true;
          break;
        }
      }
    }
    if (shouldSwitch) {
      /* If a switch has been marked, make the switch
      and mark that a switch has been done: */
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      // Each time a switch is done, increase this count by 1:
      switchcount ++;
    } else {
      /* If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again. */
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
</script>
