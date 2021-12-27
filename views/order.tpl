<link rel="stylesheet" href="static/css/login.css">
% rebase('base.tpl', title = 'Order')
<div class="order-page">
  <div class="form">
    <form action="/order" method="post">
      <input type="text" placeholder="amount (like 0.05)" name="amount" formmethod="post" />
      <p>{{!crypto}}</p>
      <p id="price">{{!prize}}</p>
      <select class="orderType" name="orderType">
        <option value="buy">Buy</option>
        <option value="sell">Sell</option>
      </select>
      <button>Submit</button>
    </form>
  </div>
</div>
