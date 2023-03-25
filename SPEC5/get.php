<?php
// connect to database
$pdo = new PDO('mysql:host=0.tcp.eu.ngrok.io;dbname=collab_ws', 'stephan', 'changeme69');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// create user table if it doesn't exist
$pdo->exec('CREATE TABLE IF NOT EXISTS users (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    elder_name VARCHAR(50) NOT NULL,
    job VARCHAR(50) NOT NULL,
    date VARCHAR(50) NOT NULL,
    carer_name VARCHAR(50) NOT NULL,
    job_description VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL
)');

$elder_name = $_POST['elder_name'];
$job = $_POST['job'];
$date = $_POST['date'];
$carer_name = $_POST['carer_name'];
$job_description = $_POST['job_description'];
$address = $_POST['address'];

// Sanitise data inputted
$nameElder = filter_var($nameElder, FILTER_SANITIZE_STRING);
$job = filter_var($job, FILTER_SANITIZE_STRING);
$date = filter_var($date, FILTER_SANITIZE_STRING);
$jobDescription = filter_var($jobDescription, FILTER_SANITIZE_STRING);
$carerName = filter_var($carerName, FILTER_SANITIZE_STRING);
$address = filter_var($address, FILTER_SANITIZE_STRING);

$stmt = $pdo->prepare('INSERT INTO users (elder_name, job, date, carer_name, job_description, address) VALUES (?, ?, ?, ?, ?, ?)');
$stmt->execute([$elder_name, $job, $date, $carer_name, $job_description, $address]);
?>