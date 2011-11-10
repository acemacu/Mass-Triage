// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
   var toggleStatus = $.cookie("ToggleStatus");
   if (toggleStatus == "hidden")
       $("#collapsable").hide();
});

$(document).ready(function() {
   var formStatus = $.cookie("FormStatus");
   if (formStatus == "hidden")
       $("#patient_input").hide();
 });

$(function(){
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
            
            if (toggleStatus == "displayed" || toggleStatus == null)
                $.cookie("ToggleStatus", "hidden");
            else 
                $.cookie("ToggleStatus", "displayed");
  
});
         
         $('#min_patient_form').click( function() {
            var formStatus = $.cookie("FormStatus");
            $("#patient_input").toggle('slow');
            
            if (formStatus == "displayed" || formStatus == null)
                $.cookie("FormStatus", "hidden");
            else 
                $.cookie("FormStatus", "displayed");
  
});

 $('#extra_options_min').click( function() {
           
        $("#extra_options").toggle("slow");
     });
         
});