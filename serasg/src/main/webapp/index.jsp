<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <title>
            Art of Heart!
        </title>
        

<script>
    history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
          localStorage.clear();
          history.pushState(null, null, document.URL);
        })
  </script>
  
    </head>
    <body>
        <div class="wrapper">
            <div class="c-0">
            <div class="c-1">
                <img src="icon.svg" >
                
            </div>
            <div class="c-2">
                <h1>PATTERNFLY</h1>
            </div>
            </div>
            <div class="c-3">
                <h4>A world to live fully your virtual imaginations where you can improve yourselves :)</h4>
            </div>
            <form action="Login" method="post">
            <div class="c-4">
                
                    <div class="c-4-select">
                        <br>
                        <select name="language" id="lan">
                            <option value="English">English</option>
                            <option value="Hindi">Hindi</option>
                        </select>
                    </div>
                    <div class="c-4-heading">
                        <h4>Log In to Your Account</h4>
                    </div>
                    <div class="c-4-inputs">
                        <div><input type="text" id="name" name="username" placeholder="Email or phone or username" required/>
                    </div>
                    <div>
                        <input type="password" id="password" name="password" placeholder="Password" required/>
                    </div>
                </div>
                    <br>
                    <div class="c-4-checkb">
                        <div> <input type="checkbox" id="signin" name="sigin"/>
                        <label for="signin">keep me logged in for 30 days</label>
                        </div>
                       <div class="anchor"><a href="pracmodal.html" style="color: rgb(26, 168, 235);" target="_blank">Forgot password?</a>
                        </div>

                    </div>
                    <div class="c-4-buttons">
                        <br><br><br>
                        <input type="submit" id="login" name="login" value="Log In" onclick="check(event)"/>
                    </div>
                    <div class="c-4-signup">
                        <h4>Need an account? <a href="SignUp.jsp" target="_self" style="color: rgb(26, 168, 235);"> Sign up</a></h4>
                    </div>
                    <br>
            </div>
        </form>
        <div class="c-5">
            <ul class="list">
                <li>Terms of Use</li>
                <li>.</li>
                <li>Help</li>
                <li>.</li>
                <li>Privacy Policy</li>
            </ul>
            </div>
        </div>
        <!-- <iframe src="/home/beehyv/Dailywork/HtmlPrac/Bootstraprac/SignUp.html" style="display: none;"></iframe> -->
        <!-- <script src="profile.js"></script> -->
        <!-- <script src="signin.js"></script> -->
        <!-- <script src="Json_Js.js"></script> -->
    </body>
    </html>