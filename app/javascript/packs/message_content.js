const messages = document.querySelectorAll('.message-item-content');

messages.forEach(function(message){
  if(message.innerText == "") {
    message.classList.add('hidden');
  }
  
});


