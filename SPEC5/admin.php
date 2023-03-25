<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>App - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <link rel="icon" href="https://9e0d-134-220-251-92.eu.ngrok.io/images/soap_trap.jpeg" />
  </head>
  <body>
    <div class="col-lg-10 mx-auto p-3 py-md-5 main_frame">
      <header class="d-flex align-items-center pb-3 mb-5 main_frame border-bottom text-muted fw-bold fs-2"> 
        <span class="fs-4">Home --</span> <span class="fs-4"> 
          <a href="./a_add.html" class="btn btn-primary btn-sm px-4">Add new job</a> 
        </span> 
        </br> 
      </header>
      <main>

      </main>
    </div>


  <script>
//{"jobs":[{"id":"128","client name":"Adam Hughes","date":"2023-03-13 07:00:00","visit_duration":"30min","carer name":"Jane Smith","job description":"Personal Care - assist the client with a full body wash in bed, as she doesn't have lower body mobility\r\nNutrition and Fluids - meals and drinks preparation as the client is bed bound\r\nAdminister Medication - administer medication as per the discharge letter\r\n\r\nAdditional Information:\r\nKeysafe number: 1234\r\nEmergency Contact number: 0123 456 7890\r\n","tasks":"{\"tasks\": [{\"Personal Care\": 0}]}","address":"123 Holy Street\r\nWolverhampton\r\nWV14 2GN"},{"id":"129","client name":"Maria Logan","date":"2023-02-13 07:45:00","visit_duration":"1hour","carer name":"Jane Smith","job description":"Personal Care - assist the client with a full body wash in bed, as she doesn't have lower body mobility\r\nNutrition and Fluids - meals and drinks preparation as the client is bed bound\r\nAdminister Medication - administer medication as per the discharge letter\r\n\r\nAdditional Information:\r\nKeysafe number: 1234\r\nEmergency Contact number: 0123 456 7890","tasks":"null","address":"124 Holy Street\r\nWolverhampton\r\nWV14 2GN"},{"id":"130","client name":"Karen Adam","date":"2023-02-13 07:00:00","visit_duration":"30min","carer name":"Marie Antoinette","job description":"Personal Care - assist the client with a full body wash in bed, as she doesn't have lower body mobility\r\nNutrition and Fluids - meals and drinks preparation as the client is bed bound\r\nAdminister Medication - administer medication as per the discharge letter\r\n\r\nAdditional Information:\r\nKeysafe number: 1234\r\nEmergency Contact number: 0123 456 7890","tasks":"null","address":"130 Holy Street\r\nWolverhampton\r\nWV14 2GN"},{"id":"131","client name":"Adam Hughes","date":"2023-02-13 13:00:00","visit_duration":"30min","carer name":"Marie Antoinette","job description":"Personal Care - assist the client with a full body wash in bed, as she doesn't have lower body mobility\r\nNutrition and Fluids - meals and drinks preparation as the client is bed bound\r\nAdminister Medication - administer medication as per the discharge letter\r\n\r\nAdditional Information:\r\nKeysafe number: 1234\r\nEmergency Contact number: 0123 456 7890\r\n","tasks":"null","address":"123 Holy Street\r\nWolverhampton\r\nWV14 2GN"},{"id":"132","client name":"fasfdasgregqw","date":"2023-02-13 00:00:00","visit_duration":"","carer name":"fdsafdas","job description":"idkman","tasks":"null","address":"omsehwre"},{"id":"133","client name":"fasfdasgregqw","date":"2023-02-13 00:00:00","visit_duration":"","carer name":"fdsafdas","job description":"idkman","tasks":"null","address":"omsehwre"},{"id":"134","client name":"","date":"2023-03-16 00:00:00","visit_duration":"","carer name":"","job description":"","tasks":"null","address":""},{"id":"135","client name":"","date":"2023-03-16 00:00:00","visit_duration":"","carer name":"","job description":"","tasks":"null","address":""},{"id":"136","client name":"","date":"2023-03-16 00:00:00","visit_duration":"","carer name":"","job description":"","tasks":"null","address":""},{"id":"137","client name":"","date":"2023-03-16 00:00:00","visit_duration":"","carer name":"","job description":"","tasks":"null","address":""}]}
  fetch( "https://9e0d-134-220-251-92.eu.ngrok.io/get_jobs.php" ).then((response) => response.json()).then((response) => {
  console.log(response);

  for (let i = 0; i < response.jobs.length; i++) {

    const job_card = document.createElement("div");
    job_card.className = "card m-1";

    const job_header = document.createElement("div");
    job_header.className = "card-header";
    job_card.appendChild(job_header);

    const job_time = document.createElement("span");
    job_time.className = "date_time";
    job_header.appendChild(job_time);
    const dateTime = document.createTextNode(response.jobs[i]["date"] + " " + response.jobs[i]["carer name"]);
    job_time.appendChild(dateTime);

    const job_body = document.createElement("div");
    job_body.className = "card-body";
    job_card.appendChild(job_body);

    const job_title = document.createElement("h5");
    job_title.className = "card-title";
    job_body.appendChild(job_title);

    const job_client = document.createElement("span");
    job_client.className = "cl_name";
    job_title.appendChild(job_client);
    const clientName = document.createTextNode(response.jobs[i]["client name"]);
    job_client.appendChild(clientName);

    // add new line
    const br = document.createElement("br");
    job_title.appendChild(br);

    const job_duration = document.createElement("span");
    job_duration.className = "duration";
    job_title.appendChild(job_duration);
    const duration = document.createTextNode(response.jobs[i]["visit_duration"]);
    job_duration.appendChild(duration);

    // for each new line in address add a new line
    for (let j = 0; j < response.jobs[i]["address"].split("\n").length; j++) {
      const job_address = document.createElement("p");
      job_address.className = "card-text";
      job_body.appendChild(job_address);
      const address = document.createTextNode(response.jobs[i]["address"].split("\n")[j]);
      job_address.appendChild(address);
    }

    const button = document.createElement("a");
    button.className = "btn btn-primary";
    button.href = "detail.html?id=" + response.jobs[i]["id"];
    const infoBtn = document.createTextNode("Info");
    button.appendChild(infoBtn);
    job_body.appendChild(button);

    let main = document.querySelector("main");
    main.appendChild(job_card);

    // add new line
    const br2 = document.createElement("br");
    main.appendChild(br2);
    
  }
  }).catch((err) => {
      // Display errors in console
      console.log(err);
  });

  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

  </body>
</html>

