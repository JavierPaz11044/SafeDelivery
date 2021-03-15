function anim(){
    const animLogo = document.getElementById('animLogo');
    const msmLogo = document.getElementById('msmLogo');
    const  btnAnime = document.getElementsByClassName('anima');
    animLogo.style.width ='100%';
    msmLogo.style.color ='#ce8644';
    for (let cont = 0; cont < btnAnime.length; cont++){
        btnAnime[cont].style.color ='white';
        btnAnime[cont].style.border ='2px white solid';
    }
}


window.onload = anim();