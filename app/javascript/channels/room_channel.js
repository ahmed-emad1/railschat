import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
  	console.log('inside room....')
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
  	$('#msg').append('<div>'+ data.user.username+' @ ' + data.user.created_at +'</div><div>' + data.content+ '</div>')
  	console.log(data)
    // Called when there's incoming data on the websocket for this channel
  }
});

var submit_messages;

$(document).on('turbolinks:load', function(){
	submit_messages()
})

submit_messages = function(){

	$('#message_content').on('keydown',function(event){
		if(event.keyCode === 13){
			$('input').click()
			event.target.value = ''
			event.preventDefault() 
		}
	})
}