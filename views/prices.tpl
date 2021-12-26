% rebase('base.tpl', title = 'Prices')

<h1>Actual data of cryptocurrency prices</h1>
<button type="button" class="btn btn-success">Buy</button>
<button type="button" class="btn btn-danger">Sell</button>
<div class="col-sm-11" "margin-top:50px">

  <br />
  <table style="align=centre;width:100%">{{!data}}</table>

  <ul class="nav nav-pills flex-column">
    <li class="nav-item">
      <a class="nav-link" href="/spolki">Sprawdź wykresy dla kompenentów indeksu!</a>
    </li>
  </ul>

</div>
