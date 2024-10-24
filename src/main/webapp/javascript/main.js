function kiemTraMatKhau() {
    matKhau = document.getElementById("matKhau").value;
    matKhauNhapLai = document.getElementById("matKhauNhapLai").value;
    if (matKhau!=matKhauNhapLai){
        document.getElementById("msg").innerHTML = "mật khẩu không khớp!";
    }else {
        document.getElementById("msg").innerHTML = "";
    }


}
function xuLyChonDongY() {
    dongYDieuKhoan = document.getElementById("dongYDieuKhoan");
    if (dongYDieuKhoan.checked==true){
        document.getElementById("submit").style.visibility="visible";
    }else {
        document.getElementById("submit").style.visibility="hidden";
    }
}

function redirectToHome(){
    setTimeout(function () {
        window.location.href = "index.jsp";
    },3000);
}
