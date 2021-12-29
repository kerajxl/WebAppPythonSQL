% rebase('base.tpl', title = 'Ranking')

<h1>Check your position in the competition!</h1>

<div class="col-sm-11" "margin-top:50px">

  <br />
  <style>
table, td, th {
  border: 1px solid black;
}

table {
  border-collapse: collapse;
  width: 100%;
}

td {
  text-align: center;
}
tr:hover {background-color: red;}
</style>
  <table >{{!data}}</table>

  <ul class="nav nav-pills flex-column">
    <li class="nav-item">
      <a class="nav-link" href="/mywallet">Inspect your wallet!</a>
    </li>
  </ul>

</div>
