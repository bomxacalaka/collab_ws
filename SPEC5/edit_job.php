<?php

$host = 'localhost';
$username = 'stephan';
$password = 'changeme69';
$dbname = 'SPEC5';

// Create connection = $conn
$conn = mysqli_connect($host, $username, $password, $dbname);

// Get all values sent from the javascript
$id = $_POST['id_'];
$nameElder = $_POST['elder_name'];
$job = $_POST['job_name'];
$date = $_POST['date_'];
$jobDescription = $_POST['job_description'];
$carerName = $_POST['carer_name'];
$address = $_POST['address_'];

// Sanitise data inputted
$nameElder = filter_var($nameElder, FILTER_SANITIZE_STRING);
$job = filter_var($job, FILTER_SANITIZE_STRING);
$date = filter_var($date, FILTER_SANITIZE_STRING);
$jobDescription = filter_var($jobDescription, FILTER_SANITIZE_STRING);
$carerName = filter_var($carerName, FILTER_SANITIZE_STRING);
$address = filter_var($address, FILTER_SANITIZE_STRING);

// Check for connection errors
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);

} else {
    // Construct the SQL query with the WHERE clause to filter by ID
    $sql = "UPDATE tablename SET ";
    if ($nameElder != null) {

        $sql .= "elder name = '" . $nameElder . "'";
    } elseif ($job != null) {
        $sql .= "job = '" . $job . "'";
    } elseif ($date != null) {
        $sql .= "date = '" . $date . "'";
    } elseif ($jobDescription != null) {
        $sql .= "jobDescription = '" . $jobDescription . "'";
    } elseif($carerName != null){
        $sql .= "carer name = '" . $carerName . "'"; 
    }elseif ($address != null) {
        $sql .= "address = '" . $address . "'";
    }

    $sql .= " WHERE id = " . $id;

    // Execute the query and get the result
    $result = $conn->query($sql);

    // Check for errors
    if (!$result) {
        die("Query failed: " . $conn->error);
    }else{
        echo("Sucessfully updated");
    }

    // Close the database connection
    $conn->close();
    $conn = null;
}
