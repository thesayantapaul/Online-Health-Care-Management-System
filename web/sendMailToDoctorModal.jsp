<div class="modal-header">
    <h5 class="modal-title" id="exampleModalLongTitle">Contact:</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<div class="modal-body">
    <p style="color:blue;"><strong>Send a Mail to ${Doctor.doctorFirstName} ${Doctor.doctorLastName} ! <br> having mailId : ${Doctor.contactEmail}</strong></p>


    <label for="message-text" class="col-form-label">Message body:</label>
    <textarea rows="10" id="messageText"></textarea>

</div>
<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">close</button>

    <a href="#" onclick="sendDoctorAmail('${Doctor.doctorFirstName}', '${Doctor.doctorLastName}', '${Doctor.contactEmail}')" data-dismiss="modal" class="btn btn-success">send mail</a>
</div>
