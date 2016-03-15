<?php
include('php/login.php'); // Includes Login Script

if(isset($_SESSION['login_user'])){
header("location: php/profile.php");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/styles.css">
  <script src="js/jquery-2.1.4.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/script.js"></script>
  <script src="lib/angular/angular. min.js"></script>
  <script src="js/controllers.js"></script>
  <title>BREATH v1.0</title>
</head>
<body>

<div class="container">

    <div class="col-sm-12 col-md-12 col-lg-12">
      <form class="form-signin" action="" method="post">
        
        <h2 class="form-signin-heading text-center">BREATH v1.0</h2>
        
        <div class="form-group">
        <label for="inputName" class="control-label">User name</label>
        <input type="text" id="inputName" name="username" class="form-control" placeholder="User name" required autofocus>
        </div>
        
        <div class="form-group">
        <label for="inputPassword" class="control-label">Password</label>
        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
        </div>
        
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <a href="">Forgot Your Password? </a>
        <div >
          <input class="pull-right" name="submit" type="submit" value=" Login ">
        </div>
        
        <span style="color:red;"><?php echo $error; ?></span>
        
      </form>

    </div>

</div>

<div id="footer"></div>

</body>
</html>