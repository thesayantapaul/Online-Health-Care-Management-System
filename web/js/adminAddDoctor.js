
function sendMail() {
    var params = {
        from_name: "OHMS",
        firstName: document.getElementById("firstName").value,
        lastName: document.getElementById("lastName").value,
        emailAddress: document.getElementById("emailAddress").value,
        password: document.getElementById("password").value,
        contactEmail: document.getElementById("contactEmail").value
    };
    const serviceId = "service_f5fn1fi";
    const templateId = "template_49t7qgt";
    emailjs.send(serviceId, templateId, params)
            .then((res) => {
                console.log(res);
                alert("mail sent successfully");
            }
            )
            .catch((err) => console.log(err));
}