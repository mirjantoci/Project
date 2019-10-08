<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
<title>SPM</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: "Lato", sans-serif}
.mySlides {display: none}
</style>
<body>

	<jsp:include page="header.jsp"></jsp:include>

  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px" id="band">
    <h2 class="w3-wide">Verification of BPMN Process Models:</h2><br/>
    <h2 class="w3-wide">Sub-Processes</h2>
    <p class="w3-opacity"><i>BPMN</i></p>
    <p class="w3-justify"><h4 class="w3-justify">Business Process Management (BPM) is a challenging field that has witnessed great advances in the last few years. Since BPM is based on business process models, a great interest have been attributed to modelling languages and to models verification steps. Many modelling languages emerged; one of the most known languages is Business Process Modelling Notation (BPMN) which is considered as standard implementing the BPM approach. Its primary goal is to create a standardized bridge for the gap between process design and process implementation in order to entirely automate business process management lifecycle. In this context, business process models correction become required. In this paper, we propose an approach to evaluate business process models based on their whole structure as well as the analysis of the event logs resulting on a previous execution. The evaluated models are written in BPMN 2.0 notation and executed using Activiti Explorer online service. Experiments have been done on two different business processes to show verification results when applying our verification approach.
            <br /><br />The output of the verification here is based on the result of the verification of safeness, soundness, and message-disregarding soundness.
            <br /><br />The result message is a string structured as follows:
<br /><br />
[SOUNDNESS CODE]<br />
[--sequenceFlowID or --messageFlowID \n]*<br />
" && "
<br /><br />
[SAFENES CODE]<br />
[--sequenceFlowID or --messageFlowID \n]*<br />
<br /><br />
Where <br />
SOUNDNESS CODE can be:<br />
0 --> "Unsound for dead token"<br />
1 --> "Unsound for proper completion violation"<br />
2 --> "Message disregarding sound"<br />
3 --> "Sound"
<br /><br />
SAFENESS CODE can be:<br />
4 --> "Safe"<br />
5 --> "Unsafe"</h4></p>
  </div>



  <!-- The Contact Section -->
  <div class="w3-container w3-content w3-padding-64" style="max-width:800px" id="contact">
    <h2 class="w3-wide w3-center">CONTACT</h2>
    <p class="w3-opacity w3-center"><i>Do you have any problem? Send us an email!</i></p>
    <div class="w3-row w3-padding-32">
      <div class="w3-col m6 w3-large w3-margin-bottom">
        <i class="fa fa-map-marker" style="width:30px"></i> Camerino, Italy<br>
        <i class="fa fa-phone" style="width:30px"></i> Phone: +00 151515<br>
        <i class="fa fa-envelope" style="width:30px"> </i> Email: mirjantoci@gmail.com<br>
      </div>
      <div class="w3-col m6">
        <form action="contactEmail.jsp?" target="_blank">
          <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
            <div class="w3-half">
              <input class="w3-input w3-border" type="text" placeholder="Name" required name="Name">
            </div>
            <div class="w3-half">
              <input class="w3-input w3-border" type="text" placeholder="Email" required name="Email">
            </div>
          </div>
          <input class="w3-input w3-border" type="text" placeholder="Message" required name="Message">
          <button class="w3-button w3-black w3-section w3-right" type="submit">SEND</button>
        </form>
      </div>
    </div>
  </div>
  
<!-- End Page Content -->
</div>

<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge">
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
  <i class="fa fa-instagram w3-hover-opacity"></i>
  <i class="fa fa-snapchat w3-hover-opacity"></i>
  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
  <i class="fa fa-twitter w3-hover-opacity"></i>
  <i class="fa fa-linkedin w3-hover-opacity"></i>
  <p class="w3-medium">Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">UNICAM</a></p>
</footer>

<script>
// Automatic Slideshow - change image every 4 seconds
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 4000);    
}

// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}

// When the user clicks anywhere outside of the modal, close it
var modal = document.getElementById('ticketModal');
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

</body>
</html>
