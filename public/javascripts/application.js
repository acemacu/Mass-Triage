/* 
For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
Developed by: Carnegie Mellon University - Team Triage
Copyright:    Field Applications
*/

// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
  if ($("#incident_info").length > 0) {
    setTimeout(updatePatients, 5000);
  }
});

function updatePatients () {
  var incident_id = $("#incident_info").attr("data-id");
  var authenticity_token = $("#form_token").attr("data-id");
  var time = new Date().getTime() - 10000;
  $.getScript("/patients/other.js?incident_id=" + incident_id + "&after=" + time.toString()+"&authenticity_token=" + authenticity_token);
  setTimeout(updatePatients, 10000);
}

$(document).ready(function() {
   var toggleStatus = $.cookie("ToggleStatus");
   var formStatus = $.cookie("FormStatus");
   $("#tooltip").hide();
   $("#tableForPatients").tablesorter({
        headers: {
            // assign the secound column (we start counting zero) 
            9: { 
                // disable it by setting the property sorter to false 
		sorter: false 
            }}}); 
   
   $("#mciTable").tablesorter({
        headers: { 
            // assign the secound column (we start counting zero) 
            5: { 
                 // disable it by setting the property sorter to false 
                  sorter: false 
             }}}); 
      
   if (toggleStatus == "hidden")
       $("#collapsable").hide();
   if (formStatus == "hidden")
       $("#patient_input").hide();
   window.setTimeout(resize, 1);
});


function resize () {
    $('.scrollable2').height(function(index, height) {
                return window.innerHeight - $(this).offset().top;
            });
            
    $('.scrollable3').height(function(index, height) {
                return window.innerHeight - $(this).offset().top;
            });
};

$(document).ready(function() { 
    

    
    $("#extra_options").hide();
    
	$(".minus5Patient").click(function(){
		var currentVal = $('#fieldPatient').val();
		currentVal = parseInt(currentVal);
		$("#fieldPatient").val(currentVal - 5);
	});
	$(".minus1Patient").click(function(){
		var currentVal = $('#fieldPatient').val();
		currentVal = parseInt(currentVal);
		$("#fieldPatient").val(currentVal - 1);
	});
	$(".plus5Patient").click(function(){
		var currentVal = $('#fieldPatient').val();
		currentVal = parseInt(currentVal);
		$("#fieldPatient").val(currentVal + 5);
	});
	$(".plus1Patient").click(function(){
		var currentVal = $('#fieldPatient').val();
		currentVal = parseInt(currentVal);
		$("#fieldPatient").val(currentVal + 1);
	});
	//Ambulance count javascript
	$(".minus5Ambulance").click(function(){
		var currentVal = $('#fieldAmbulance').val();
		currentVal = parseInt(currentVal);
		$("#fieldAmbulance").val(currentVal - 5);
	});
	$(".minus1Ambulance").click(function(){
		var currentVal = $('#fieldAmbulance').val();
		currentVal = parseInt(currentVal);
		$("#fieldAmbulance").val(currentVal - 1);
	});
	$(".plus5Ambulance").click(function(){
		var currentVal = $('#fieldAmbulance').val();
		currentVal = parseInt(currentVal);
		$("#fieldAmbulance").val(currentVal + 5);
	});
	$(".plus1Ambulance").click(function(){
		var currentVal = $('#fieldAmbulance').val();
		currentVal = parseInt(currentVal);
		$("#fieldAmbulance").val(currentVal + 1);
	});
        
        $('#min').click( function() {
            var toggleStatus = $.cookie("ToggleStatus");
            $("#collapsable").toggle('slow');
            
            window.setTimeout(resize, 650);
                
            if (toggleStatus == "displayed" || toggleStatus == null)
                $.cookie("ToggleStatus", "hidden");
            else 
                $.cookie("ToggleStatus", "displayed");      
  
        });

                
        $('#tt').click( function() {
            $("#tooltip").toggle('slow');
        });
                
        $('#min_patient_form').click( function() {
            var formStatus = $.cookie("FormStatus");
            $("#patient_input").toggle('slow');
            
            window.setTimeout(resize, 650);
                        
            if (formStatus == "displayed" || formStatus == null)
                $.cookie("FormStatus", "hidden");
            else 
                $.cookie("FormStatus", "displayed");
        });
        
        $('#extra_options_min').click( function() {
            $("#extra_options").toggle("slow");
        });
         
        $(window).resize(function () { 
            $('.scrollable2').height(function(index, height) {
                return window.innerHeight - $(this).offset().top;
            });
            $('.scrollable3').height(function(index, height) {
                return window.innerHeight - $(this).offset().top;
            });
        });
         
         
});
