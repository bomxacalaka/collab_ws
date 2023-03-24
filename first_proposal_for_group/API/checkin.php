<?php

/*
    *   This file is part of a group work from 5CS024/UM1: Collaborative Development (Wolverhampton City Campus), by:
    *   Petronela Lazar, Yousef Bin Madi, Stephen Worrall, Joshua Hipkiss, Daniele Pistilli, Swopnil Sapkota, Jorge Eduardo Dal Santo Caetano.
    *   Year - 2023
    *
    *
    *   This file is the second version of the login API
    *   It will check for existing user and then check its password and return a message with login details
    *   It also has a register option that will add a new user to the database
    *   It also has a version check so that in the future if we change this response older versions of the app can still work on the same checkin.php file
*/

// For debugging purposes only (to see if the POST is working)
// $data = array(
//     'username' => "user: " . $_POST['user'] . "<br>",
//     'password' => "password: " . $_POST['password']. "<br>",
//     'message' => "version: " . $_POST['version'] . "<br>option: " . $_POST['option'],
// );
// $payload = json_encode(array("user" => $data));
// echo $payload;

// sensitive info (upload to github without this information)
$credentials = [<USERNAME>, <PASSWORD>];

// set version required and options available
$versionRequired = "0.0.0";
$versionAvailable = ["","0.0.0","0.0.1"];

$optionsAvailable = ["login","register"];


// get POST data
$version = $_POST['version'];
$user = $_POST['user'];
$password = $_POST['password'];
$option = $_POST['option'];


// connect to db
$mysqli = new mysqli("localhost", $credentials[0], $credentials[1], "collab_ws_db");
if ($mysqli->connect_errno) {
    echo json_encode(array("user" => array('message' => "Failed to connect to MySQL: " . $mysqli->connect_error)));
    exit();
}


// check for version (so that in the future if we change this response older versions of the app can still work on the same login.php file)
if ($user && $password && $version){
    // switch between versions
    switch ($version) {


        case "0.0.0":
            // switch between options
            switch ($option) {
                case "login":
                    include 'doLogin-0.0.0.php';
                    break;
                case "register":
                    include 'doRegister-0.0.0.php';
                    break;
                default:
                    echo json_encode(array(
                        "user" => array(
                            'message' => "Invalid option: " . $option . ". Options available: " . implode(", ", $optionsAvailable))));
                    break;
            }
            break;

            // new version of API (in case we need to change the response)
        case "0.0.1":
            switch ($option) {
                case "login":
                    include 'doLogin-0.0.1.php';
                    break;
                case "register":
                    include 'doRegister-0.0.1.php';
                    break;
                default:
                    echo json_encode(array(
                        "user" => array(
                            'message' => "Invalid option: " . $option . ". Options available: " . implode(", ", $optionsAvailable))));
                    break;
            }
            break;


        default:
            echo json_encode(array(
                "user" => array(
                    'message' => "Version mismatch: " . $version . ". Versions available: " . implode(", ", $versionAvailable))));
            break;
    }


} else {
    echo json_encode(array(
        "user" => array(
            'message' =>"Empty fields")));
}