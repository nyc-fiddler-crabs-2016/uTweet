$(document).ready(function(){
	$(".new_tweet").on("submit", function(event){
		event.preventDefault();

		$.ajax({
			type: "POST",
  		url: $(this).attr("action"),
  		data: $(this).serialize()
		}).done(function(response){
			$(".tweets-container").prepend(response);
			$(".new_tweet")[0].reset()
		})
	})
});