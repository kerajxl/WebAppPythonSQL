<link rel="stylesheet" href="static/css/login.css">
% rebase('base.tpl', title = 'Order')
<div class="order-page">
  <div class="form">
    <form action="/orderbefore" method="post">
      <select class="form-control" id="sel1" name="chosen">
        % for crypto in cryptos:
        <option>{{!crypto}}</option>
        % end
      </select>
      <button>Pick</button>
    </form>
  </div>
</div>
