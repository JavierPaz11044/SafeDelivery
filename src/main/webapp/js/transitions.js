var divMessage = document.getElementsByClassName('container-message');
function animtedDiv(){
    console.log(divMessage);
    divMessage[0].style.color='rgba(255,255,255,1)';
    divMessage[0].style.background='rgba(255,255,255,0.1)';

}
window.onload = animtedDiv();