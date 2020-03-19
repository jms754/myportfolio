window.addEventListener("load",init,false);
function init(){
    var logOut = document.getElementsByClassName("logout")[0];
    var logOut1 = document.getElementsByClassName("logout1")[0];
    logOut.addEventListener("click",function(){
        alert('로그아웃 되었습니다.');
    },false);
    logOut1.addEventListener("click",function(){
        alert('로그아웃 되었습니다.');
    },false);
}