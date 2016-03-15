<?php
include('config.php');
session_start(); // Starting Session
$error=''; // Variable To Store Error Message
if (isset($_POST['submit'])) {
// Define $username and $password
$username=$_POST['username'];
$password=$_POST['password'];
// Establishing Connection with Server by passing server_name, user_id and password as a parameter
//$connection = mysql_connect("localhost", "root", "");
// To protect MySQL injection for Security purpose
$username = stripslashes($username);
$password = stripslashes($password);
$username = mysqli_real_escape_string($db,$username);
$password = mysqli_real_escape_string($db,$password);
// Selecting Database
//$db = mysql_select_db("breath", $connection);
// SQL query to fetch information of registerd users and finds user match.
$query = mysqli_query($db,"select * from user where user_password='$password' AND user_name='$username'");
//$result = mysqli_fetch_array($query,MYSQLI_ASSOC);
//$active = $row['active'];
$rows = mysqli_num_rows($query);
if ($rows == 1) {
$_SESSION['login_user']=$username; // Initializing Session
header("location: php/profile.php"); // Redirecting To Other Page
} else {
$error = "Username or Password is invalid";
}
mysqli_close($db); // Closing Connection
}
?>