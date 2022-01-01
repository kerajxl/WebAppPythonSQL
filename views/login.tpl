<link rel="stylesheet" href="static/css/login.css">
%rebase('base.tpl', title = 'Login')
<div class="login-page">
  <div class="form">
     <form action ="/login"  method= "post">
      <input type="text" placeholder="username" name = "login" formmethod = "post"/>
      <input type="password" placeholder="password" name = "password" formmethod = "post"/>
      <button>login</button>
      <p class="message">Not registered? <a href="/createAccount" style="color: #6e0366;">Create an account</a></p>
    </form>
  </div>
</div>
