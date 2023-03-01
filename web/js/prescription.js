/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// DOM Elements
const prescriptionForm = document.getElementById("prescription");
const addMedicineBtn = document.getElementById("add-medicines");
const medicinesContainer = document.getElementById("medicines-container");

// Medicine counter
let medicineCount = 0;

// Add medicine to container
const addMedicine = (medicine, timing, timetotake) => {
  // Create medicine element
  const medicineEl = document.createElement("div");
  medicineEl.classList.add("medicine");

  // Add medicine name
  const medicineNameEl = document.createElement("div");
  medicineNameEl.classList.add("medicine-name");
  medicineNameEl.innerText = medicine;
  medicineEl.appendChild(medicineNameEl);

  // Add medicine timing
  const timingEl = document.createElement("div");
  timingEl.innerText = `Timings: ${timing}`;
  medicineEl.appendChild(timingEl);

 // Add medicine time to take
 const timetotakeEl = document.createElement("div");
 timetotakeEl.innerText = `TimeToTake: ${timetotake}`;
 medicineEl.appendChild(timetotakeEl);



  // Add remove button
  const removeBtnEl = document.createElement("button");
  removeBtnEl.classList.add("remove-medicine");
  removeBtnEl.innerText = "X";
  removeBtnEl.addEventListener("click", () => {
    medicineEl.remove();
  });
  medicineEl.appendChild(removeBtnEl);

  // Add medicine to container
  medicinesContainer.appendChild(medicineEl);
};

// Handle add medicine button click
addMedicineBtn.addEventListener("click", () => {
  const medicineSelect = document.getElementById("medicine");
  const medicine = medicineSelect.options[medicineSelect.selectedIndex].text;
  const timing = document.getElementById("timing").value;
  const timetotake = document.getElementById("timetotake").value;

  addMedicine(medicine, timing, timetotake);
  medicineCount++;
});

// Handle form submit
prescriptionForm.addEventListener("submit", (e) => {
  e.preventDefault();

  // Get medicines
  const medicines = [];
  const medicineEls = document.querySelectorAll(".medicine");
  medicineEls.forEach((medicineEl) => {
    const medicineName = medicineEl.querySelector(".medicine-name").innerText;
    const timing = medicineEl
    const timetotake = medicineEl
      .querySelector("div:nth-child(2)")
      .innerText.replace("Timings: ", "TimeToTake", "");
    medicines.push({ name: medicineName, timing: timing, timetotake: timetotake });
  });

  // Reset form
  prescriptionForm.reset();
  medicinesContainer.innerHTML = "";
  medicineCount = 0;
});