<link rel="stylesheet" href="static/css/login.css">
% rebase('base.tpl', title = 'Order')
<div class="login-page">
  <div class="form">
    <h4 >Choose crypto to make an order:</h3>
    <form action="/orderbefore" method="post">
      <select class="form-control" id="sel1" name="chosen">
        % for crypto in cryptos:
        <option>{{!crypto}}</option>
        % end
      </select>
      <button style="margin-top: 20px">Pick</button>
    </form>
  </div>
</div>
