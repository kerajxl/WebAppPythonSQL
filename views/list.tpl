% rebase('base.tpl', title = '')
<link rel="stylesheet" href="static/css/login.css">
<div class="login-page">
  <div class="form">
  <h4 style="margin-bottom: 20px">Choose crypto:</h3>
  <form action="/graph" method="post">
      <select class="form-control" id="sel1" name="chosen">
        % for crypto in cryptos:
        <option>{{!crypto}}</option>
        % end
      </select>
    <button type="submit" class="btn btn-primary" style="margin-top: 20px">Submit</button>
  </form>
</div>
