<?php
ob_start();
session_start();
require_once 'dbconnect.php';

// if session is not set this will redirect to login page
if( !isset($_SESSION['user']) ) {
 header("Location: index.php");
 exit;
}
// select logged-in users detail
$res=mysqli_query($conn, "SELECT * FROM users WHERE userId=".$_SESSION['user']);
$userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);


$sql = "SELECT * FROM tbl_books INNER JOIN tbl_author ON tbl_books.fk_publisher_id = tbl_author.author_id INNER JOIN tbl_publisher ON tbl_books.fk_publisher_id = tbl_publisher.publisher_id";
$result = $conn->query($sql);

?>


<!DOCTYPE html>
<html>
<head>
<title>Welcome - <?php echo $userRow['userEmail']; ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

	 <div class="container-fluid">
		<img alt="Brsdsand" src="images\lib.png" height="50px" width="50px"> 
		<a  href="logout.php?logout">Sign Out
	       			 <b>  <?php echo  $userRow['username']; ?> </b>
	    			 </a>
     </div>
     <div class="container-login100">
     	 <?php
        while($row = $result->fetch_assoc()) {
            echo
            "<div class='col-md-4' >" . 
            "<div class='thumbnail' >" .            
            " <br> <img src='" . $row["img"] . "' style='width: 70%'".
            "<div class='caption' >" . 

           
            " <b>Title:</b> " . $row["title"].
            " <b>Description:</b> " . $row["description"].
            " <b>ISBN:</b> " . $row["ISBN"].
            " <b>Publication Date:</b> " . $row["publish_date"].            
            " <b>Author:</b> " . $row["first_name"] . " " . $row["last_name"].
            " <b>Publisher</b> " . $row["name"]  .
            "</div>".
            "</div>".
            "</div>";
            }
            $conn->close();
        ?>
     	
     </div>

 




</body>
</html>
<?php ob_end_flush(); ?>