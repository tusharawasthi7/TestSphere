function showPopup(message) {
    console.log("Popup message: " + message); // Debugging line
    var modal = document.getElementById("myModal");
    var modalMessage = document.getElementById("modalMessage");
    modalMessage.innerText = message;
    modal.style.display = "block";
}

window.onload = function() {
    console.log("Window loaded"); // Debugging line
    var messageContainer = document.getElementById("popupMessageContainer");
    var message = messageContainer.getAttribute("data-message");
    console.log("Loaded message: " + message); // Debugging line
    if (message && message.trim().length > 0) {
        showPopup(message);
    }
};

var modal = document.getElementById("myModal");
var okButton = document.getElementById("okButton");

okButton.onclick = function() {
    modal.style.display = "none";
}

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}