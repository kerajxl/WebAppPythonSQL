% rebase('base.tpl', title = '')

<div class="container">
<br />
  <h3>Choose crypto:</h3>
  <form action="/graph" method="post">
    <div class="form-group">
      
      <select class="form-control" id="sel1" name="chosen">
	    % for crypto in cryptos:
		<option>{{!crypto}}</option>
		% end 
      </select>
      <br>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
   
 
  </form>