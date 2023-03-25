<!-- 
  This file is part of a group work from 5CS024/UM1: Collaborative Development (Wolverhampton City Campus), by:
  Petronela Lazar, Yousef Bin Madi, Stephen Worrall, Joshua Hipkiss, Daniele Pistilli, Swopnil Sapkota, Jorge Eduardo Dal Santo Caetano.
  Year - 2023


  This file is used for testing checkin.php
  it will ease on the testing and developing of the API to login and register
  User and passwords are arbitrary but version and option must match to select the right function to run.
  At the moment the only version available is 0.0.0 which will return a default user, hashed password, and message as a json
  While no version results in only a string of message to return(that being the first ever version)
  Option determines wheather to parse those user and password details to a login function or register function
  Login function will check for existing user and then check its password and return a message with login details
  Register will check for existing user and add it to the database in case it's available and return a message with login details 
-->

<html>
  <!-- STYLING -->
<style>
input[type=text] {
  border: 1px solid #eee;
  border-radius: 10px;
  font-size: 16px;
  padding: 10px 0px 10px 10px;
  margin: 10px 0px 10px 0px;
  -webkit-transition: width 0.4s ease-in-out;
  transition: width 0.4s ease-in-out;
  width: 70%;
}

input[type=submit] {
  background-color: #ffaaaa;
  border: none;
  border-radius: 10px;
  color: white;
  cursor: pointer;
  font-size: 16px;
  padding: 10px 0px 10px 10px;
  margin: 10px 0px 10px 0px;
  -webkit-transition: width 0.4s ease-in-out;
  transition: width 0.4s ease-in-out;
  width: 70%;
}

.button {
  background-color: #ffaaaa;
  border: none;
  border-radius: 10px;
  color: white;
  cursor: pointer;
  font-size: 16px;
  padding: 10px 0px 10px 10px;
  margin: 10px 0px 10px 0px;
  -webkit-transition: width 0.4s ease-in-out;
  transition: width 0.4s ease-in-out;
  width: 70%;
}

input[type=title] {
  font-size: 20px;
  padding: 10px 0px 10px 10px;
  margin: 10px 0px 10px 0px;
  -webkit-transition: width 0.4s ease-in-out;
  transition: width 0.4s ease-in-out;
  width: 70%;
}

.center {
  text-align: center;
}

</style>
<body>


<!-- FORM FOR POST -->
<br>
<div class="center">
<form method="post" action="https://7d75-134-220-250-238.eu.ngrok.io/checkin.php">
  <div class="center" style="border-bottom:1px solid #eee;">
    <h2>POST TESTING</h2>
  </div><br>
  <input type="text" placeholder="User" name="user"><br>
  <input type="text" placeholder="Password" name="password"><br>
  <input type="text" placeholder="Version" name="version"><br>
  <input type="text" placeholder="Option" name="option"><br>
  <input type="submit">
</form>


  <!-- AUTO TESTING ZONE -->
<div class="center" style="border-bottom:1px solid #eee;">
    <h2 style="padding: 50px 0px 0px 0px">AUTO TESTING</h2>
  </div><br>

<button class="button" onclick="autoTest()">Auto Test</button>

<p id="outcome"></p>

<p id="register test">Register: </p>
<p id="login test">Login: </p>
<p id="version test">Version: </p>
<p id="option test">Option: </p>
</div>

<script>
// sorry for not documenting this, it's just a quick test to see if the API works
// it will ask the server different combinations of user, password, version and option
// and will display the json result in the html page
// yes I know I should have used a function but this isnt important

function autoTest() {


// check to see if the p is empty
if (document.getElementById("login test").innerHTML == document.getElementById("login test").textContent) {

  let successCount = 0;
  const dataRegister =
"user=test1&" +
"password=test1&" +
"version=0.0.0&" +
"option=register";

fetch("https://7d75-134-220-250-238.eu.ngrok.io/checkin.php", {
  method: "POST", // or 'PUT'
  headers: {'Content-Type':'application/x-www-form-urlencoded'}, // this line is important, if this content-type is not set it wont work
    body: dataRegister
})
  .then((response) => response.json())
  .then((data) => {
    console.log("Success:", data);
    document.getElementById("register test").innerHTML = 
    document.getElementById("register test").textContent + "<br>" + dataRegister + "<br>" + JSON.stringify(data) + "<br>";

  })
  .catch((error) => {
    console.error("Error:", error);
  });

  


  const dataLogin = 
"user=test1&" + 
"password=test1&" +
"version=0.0.0&" + 
"option=login";

fetch("https://7d75-134-220-250-238.eu.ngrok.io/checkin.php", {
  method: "POST", // or 'PUT'
  headers: {'Content-Type':'application/x-www-form-urlencoded'}, // this line is important, if this content-type is not set it wont work
    body: dataLogin
})
  .then((response) => response.json())
  .then((data) => {
    console.log("Success:", data);
    document.getElementById("login test").innerHTML = 
    document.getElementById("login test").textContent + "<br>" + dataLogin + "<br>" + JSON.stringify(data) + "<br>";
  })
  .catch((error) => {
    console.error("Error:", error);
  });



const dataVersion =
"user=test1&" +
"password=test1&" +
"version=0.0.kek&" +
"option=login";

fetch("https://7d75-134-220-250-238.eu.ngrok.io/checkin.php", {
  method: "POST", // or 'PUT'
  headers: {'Content-Type':'application/x-www-form-urlencoded'}, // this line is important, if this content-type is not set it wont work
    body: dataVersion
})
  .then((response) => response.json())
  .then((data) => {
    console.log("Success:", data);
    document.getElementById("version test").innerHTML = 
    document.getElementById("version test").textContent + "<br>" + dataVersion + "<br>" + JSON.stringify(data) + "<br>";
  })
  .catch((error) => {
    console.error("Error:", error);
  });


const dataOption =
"user=test1&" +
"password=test1&" +
"version=0.0.0&" +
"option=wrongOption";

fetch("https://7d75-134-220-250-238.eu.ngrok.io/checkin.php", {
  method: "POST", // or 'PUT'
  headers: {'Content-Type':'application/x-www-form-urlencoded'}, // this line is important, if this content-type is not set it wont work
    body: dataOption
})
  .then((response) => response.json())
  .then((data) => {
    console.log("Success:", data);
    document.getElementById("option test").innerHTML = 
    document.getElementById("option test").textContent + "<br>" + dataOption + "<br>" + JSON.stringify(data) + "<br>";
  })
  .catch((error) => {
    console.error("Error:", error);
  });
}

// if (successCount == 4) {
//   document.getElementById("outcome").innerHTML = "All tests passed";
// } else {
//   document.getElementById("outcome").innerHTML = successCount + "/4 tests passed";
// }
}
</script>
</body>
</html>
