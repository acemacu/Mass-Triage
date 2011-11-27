// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
  //if ($("#incident").length > 0) {
    setTimeout(updatePatients, 10000);
  //}
});

function updatePatients () {
  var incident_id = $("#incident_info").attr("data-id");
  var time = new Date().getTime() - 15000;
  $.getScript("/patients/other.js?incident_id=" + incident_id + "&after=" + time.toString());
  setTimeout(updatePatients, 15000);
}

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

$(document).ready(function() { 
        $("#tableForPatients").tablesorter({
				headers: { 
		            // assign the secound column (we start counting zero) 
		            9: { 
		                // disable it by setting the property sorter to false 
		                sorter: false 
		            }
		        }
				}); 
    } 
);

$(document).ready(function() { 
        $("#mciTable").tablesorter({
				headers: { 
		            // assign the secound column (we start counting zero) 
		            5: { 
		                // disable it by setting the property sorter to false 
		                sorter: false 
		            }
		        }
				}); 
    } 
);


$(function(){
    
$('.scrollable2').height(function(index, height) {
  return window.innerHeight - $(this).offset().top;
});

$('.scrollable3').height(function(index, height) {
  return window.innerHeight - $(this).offset().top;
});
    
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
            $("#collapsable").toggle();
            $('.scrollable2').height(function(index, height) {
                return window.innerHeight - $(this).offset().top;
            });
            $('.scrollable3').height(function(index, height) {
                return window.innerHeight - $(this).offset().top;
            });
            if (toggleStatus == "displayed" || toggleStatus == null)
                $.cookie("ToggleStatus", "hidden");
            else 
                $.cookie("ToggleStatus", "displayed");      
  
        });

                
         $('#min_patient_form').click( function() {
            var formStatus = $.cookie("FormStatus");
            $("#patient_input").toggle();
            $('.scrollable2').height(function(index, height) {
                return window.innerHeight - $(this).offset().top;
            });
            
            if (formStatus == "displayed" || formStatus == null)
                $.cookie("FormStatus", "hidden");
            else 
                $.cookie("FormStatus", "displayed");
  
  
  
});
        $('#min_patient_form').click( function() {
            
});

 $('#extra_options_min').click( function() {
           
        $("#extra_options").toggle("slow");
     });
         
});
