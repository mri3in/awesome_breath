<?php
include("../config.php");
// Establishing Connection with Server by passing server_name, user_id and password as a parameter
//$connection = mysql_connect("localhost", "root", "");
// Selecting Database
//$db = mysql_select_db("breath", $connection);
session_start();// Starting Session
// Storing Session
$user_check=$_SESSION['login_user'];
// SQL Query To Fetch Complete Information Of User
$ses_sql=mysqli_query($db,"select user_name from user where user_name='$user_check'");
$row = mysqli_fetch_array($ses_sql,MYSQLI_ASSOC);
$login_session =$row["user_name"];
if(!isset($login_session)){
mysqli_close($db); // Closing Connection
header('Location: ../index.php'); // Redirecting To Home Page
}
?>