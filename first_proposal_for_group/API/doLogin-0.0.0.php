<?php

/*
    *   This file is part of a group work from 5CS024/UM1: Collaborative Development (Wolverhampton City Campus), by:
    *   Petronela Lazar, Yousef Bin Madi, Stephen Worrall, Joshua Hipkiss, Daniele Pistilli, Swopnil Sapkota, Jorge Eduardo Dal Santo Caetano.
    *   Year - 2023
    *
    *
    *   This file is the second version of the login API
    *   It will check for existing user and then check its password and return a message with login details

*/

// get user specified by POST
$sql = "SELECT * FROM collab_ws WHERE Usernamew = '{$user}'";
$result = $mysqli->query($sql);

// check if user exists
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();

    // check if password matches by its hash
    if (password_verify($password, $row['Passwordw'])) {
        $data = array(
            'username' => $row['Usernamew'],
            'password' => $row['Passwordw'],
            'message' => 'Login successful'
        );
        $payload = json_encode(array("user" => $data));
        echo $payload;

    } else {
        echo json_encode(array(
            "user" => array(
                'message' => "Password is incorrect")));
        exit();
    }
} else {
    echo json_encode(array(
        "user" => array(
            'message' =>"User does not exist")));
    exit();
}
