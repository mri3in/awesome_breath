<?php
   include('session.php');
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/styles.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"> 

  <script src="../js/jquery-2.1.4.min.js"></script>
  <script  src="../js/bootstrap.min.js"></script>
  <script src="../js/partialsScript.js"></script>
  <title>Index</title>
</head>
<body>

<div id="header"></div>

<div class="container">

        <div class="row">
            <div class="col-lg-12" id="welcome">
                <h1 class="page-header" id="profile">Welcome
                    <strong><?php echo $login_session; ?></strong>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Profile</h2>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
              <a href="../html/user.html">
                <img class="img-circle img-responsive img-center" src="../images/user.png" alt="">
                <h3>User Management
                </h3>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
              <a href="../html/inventory.html">
                <img class="img-circle img-responsive img-center" src="../images/inventory.png" alt="">
                <h3>Inventory
                </h3>
              </a>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
              <a href="../html/sale.html">
                <img class="img-circle img-responsive img-center" src="../images/sale.png" alt="">
                <h3>Customer
                </h3>
              </a>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
              <a href="">
                <img class="img-circle img-responsive img-center" src="../images/password.png" alt="">
                <h3>Change password
                </h3>
              </a>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
              <a href="">
                <img class="img-circle img-responsive img-center" src="../images/setting.png" alt="">
                <h3>Profile Setting
                </h3>
              </a>
            </div>
        </div>

</div>
<div id="footer"></div>
</body>
</html>