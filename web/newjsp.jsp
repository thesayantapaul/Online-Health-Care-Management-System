<!DOCTYPE html>
<html>
  <head>
    <title>Title of the document</title>
    <style>
      label {
        font-family: 'Open Sans' sans-serif;
        color: #fff;
        margin: 0;
      }
      .container {
        display: block;
        border: 8px solid #414178;
        border-radius: 10px;
        margin: 0 auto;
        padding: 0 0 10px 10px;
        max-width: 330px;
        background-color: #ac9dd1;
      }
      .title {
        display: inline-block;
      }
      .title h2 {
        padding: 0 10px 0 0px;
        margin: 5px 0;
        color: #FBFBFB;
      }
      form {
        padding: 10px 10px 0 0;
      }
      hr {
        width: 100%;
        display: block;
        margin: 5px 0;
        height: 5px;
        border: 0;
        background-color: #ffffff;
      }
      input,
      textarea {
        width: 100%;
        border: 5px solid #FFFFFF;
        border-radius: 3px;
        resize: none;
        padding: 0 5px;
        box-sizing: border-box;
        font-family: 'Open Sans' sans-serif;
        font-size: 16px;
        color: #000000;
      }
      input[type="text"],
      input[type="email"] {
        padding: 0 1px;
        height: 40px;
        width: 100%;
      }
      input:focus,
      textarea:focus {
        outline: none;
      }
      .form-input {
        margin: 5px 0 10px 0;
      }
      .form-textarea {
        margin: 5px 0;
        width: 100%;
        height: 100px;
      }
      input[type="submit"] {
        width: 100%;
        height: 50px;
        background-color: #414178;
        border: 0;
        color: #fff;
        border: 5px solid #414178;
        border-radius: 8px;
        margin: 10px 0 0 0;
        font-family: 'Open Sans' sans-serif;
        font-size: 22px;
      }
    </style>
  </head>
  <body>
    <div class="wrapper">
      <div class="container">
        <div class="title">
          <h2>
            Contact Us
            <hr>
          </h2>
            <h4>
            Please drop a feedback
           
          </h4>
        </div>
        <form class="form" action="/form/submit" method="POST">
          <label for="name">Name</label>
          <input class="form-input" type="text" name="name" id="name">
          <label for="email">Email</label>
          <input class="form-input" type="email" name="email" id="email">
          <label for="email">Subject</label>
          <input class="form-input" type="email" name="email" id="subject">
          <label>Message</label>
          <textarea class="form-textarea" type="text"></textarea>
          <input type="submit" value="Submit">
        </form>
      </div>
    </div>
  </body>
</html>