<%-- 
    Document   : index
    Created on : Jan 18, 2021, 8:09:13 PM
    Author     : 1999k
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            body {
                font-family: Arial;
                color: white;
            }

            .split {
                height: 100%;
                width: 50%;
                position: fixed;
                z-index: 1;
                top: 0;
                overflow-x: hidden;
                padding-top: 20px;
            }

            .left {
                left: 0;
                background-color: #ffffff;
            }

            .right {
                right: 0;
                background-color: #0099ff;
            }

            .centered {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                text-align: center;
            }

            .centered img {
                width: 150px;
                border-radius: 50%;
            }

            .fntleft {
                color: #333333;
                font-size: 25px;
            }
            .fntright {
                color: #ffffff;
                font-size: 25px;
            }

            body {font-family: Arial, Helvetica, sans-serif;}
            form {border: 3px solid #f1f1f1;}

            input[type=text], input[type=password] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            button {
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
            }

            button:hover {
                opacity: 0.8;
            }

            .cancelbtn {
                width: auto;
                padding: 10px 18px;
                background-color: #f44336;
            }

            .imgcontainer {
                text-align: center;
                margin: 24px 0 12px 0;
            }

            img.avatar {
                width: 40%;
                border-radius: 50%;
            }

            .container {
                padding: 16px;
            }

            span.psw {
                float: right;
                padding-top: 16px;
            }
            @media screen and (max-width: 300px) {
                span.psw {
                    display: block;
                    float: none;
                }
                .cancelbtn {
                    width: 100%;
                }
            }
        </style>

        <script>

            function checkLogin() {

                var Username = document.getElementById('lodUname').value;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var responstext = this.responseText;

                        if (responstext == "Success") {

                            document.getElementById('uVer').style.display = "none";
                            document.getElementById('uVer').innerHTML = "Success";


                        } else {
                            document.getElementById('uVer').style.display = "inline";
                            document.getElementById('uVer').innerHTML = "You are already active or not a registered User!";
                        }

                    }
                };
                xhttp.open("POST", "checkLogIn", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("username=" + Username);

            }


            function loginUser() {

                var Username = document.getElementById('lodUname').value;
                var Password = document.getElementById('logPwd').value;
                var verification = document.getElementById('uVer').innerText;



                if (verification == "Success") {
                    if (Username.length != 0) {
                        if (Password.length != 0) {

                            var xhttp = new XMLHttpRequest();
                            xhttp.onreadystatechange = function () {
                                if (this.readyState == 4 && this.status == 200) {
                                    var responstext = this.responseText;

                                    if (responstext == "Success") {


                                        document.getElementById('lodUname').value = "";
                                        document.getElementById('logPwd').value = "";
                                        window.location.replace("chat.jsp");


                                    } else {
                                        document.getElementById('lodUname').value = "";
                                        document.getElementById('logPwd').value = "";
                                        alert("You cannot Sign Up,Please try again!");

                                    }

                                }
                            };
                            xhttp.open("POST", "loginuserServlet", true);
                            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                            xhttp.send("username=" + Username + "&password=" + Password);

                        } else {
                            document.getElementById('btntext1').style.display = "inline";
                        }
                    } else {
                        document.getElementById('btntext1').style.display = "inline";
                    }
                } else {
                    document.getElementById('btntext1').style.display = "inline";
                    document.getElementById('btntext1').innerHTML = "You are already active or not a registered User!";
                }
            }

            function checkEmailValidation() {
                var email = document.getElementById("email").value;
                var pattern = /^[^ ]+@[^ ]+\.[a-z]{2,5}$/;

                if (email.match(pattern)) {
                    document.getElementById('emaiText').style.display = "none";
                } else {
                    document.getElementById('emaiText').style.display = "inline";
                    document.getElementById("emaiText").innerHTML = "Invalid Format";
                }
            }


            function checkEmailExsistsTest() {

                var text = document.getElementById('email').value;

                var xhttp = new XMLHttpRequest();

                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                        var response = this.responseText;
                        console.log(this.responseText);
                        if (response == "Already Exsists!") {
                            document.getElementById('emaiText').style.display = "inline";
                            document.getElementById('emaiText').innerHTML = response;
                        } else {
                            document.getElementById('emaiText').style.display = "none";
                        }

                    }

                }

                xhttp.open("POST", "checkEmail", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("email=" + text);

            }


            function checkUserNameExsistsTest() {

                var text = document.getElementById('uname').value;

                var xhttp = new XMLHttpRequest();

                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                        var response = this.responseText;
                        console.log(this.responseText);
                        if (response == "Already Exsists!") {
                            document.getElementById('unameText').style.display = "inline";
                            document.getElementById('unameText').innerHTML = response;
                        } else {
                            document.getElementById('unameText').style.display = "none";
                        }

                    }

                }

                xhttp.open("POST", "checkUser", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("username=" + text);

            }

            function saveUsers() {
                var fname = document.getElementById('fname').value;
                var email = document.getElementById('email').value;
                var username = document.getElementById('uname').value;
                var password = document.getElementById('pwd').value;

                if (fname.length != 0) {
                    if (email.length != 0) {
                        if (username.length != 0) {
                            if (password.length != 0) {

                                var xhttp = new XMLHttpRequest();
                                xhttp.onreadystatechange = function () {
                                    if (this.readyState == 4 && this.status == 200) {
                                        var responstext = this.responseText;

                                        if (responstext == "Success") {

                                            document.getElementById('fname').value = "";
                                            document.getElementById('email').value = "";
                                            document.getElementById('uname').value = "";
                                            document.getElementById('pwd').value = "";
                                            window.location.replace("index.jsp");

                                        } else {
                                            document.getElementById('fname').value = "";
                                            document.getElementById('email').value = "";
                                            document.getElementById('uname').value = "";
                                            document.getElementById('pwd').value = "";
                                            alert("You cannot Sign Up,Please try again!");

                                        }

                                    }
                                };
                                xhttp.open("POST", "saveUsers", true);
                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                xhttp.send("fname=" + fname + "&email=" + email + "&username=" + username + "&password=" + password);

                            } else {
                                document.getElementById('btntext').style.display = "inline";
                            }
                        } else {
                            document.getElementById('btntext').style.display = "inline";
                        }
                    } else {
                        document.getElementById('btntext').style.display = "inline";
                    }
                } else {
                    document.getElementById('btntext').style.display = "inline";
                }


            }

            function logformVisible() {
                document.getElementById('btnSign').style.display = "inline";
                document.getElementById('divLogin').style.display = "inline";
                document.getElementById('log').style.display = "none";
                document.getElementById('divsignup').style.display = "none";
                document.getElementById('logtext').style.display = "none";
                document.getElementById('signText').style.display = "inline";

            }

            function signupformVisible() {
                document.getElementById('divsignup').style.display = "inline";
                document.getElementById('divLogin').style.display = "none";
                document.getElementById('btnSign').style.display = "none";
                document.getElementById('log').style.display = "inline";
                document.getElementById('logtext').style.display = "inline";
                document.getElementById('signText').style.display = "none";

            }

            function hide() {
                document.getElementById('divLogin').style.display = "inline";
                document.getElementById('log').style.display = "none";
                document.getElementById('divsignup').style.display = "none";
                document.getElementById('logtext').style.display = "none";
                document.getElementById('unameText').style.display = "none";
                document.getElementById('emaiText').style.display = "none";
                document.getElementById('btntext').style.display = "none";
                document.getElementById('uVer').style.display = "none";
                document.getElementById('btntext1').style.display = "none";
            }

        </script>

        <title>Sign Up | Chat App</title>

    </head>
    <body onload="hide()">

        <div class="split left">
            <div class="centered fntleft">
                <h2 class="fntleft" id="signText">Not registered?</h2>
                <button type="button" id="btnSign" class="btn btn-outline-primary fntleft" onclick="signupformVisible()">  Sign Up  </button>
                <div id="divsignup">
                    <h2>Sign Up</h2>
                    <div class="container">

                        <label for="email"><b>Full Name</b></label>
                        <input type="text" placeholder="Enter Full Name" name="fname" id="fname" onchange="checkEmailValidation()" required/>

                        <label id="emaiText" style="font-size: 10px; color: red;"></label><br/>
                        <label for="email"><b>Email</b></label>
                        <input type="text" placeholder="Enter Email" name="email" id="email" onkeyup="checkEmailExsistsTest()" onchange="checkEmailValidation()" required/>

                        <label id="unameText" style="font-size: 10px; color: red;"></label><br/>
                        <label for="uname"><b>Username</b></label>
                        <input type="text" placeholder="Enter Username" name="uname" id="uname" required onkeyup="checkUserNameExsistsTest()"/>

                        <label for="psw"><b>Password</b></label>
                        <input type="password" placeholder="Enter Password" name="psw" id="pwd" required/>

                        <label id="btntext" style="font-size: 10px; color: red;"><b>Missing Details!</b></label>
                        <button type="button" onclick="saveUsers()">Sign Up</button>

                    </div>


                </div>

            </div>
        </div>

        <div class="split right">
            <div class="centered">
                <h2 class="fntright" id="logtext">Already registered?</h2>
                <button type="button" class="btn btn-outline-light fntright" id="log" onclick="logformVisible()">  Log In  </button>
                <div id="divLogin">
                    <h2>Login</h2>

                    <div class="imgcontainer">
                        <img src="images/user.png" alt="Avatar" class="avatar">
                    </div>

                    <div class="container">
                        <label for="uname"><b>Username</b></label><br/>
                        <label  id="uVer" style="font-size: 12px; color: black;"><b>Success</b></label>
                        <input type="text" placeholder="Enter Username" name="uname" id="lodUname" onkeyup="checkLogin()" required/>

                        <label for="psw"><b>Password</b></label>
                        <input type="password" placeholder="Enter Password" name="psw" id="logPwd" required/>

                        <label id="btntext1" style="font-size: 10px; color: black;"><b>Missing Details!</b></label>
                        <button type="button" onclick="loginUser()">Login</button>

                    </div>


                </div>


            </div>
        </div>

        <!--         <p id="msg" style="color: red">
        <%

//                if (request.getParameter("msg") != null) {
//
////                    response.getWriter().write(request.getParameter("msg"));
//
//                }
%>
    </p>-->

    </body>
</html> 
