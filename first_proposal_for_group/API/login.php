<?php

/*
    *   This file is part of a group work from 5CS024/UM1: Collaborative Development (Wolverhampton City Campus), by:
    *   Petronela Lazar, Yousef Bin Madi, Stephen Worrall, Joshua Hipkiss, Daniele Pistilli, Swopnil Sapkota, Jorge Eduardo Dal Santo Caetano.
    *   Year - 2023
    *
    *
    *   This file is the first version of the login API
    *   It will check for existing user and then check its password and return a message with login details
    *   It is kept for older versions of the app to work
*/

// sensitive info (upload to github without this information)
$credentials = ["jd", "5231"];

// get POST data
$user = $_POST['user'];
$password = $_POST['password'];

// connect to db
$mysqli = new mysqli("localhost", $credentials[0], $credentials[1], "collab_ws_db");
if ($mysqli->connect_errno) {
    echo json_encode(array("user" => array('message' => "Failed to connect to MySQL: " . $mysqli->connect_error)));
    exit();
}

// get user specified by POST
$sql = "SELECT * FROM collab_ws WHERE Usernamew = '{$user}'";
$result = $mysqli->query($sql);

// check if user exists
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();

    // check if password matches by its hash
    if (password_verify($password, $row['Passwordw'])) {
        echo "Password is correct";

    } else {
        echo "Password is incorrect";
    }
} else {
    echo "User does not exist";
}