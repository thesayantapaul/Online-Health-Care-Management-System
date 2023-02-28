<html>
<head>
<title>
Welcome To My Domain
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src='https://www.google.com/reCAPTCHA/api.js' async defer></script>
</title>
</head>
<body>
<form action="?" method="POST">
<div class="form-group">
 <div class="g-recaptcha" data-sitekey="6LcQjK0kAAAAALMogTAZqQcjHJftku7jwQSL4jIV"></div>
</div>
<div class="form-group">
<div class="checkbox">
<label><input type="checkbox" id="check_rules" name="check_rules" required />
Please check the box
</label>
</div>
</div>
<div class="form-group">
<input type="submit" id="submit" name="submit" value="submit" class="btn-btn-success"/>
</div>
</form>
</body>
</html>
<script>
$(document).on('click','#submit,function()
{
var response =  greCAPTCHA.getResponse();
alert(response);
});
</script>
