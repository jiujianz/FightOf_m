$(function() {
	function buildMessageHTML(message){
        var api_image = (message.image) ? `<img src="${message.image}" >` :``;
        var api_video = (message.video) ? `<video src="${message.video}" >` :``;
		var html = `
                <div class= "message col-xs-12" data-id=${message.id}>
                  <div class= "upper-message">
                    <div class="upper-message__user-name">${message.user_name}
                    </div>
                    <div class= "upper-message__date">${message.time}
                    </div>
                  </div>
                  <div class= "lower-message">
                    <p class= "lower-message__content">${message.content}
                    </p>
                    <p class= "lower-message__image">${api_image}
                    </p>
                    <p class= "lower-message__image">${api_video}
                    </p>
                  </div>
                </div>`
      return html
	}
  $(function(){
    setInterval(UpdateMessageDisplay, 5000);
  });
  function UpdateMessageDisplay(){
    if($('.message')[0]){
      var message_id = $('.message').last().data('id');
      console.log(message_id)
    } else {
      var message_id = 0
    }
    $.ajax({
      url: location.href,
      type: "GET",
      data: { id: message_id },
      dataType: 'json',
    })
    .done(function(new_message){
      $.each(new_message, function(i,new_message){
        var html = buildMessageHTML(new_message);
        $('.messages').append(html)
      });
    });
  }

	$('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    if ($('#message_content').val() !== ""){
      var href = window.location
      $.ajax({
        url: href,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(userSend_message){
        var html = buildMessageHTML(userSend_message);
        $('.messages').append(html)
        $('#message_content').val('')
        $('.messages').animate({scrollTop: $('.messages').scrollTop}, 'fast');
      })
      .fail(function(){
        alert('error');
      })
      .always(() => {
        $(".chat__submit").removeAttr("disabled");
      });
    } 
  });
})