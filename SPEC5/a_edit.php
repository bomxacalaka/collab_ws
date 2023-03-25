<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>App - add</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/styles.css" />

  </head>
  <body>
    <div class="col-lg-8 mx-auto p-3 py-md-5">
      <header class="d-flex align-items-center pb-3 mb-5 border-bottom">
        <span class="fs-4">App -</span> <span class="fs-4">- edit</span>
      </header>
      <main>

    <!-- form -->
    <form action="/action_page.php" class="form_add">
  <div class="form-group">
    <label for="date">Date:</label>
    <input type="datetime" class="form-control" id="date">
  </div>
  <div class="form-group">
    <label for="duration">Duration (minutes):</label>
    <input type="text" class="form-control" id="duration">
  </div>

  <div class="form-group">
    <label for="cl_name">Client name:</label>
    <input type="text" class="form-control" id="cl_name">
  </div>
  <div class="form-group">
    <label for="cl_address">Client address:</label>
    <input type="text" class="form-control" id="cl_address">
  </div>

  <div class="form-group">
    <label for="ca_name">Carer name:</label>
    <input type="text" class="form-control" id="ca_name">
  </div>

  <div class="form-group">
    <label for="description">Description:</label>
    <textarea class="form-control" aria-label="With textarea" id="description" ></textarea>
  </div>
  <div class="form-group">
    <label for="task_1">Task:</label>
    <input type="text" class="form-control" id="task_1">
  </div>
 

  <button type="submit" class="btn btn-primary">Submit</button>

</form>

  
  </main>
  </div>



  <script>
    window.addEventListener("load", () => {
  function sendData() {
    const XHR = new XMLHttpRequest();

    // Bind the FormData object and the form element
    const FD = new FormData(form);

    // Define what happens on successful data submission
    XHR.addEventListener("load", (event) => {
      alert(event.target.responseText);
    });

    // Define what happens in case of error
    XHR.addEventListener("error", (event) => {
      alert('Oops! Something went wrong.');
    });

    // Set up our request
    XHR.open("POST", "https://9e0d-134-220-251-92.eu.ngrok.io/get.php");

    // The data sent is what the user provided in the form
    XHR.send(FD);
  }

  // Get the form element
  const form = document.getElementById("form_add");

  // Add 'submit' event handler
  form.addEventListener("submit", (event) => {
    event.preventDefault();

    sendData();
  });
});

    </script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
 
  </body>
</html>
