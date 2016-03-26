$(document).ready(function(){
	$("#new-tweet-form").on("submit", function(event){
		event.preventDefault();
    var $form = ($(event.target))

		$.ajax({
			type: "POST",
  		url: $(this).attr("action"),
  		data: $form.serialize()
		}).done(function(response){
			$("#tweets-container").prepend(response);
			$("#tweet_content").val("")
		})
	})
});
