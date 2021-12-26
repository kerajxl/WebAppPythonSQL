<link rel="stylesheet" href="static/css/login.css">
%rebase('base.tpl', title = 'Login')
<div class="login-page">
  <div class="form">
  
   
   
  <form action ="/createAccount"  method= "post">
  <input type="text" placeholder="login" name = "login" formmethod = "post"/>
      <input type="password" placeholder="password" name = "password" formmethod = "post"/>
      <input type="text" placeholder="email address" name = "email" formmethod = "post"/>
      <button>create</button>
      <p class="message">Already registered? <a href="/login">Sign In</a></p>
    </form>
  </div>
</div>
