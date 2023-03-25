<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>App - Info</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <link rel="icon" href="https://9e0d-134-220-251-92.eu.ngrok.io/images/soap_trap.jpeg" />
  </head>
  <body>
  <div class="col-lg-8 mx-auto p-3 py-md-5 main_frame">
  <header class="d-flex align-items-center pb-3 mb-5 border-bottom">
      <span class="fs-4">Info -</span> <span class="fs-4" id="date_time">- date time</span>
  </header>

  <main>
    <h1> <span id="cl_name">name</span></h1>
    <p class="fs-5 col-md-8"><span id="description"> Description.</span></p>

    <div class="mb-5">
      <a href="#" class="btn btn-primary btn-lg px-4">Completed</a>
    </div>
    <div class="col-md-6">
      <h2>To do</h2>
      <p>Task needed to be done</p>
      <ul class="icon-list">
        <li>clean</li>
        <li>care</li>
      </ul>
    </div>

    <hr class="col-3 col-md-2 mb-5">

    <div class="row g-5">


      <div class="col-md-6">
        <h2>Extra</h2>
        <p>Info or allergies etc.</p>
        <ul class="icon-list">
          <li>Bootstrap quick start guide</li>

        </ul>
      </div>
    </div>
  </main>

</div>
<script>
    fetch('get_job.php?id=129')
    .then(response => response.json())
    .then(response => {
    console.log(response);

    document.getElementById("cl_name").innerHTML = response.jobs[0]["name of client"];
    document.getElementById("description").innerHTML = response.w_description;
    document.getElementById("date_time").innerHTML = response.w_date_time; 
    document.getElementById("date_time").innerHTML = response.w_date_time; 
    }
  )
  .catch(err => {
    // Display errors in console
  console.log(err);
  });	

  </script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
  </body>
</html>