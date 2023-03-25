<?php
$User = $_POST['User'];
$password = password_hash($_POST['password'], PASSWORD_DEFAULT);

$mysqli = new mysqli("localhost", "jd", "5231", "collab_ws_db");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: " . $mysqli->connect_error;
    exit();
}



$sql = "SELECT * FROM collab_ws WHERE Usernamew = '{$User}'";
$result = $mysqli->query($sql);
// if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
//     if (password_verify($password, $row['Passwordw'])) {
//         echo "Password is correct";
//     } else {
//         echo "Password is incorrect";
//     }
// }



// check if User already exists
$sql = "SELECT * FROM collab_ws WHERE Usernamew = '{$User}'";
$result = $mysqli->query($sql);
if ($result->num_rows > 0) {
    echo "User already exists";
    echo $row['Passwordw'];
    exit();
}

// check for the highest ID in the table and add 1 to it
$sql = "SELECT MAX(ID) FROM collab_ws";
$result = $mysqli->query($sql);
$row = $result->fetch_row();
$id = $row[0] + 1;

$time = date("Y-m-d H:i:s");
// Build INSERT SQL statement
$sql_insert = "INSERT INTO collab_ws (ID, Usernamew, Passwordw, Birthdayw, Datew)
    VALUES($id, '{$User}', '{$password}', '1000-10-10', '{$time}')";


// Run SQL statement and report errors
if (!$mysqli->query($sql_insert)) {
    echo ("<h4>SQL error description: " . $mysqli->error . "</h4>");
}

echo "You have successfully registered!";