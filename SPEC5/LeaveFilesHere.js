const mysql = require('mysql');

// Create a MySQL connection
const connection = mysql.createConnection({
    host: '0.tcp.eu.ngrok.io',
    user: 'stephan',
    password: 'changeme69',
    database: 'Person'
});

// Function to update the database
function updateDatabase(id, elderName, job, date, carerName, jobDescription, address) {
    // Build the SQL query
    const query = `UPDATE your_table SET elder_name = '${elderName}', job = '${job}', date = '${date}', carer_name = '${carerName}', job_description = '${jobDescription}', address = '${address}' WHERE id = ${id}`;

    // Execute the query
    connection.query(query, function (error, results, fields) {
    if (error) {
        throw error;
    }
    console.log('Record updated successfully!');
    });
}

// Call the function to update the database
updateDatabase(1, 'John Smith', 'Engineer', '2022-03-07', 'Jane Doe', 'Caregiver', '123 Main St');
