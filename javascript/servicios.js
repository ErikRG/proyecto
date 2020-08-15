$(document).ready(function(){
	
	$('.servicios-img figure figcaption').fadeOut(1000);
	$('#v1').click(function(){
		$('#fc1').fadeToggle('swing');
                $('#fc2').fadeOut('swing');
                $('#fc3').fadeOut('swing');
                $('#fc4').fadeOut('swing');
                $('#fc5').fadeOut('swing');
                $('#fc6').fadeOut('swing');
	});

	$('#v2').click(function(){
		$('#fc2').fadeToggle('swing');
                $('#fc1').fadeOut('swing');
                $('#fc3').fadeOut('swing');
                $('#fc4').fadeOut('swing');
                $('#fc5').fadeOut('swing');
                $('#fc6').fadeOut('swing');
	});

	$('#v3').click(function(){
		$('#fc3').fadeToggle('swing');
                $('#fc1').fadeOut('swing');
                $('#fc2').fadeOut('swing');
                $('#fc4').fadeOut('swing');
                $('#fc5').fadeOut('swing');
                $('#fc6').fadeOut('swing');
	});

	$('#v4').click(function(){
		$('#fc4').fadeToggle('swing');
                $('#fc1').fadeOut('swing');
                $('#fc2').fadeOut('swing');
                $('#fc3').fadeOut('swing');
                $('#fc5').fadeOut('swing');
                $('#fc6').fadeOut('swing');
	});

	$('#v5').click(function(){
		$('#fc5').fadeToggle('swing');
                $('#fc1').fadeOut('swing');
                $('#fc2').fadeOut('swing');
                $('#fc3').fadeOut('swing');
                $('#fc4').fadeOut('swing');
                $('#fc6').fadeOut('swing');
	});

	$('#v6').click(function(){
		$('#fc6').fadeToggle('swing');
                $('#fc1').fadeOut('swing');
                $('#fc2').fadeOut('swing');
                $('#fc3').fadeOut('swing');
                $('#fc4').fadeOut('swing');
                $('#fc5').fadeOut('swing');
	});
});