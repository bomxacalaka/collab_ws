<?php

/*
    *   This file is part of a group work from 5CS024/UM1: Collaborative Development (Wolverhampton City Campus), by:
    *   Petronela Lazar, Yousef Bin Madi, Stephen Worrall, Joshua Hipkiss, Daniele Pistilli, Swopnil Sapkota, Jorge Eduardo Dal Santo Caetano.
    *   Year - 2023
    *
    *
    *   This file is the second version of the register API
    *   It will check for existing user and then register a new user

*/


// Hash the password before storing it in the database (for security reasons)
$password = password_hash($password, PASSWORD_DEFAULT);


$mysqli = new mysqli("localhost", "jd", "5231", "collab_ws_db");
if ($mysqli->connect_errno) {
    echo json_encode(array(
        "user" => array(
            'message' => "Failed to connect to MySQL: " . $mysqli->connect_error)));
    exit();
}


// check if User already exists
$sql = "SELECT * FROM collab_ws WHERE Usernamew = '{$user}'";
$result = $mysqli->query($sql);
if ($result->num_rows > 0) {
    echo json_encode(array(
        "user" => array(
            'message' => "User already exists")));
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
    VALUES($id, '{$user}', '{$password}', '1000-10-10', '{$time}')";


// Run SQL statement and report errors
if (!$mysqli->query($sql_insert)) {
    echo json_encode(array(
        "user" => array(
            'message' => "SQL error description: " . $mysqli->error)));
}


echo json_encode(array(
    "user" => array(
        'message' => "You have successfully registered!")));