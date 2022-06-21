<%-- 
    Document   : chat
    Created on : Jan 18, 2021, 9:14:09 PM
    Author     : 1999k
--%>

<%@page import="controllers.logoutHandle"%>
<%@page import="servlets.logout"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession hs = request.getSession();%>

<%!
    public static String email;
    public static String uname;
    public static String fname;
    public static int id;
%>
<%
    try {
        id = Integer.valueOf((String) hs.getAttribute("idUser"));
        fname = (String) hs.getAttribute("fullname");
        uname = (String) hs.getAttribute("username");
        email = (String) hs.getAttribute("email");

        if (id > 0) {

        } else {
            logoutHandle lg = new logoutHandle();
            lg.logoutUser(email);

            response.sendRedirect("index.jsp?msg=Expired!,Please Try Again To Continue");
        }
    } catch (Exception e) {

        logoutHandle lg = new logoutHandle();
        lg.logoutUser(email);

        response.sendRedirect("index.jsp?msg=Expired!,Please Try Again To Continue");
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="sidebar.css">
        <link rel="stylesheet" href="topnav.css">
        <link rel="stylesheet" href="chatcomp.css">
        <link rel="stylesheet" href="container.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .selecta {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            .butoondata {
                width: 100%;
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .butoondata:hover {
                background-color: #45a049;
            }

            divContainer {
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
            }

            body {margin:0;font-family:Arial}

            .btn {
                width: 95%;
                border: 2px solid black;
                background-color: white;
                color: black;
                padding: 14px 28px;
                font-size: 16px;
                cursor: pointer;
                margin: 5px;
            }
            .default {
                border-color: #e7e7e7;
                color: black;
            }

            .default:hover {
                background: #e7e7e7;
            }

            /* Green */
            .success {
                border-color: #4CAF50;
                color: green;
            }

            .success:hover {
                background-color: #4CAF50;
                color: white;
            }

            .topnav {
                overflow: hidden;
                background-color: #333;
            }

            .topnav a {
                float: left;
                display: block;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }

            .active {
                background-color: #4CAF50;
                color: white;
            }

            .topnav .icon {
                display: none;
            }

            .dropdown {
                float: left;
                overflow: hidden;
            }

            .dropdown .dropbtn {
                font-size: 17px;    
                border: none;
                outline: none;
                color: white;
                padding: 14px 16px;
                background-color: inherit;
                font-family: inherit;
                margin: 0;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                float: none;
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                text-align: left;
            }

            .topnav a:hover, .dropdown:hover .dropbtn {
                background-color: #555;
                color: white;
            }

            .dropdown-content a:hover {
                background-color: #ddd;
                color: black;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            @media screen and (max-width: 600px) {
                .topnav a:not(:first-child), .dropdown .dropbtn {
                    display: none;
                }
                .topnav a.icon {
                    float: right;
                    display: block;
                }
            }

            @media screen and (max-width: 600px) {
                .topnav.responsive {position: relative;}
                .topnav.responsive .icon {
                    position: absolute;
                    right: 0;
                    top: 0;
                }
                .topnav.responsive a {
                    float: none;
                    display: block;
                    text-align: left;
                }
                .topnav.responsive .dropdown {float: none;}
                .topnav.responsive .dropdown-content {position: relative;}
                .topnav.responsive .dropdown .dropbtn {
                    display: block;
                    width: 100%;
                    text-align: left;
                }
            }

            .textStyleNav{
                font-size: 25px;
                color: #ffffff;               
            }

            .span:hover{

                cursor: none;
            }


        </style>

        <script type="text/javascript">

//            window.addEventListener('beforeunload', (event) => {
//                event.returnValue = `Are you sure you want to leave?`;
//            });


            function showActiveUsers() {

                var username = document.getElementById('emDa').innerText;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var responstext = this.responseText;

                        var dataArray = JSON.parse(responstext);

                        var divContent = "";

                        for (var i = 0; i < dataArray.length; i++) {

                            if (dataArray[i].name !== username) {
                                divContent = divContent + "<span class='btn success' style='width:100%;cursor :none'>" + dataArray[i].name + "</span>";
                            }
                        }

                        document.getElementById('loadActiveUsers').innerHTML = divContent;

                    }
                };
                xhttp.open("GET", "loadActiveUsers", true);
                xhttp.send();
            }



            function showPeople() {
                document.getElementById('pediv').style.display = "inline";
                document.getElementById('actdiv').style.display = "none";
                document.getElementById('prdiv').style.display = "none";
                document.getElementById('gpdiv').style.display = "none";
                document.getElementById('prtLoad').style.display = "none";
                document.getElementById('loadUname').innerHTML = "";
//                document.getElementById('peoCont').style.display = "none";

            }
            function showActive() {

                setInterval(showActiveUsers, 1000);
                
                
                document.getElementById('actdiv').style.display = "inline";
                document.getElementById('pediv').style.display = "none";
                document.getElementById('prdiv').style.display = "none";
                document.getElementById('gpdiv').style.display = "none";
                document.getElementById('prtLoad').style.display = "none";
                document.getElementById('loadUname').innerHTML = "";
//                document.getElementById('peoCont').style.display = "none";

            }
            function showPr() {

                loadUsersForPrivateChat();

                document.getElementById('prdiv').style.display = "inline";
//                document.getElementById('peoCont').style.display = "inline";
                document.getElementById('actdiv').style.display = "none";
                document.getElementById('pediv').style.display = "none";
                document.getElementById('gpdiv').style.display = "none";
                document.getElementById('loadUname').innerHTML = "";
                document.getElementById('prtLoad').style.display = "none";

            }
            function showGP() {
                getgpMsg();

                document.getElementById('gpdiv').style.display = "inline";
                document.getElementById('pediv').style.display = "none";
                document.getElementById('actdiv').style.display = "none";
                document.getElementById('prdiv').style.display = "none";
                document.getElementById('prtLoad').style.display = "none";
                document.getElementById('loadUname').innerHTML = "";
//                document.getElementById('peoCont').style.display = "none";

            }

            function loadUsers() {

                document.getElementById('pediv').style.display = "inline";
                document.getElementById('actdiv').style.display = "none";
                document.getElementById('prdiv').style.display = "none";
                document.getElementById('gpdiv').style.display = "none";
                document.getElementById('prtLoad').style.display = "none";
                document.getElementById('loadUname').innerHTML = "";

                var username = document.getElementById('emDa').innerText;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var responstext = this.responseText;

                        var dataArray = JSON.parse(responstext);

                        var divContent = "";

                        for (var i = 0; i < dataArray.length; i++) {
                            if (dataArray[i].name !== username) {

                                divContent = divContent + "<span class='btn success'  style='width:100%;cursor :none'>" + dataArray[i].name + "</span>";
                            }
                        }

                        document.getElementById('loadUsers').innerHTML = divContent;

                    }
                };
                xhttp.open("GET", "loadUsers", true);
                xhttp.send();
            }


            function searchUserByname() {

                var text = document.getElementById('searchUser').value;
                var username = document.getElementById('emDa').innerText;

                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var responstext = this.responseText;



                        var dataArray = JSON.parse(responstext);

                        var divContent = "";

                        for (var i = 0; i < dataArray.length; i++) {
                            if (dataArray[i].name != username) {
                                divContent = divContent + "<button class='btn success'  style='width:100%;cursor :none'>" + dataArray[i].name + "</button>";
                            }
                        }

                        document.getElementById('loadUsers').innerHTML = divContent;

                    }
                };
                xhttp.open("POST", "loadUsers", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("text=" + text);
            }


            function searchActiveUserByname() {

                setInterval(showActiveUsers, 100000);

                var username = document.getElementById('emDa').innerText;

                var text = document.getElementById('searchActiveUser').value;

                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var responstext = this.responseText;



                        var dataArray = JSON.parse(responstext);

                        var divContent = "";

                        for (var i = 0; i < dataArray.length; i++) {

                            if (dataArray[i].name != username) {

                                divContent = divContent + "<button class='btn success'  style='width:100%;cursor :none'>" + dataArray[i].name + "</button>";
                            }
                        }

                        document.getElementById('loadActiveUsers').innerHTML = divContent;

                    }
                };
                xhttp.open("POST", "loadActiveUsers", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("text=" + text);
            }


            function sendgpMsg() {

                var msg = document.getElementById('lname').value;
                var username = document.getElementById('emload').innerText;

                document.getElementById("h1").innerHTML = "Sending..."

                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById('h1').innerHTML = this.responseText;
                        document.getElementById('lname').value = "";
                    }
                };
                xhttp.open("GET", "groupMassageHandler?username=" + username + "&msg=" + msg, true);
                xhttp.send();
            }


            function getgpMsg() {

                setTimeout(getgpMsg, 1000);

                var uname = document.getElementById('emload').innerText;



                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var response = this.responseText;

                        var dataArray = JSON.parse(response);
                        var divContent = "";

                        for (var i = 0; i < dataArray.length; i++) {
                            var username = dataArray[i].username;
                            var msg = dataArray[i].content;
                            var date = dataArray[i].date;


                            if (uname == username) {

                                divContent = divContent + " <div class='container'><p class='time-right'>" + msg + "</p><br/><br/><span class='time-right'>" + "Me" + "</span><br/><span class='time-right'>" + date + "</span></div>"

                            } else {

                                divContent = divContent + " <div class='container darker'><p>" + msg + "</p> <span class='time-left'>" + username + "</span><br/><span class='time-left'>" + date + "</span></div>"

                            }

                        }

                        document.getElementById('loadMsages').innerHTML = divContent;

                    }
                };
                xhttp.open("POST", "groupMassageHandler", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send();
            }


            function loadUsersForPrivateChat() {

                var username = document.getElementById('emDa').innerText;
                


                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var responstext = this.responseText;

                        var dataArray = JSON.parse(responstext);

                        var divContent = "";

                        for (var i = 0; i < dataArray.length; i++) {

                            if (dataArray[i].name != username) {
                                divContent = divContent + "<button href='#' class='list-group-item list-group-item-action list-group-item-success' onclick='openChat(" + dataArray[i].idUser + ")' id='" + dataArray[i].name + "'>" + dataArray[i].name + "</button>";
                            }
                        }

                        document.getElementById('ldUs').innerHTML = divContent;

                    }
                };
                xhttp.open("GET", "loadUsers", true);
                xhttp.send();
            }

            function openChat(x) {

                document.getElementById('prtLoad').style.display = "inline";

                loadPrvtMsgs();

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var responstext = this.responseText;

                        document.getElementById('loadUname').innerHTML = responstext;

                    }
                };
                xhttp.open("GET", "takeUsername?uid=" + x, true);
                xhttp.send();
            }

            function myFunction() {
                var x = document.getElementById("myTopnav");
                if (x.className === "topnav") {
                    x.className += " responsive";
                } else {
                    x.className = "topnav";
                }
            }

            function openNav() {
                document.getElementById("mySidenav").style.width = "250px";
                document.getElementById("main").style.marginLeft = "250px";
                document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
                document.getElementById("main").style.marginLeft = "0";
                document.body.style.backgroundColor = "white";
            }

            function sendPrivateMsg() {

                var msg = document.getElementById('lPname').value;
                var username = document.getElementById('emload').innerText;
                var sender = document.getElementById('loadUname').innerText;

                document.getElementById("h1").innerHTML = "Sending..."

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById('h2').innerHTML = this.responseText;
                        document.getElementById('lPname').value = "";
                    }
                };
                xhttp.open("GET", "privatemsgHandler?recnme=" + sender + "&uname=" + username + "&msg=" + msg, true);
                xhttp.send();

            }

            function loadPrvtMsgs() {


                setTimeout(loadPrvtMsgs, 1000);

                var uname = document.getElementById('emload').innerText;
                var sender = document.getElementById('loadUname').innerText;


                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var response = this.responseText;

                        var dataArray = JSON.parse(response);
                        var divContent = "";

                        for (var i = 0; i < dataArray.length; i++) {
                            var username = dataArray[i].username;
                            var msg = dataArray[i].content;
                            var date = dataArray[i].date;


                            if (uname == username) {

                                divContent = divContent + " <div class='container'><p class='time-right'>" + msg + "</p><br/><br/><span class='time-right'>" + "Me" + "</span><br/><span class='time-right'>" + date + "</span></div>"

                            } else {

                                divContent = divContent + " <div class='container darker'><p>" + msg + "</p> <span class='time-left'>" + username + "</span><br/><span class='time-left'>" + date + "</span></div>"

                            }

                        }
                        document.getElementById('loadPmMsages').innerHTML = divContent;

                    }
                };
                xhttp.open("POST", "privatemsgHandler", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("recnme=" + sender + "&uname=" + uname);

            }

        </script>

        <title>Chat | Chat App</title>
    </head>
    <body onload="loadUsers()">

        <div class="topnav" id="myTopnav">
            <span style="font-size:30px;cursor:pointer; color: white; "> | </span>
            <span style="font-size:30px;cursor:pointer; color: white; " onclick="openNav()">&#9776;</span>
            <span style="font-size:30px;cursor:pointer; color: white; "> | Username:</span>
            <span id="emload" style="font-size:30px;cursor:pointer; color: white; "><%=uname%></span>
            <span style="font-size:30px;cursor:pointer; color: white; "> | Fullname:</span>
            <span id="emDa" style="font-size:30px;cursor:pointer; color: white; "><%=fname%></span>
            <a class="textStyleNav" href="logout">Log Out</a>
        </div>



        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <button class="btn default" id="people" onclick="showPeople()">People</button>
            <button class="btn default" id="activeusers" onclick="showActive()">Active Users</button>
            <button class="btn default" id="prchat" onclick="showPr()">Private Chat</button>
            <button class="btn default" id="grchat" onclick="showGP()">Group Chat</button>
        </div>

        <div style=" position: absolute;left: 50%;top: 50%;transform: translate(-50%, -50%);padding: 10px;" id="pediv">

            <div id="divLad">
                <h1>Users...</h1>
                <span>Search User:</span>
                <input type="text" placeholder="Search.." name="search" id="searchUser" onkeyup="searchUserByname()"/>

            </div>
            <div id="loadUsers" >

            </div>

        </div>

        <div style=" position: absolute;left: 50%;top: 50%;transform: translate(-50%, -50%);padding: 10px;" id="actdiv">



            <div id="divActieUsers">
                <h1>Active Users...</h1>
                <span>Search User:</span>
                <input type="text" placeholder="Search.." name="search" id="searchActiveUser" onkeyup="searchActiveUserByname()"/>

            </div>
            <div id="loadActiveUsers">

            </div>

        </div>

        <div style=" position: absolute;left: 50%;top: 50%;transform: translate(-50%, -50%);padding: 10px;" id="prdiv">

            <h1>Private Chat...</h1>
            <h5 id="loadUname"></h5>
            <div class="divContainer" id="prtLoad">
                <div id="loadPmMsages" style="height:410px;width: 500px;background-color: #ccc;overflow-y:scroll;"></div>
                <input type="text" id="lPname" name="lastname" placeholder="Enter Your Text Here..." class="selecta">
                <input type="submit" style="width:20%" value="Send>>" class="butoondata" onclick="sendPrivateMsg()">
                <span id="h2"></span>
            </div>


        </div>
        <div id="peoCont" style="width: 200px;height: 500px;margin-top: 20px; margin-left:10px;">
            <div id="ldUs" >


            </div>
        </div>

        <div style=" position: absolute;left: 50%;top: 50%;transform: translate(-50%, -50%);padding: 10px; width: 65%" id="gpdiv">

            <h1>Group Chat...</h1>
            <div class="divContainer">
                <div id="loadMsages" style="height:450px;background-color: #ccc;overflow-y:scroll;"></div>
                <input type="text" id="lname" name="lastname" placeholder="Enter Your Text Here..." class="selecta">
                <input type="submit" style="width:20%" value="Send>>" class="butoondata" onclick="sendgpMsg()">
                <span id="h1"></span>
            </div>

        </div>

    </div>


</body>
</html>

