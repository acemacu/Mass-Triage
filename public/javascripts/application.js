// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
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
	
});
