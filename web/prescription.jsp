<%-- 
    Document   : prescription
    Created on : 01-Mar-2023, 5:16:28 pm
    Author     : SAYANTA PAUL
--%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Doctor Prescription</title>
  <link rel="stylesheet" href="css-prescription/prescription.css" />
  
  <!-- <script src="https://kit.fontawesome.com/ee5fe365d2.js" crossorigin="anonymous"></script> -->
</head>

<body>


  <div class="container">


    <form id="prescription" class="contact" action="" method="post">
      <h2>Doctor's Prescription</h2>

      <div class="col50 colleft">
        <div class="col50 colleft">
          <div class="wd50">
            <label for="name">Patient Id:</label>
            <input type="text" id="name" required />
          </div>

          <div class="wd50">
            <label for="name">Patient Name:</label>
            <input type="text" id="name" required />
          </div>
        </div>

        <div class="col50 colright">
          <div class="wd50">
            <label for="name">Doctor Id:</label>
            <input type="text" id="name" required />
          </div>

          <div class="wd50">
            <label for="name">Doctor Name:</label>
            <input type="text" id="name" required />
          </div>
        </div>
      </div>


      <div class="col50 colright">
        <div class="col50 colleft">

          <div class="wd50">
            <label for="name">Appointment Id:</label>
            <input type="text" id="name" required />
          </div>

          <div class="wd50">
            <label for="name">Appointment Date:</label>
            <input type="text" id="name" required />
          </div>

        </div>
      </div>



      <div class="wd100">

      </div>

      <div class="col50 colleft">
        <div class="wd100">
          <label for="email"> Patient's Symptoms:</label>
          <!-- <input type="email" id="email" required /> -->
          <textarea id="address" required></textarea>

        </div>
      </div>


      <div class="col50 colright">
        <div class="form-group">
          <label for="email"> Required's Tests:</label>
          <!-- <input type="email" id="email" required /> -->
          <textarea id="address" required></textarea>

        </div>
      </div>

      <div class="col50 colleft">
        <div class="wd100">
          <label for="address">Doctor Advice:</label>
          <textarea id="address" required></textarea>
        </div>
      </div>

      <div class="wd100">

        <div class="wd33">
          <label for="medicine">Medicines Required:</label>
          <select id="medicine" required>
            <option value="" disabled selected>Select a medicine</option>
            <option value="Paracetamol">Paracetamol </option>
            <option value="Antacids ">Antacids</option>
            <option value="Ativan">Ativan</option>
          </select>
        </div>

        <div class="wd33">
          <label for="timing">Timings:</label>
          <!-- <input type="text" id="timing" min="1" required /> -->
          <select type="text" id="timing" min="1" required>
            <option value="" disabled selected>Select timings</option>
            <option value="1+1+1">1+1+1</option>
            <option value="1+0+1">1+0+1</option>
            <option value="0+1+1">1+1+1</option>
            <option value="1+0+0">1+1+1</option>
            <option value="0+0+1">1+1+1</option>
            <option value="1+1+1+1">1+1+1+1</option>
          </select>


        </div>

        <div class="wd33">
          <label for="timetotake">Time to Take:</label>
          <!-- <input type="text" id="timing" min="1" required /> -->
          <select type="text" id="timetotake" required>
            <option value="" disabled selected>Select time to take</option>
            <option value="Before Meal">Before Meal</option>
            <option value="After Meal">After Meal</option>
            <!-- <option value="0+1+1">1+1+1</option>
            <option value="1+0+0">1+1+1</option>
            <option value="0+0+1">1+1+1</option>
            <option value="1+1+1+1">1+1+1+1</option> -->
          </select>


        </div>
      </div>


      <button class="add" type="button" id="add-medicines">Add Medicine</button>
      <div class="buttons">

        <div id="medicines-container"></div>

      </div>
      <div class="wd100" class="submit"><button type="submit" id="submit-order">Issue Prescription</button></div>

    </form>
  </div>


  <script src="js/prescription.js"></script>

</body>

</html>