//alert("chat iniciado");

$(function (){

    var message = $('#chat-message');
    var chat = $('#msg_history');

    message.focus();

    $('#message-box').submit(function (e){

        e.preventDefault();
        chat.append(message.val() + "<br/>");

    });

});



