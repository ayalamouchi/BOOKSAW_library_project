function loader(){
    document.querySelector('.preloader').classList.add("enter_pre");
}
function fadeout(){
    setInterval(loader,4000);
}
window.onload=fadeout();
window.addEventListener('scroll',function(){
    const header = document.querySelector('.navbar');
    header.classList.toggle('sticky',window.scrollY>20);
});
