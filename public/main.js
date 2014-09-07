$(document).ready(function(){
  	$(".error").hide();

	$("#recipe_form").on("submit", function(e){
		var valid_form = true;

		var recipe_name = $("#recipe_name").val();
		var instructions = $("#instructions").val();
		var ingredient = $("#ingredient").val();

		if (recipe_name === ""){
			$("#recipe_name").next().show();
			valid_form = false;
		}

		if (instructions === ""){
			$("#instructions").next().show();
			valid_form = false;
		}

		if (ingredient === ""){
			$("#ingredient").next().show();
			valid_form = false;
		}

		if (valid_form === false){
			console.log("Invalid Form Submission");
			e.preventDefault();
		}
	});
});