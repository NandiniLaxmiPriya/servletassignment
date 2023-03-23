<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <!-- Bootstrap -->
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css' rel='stylesheet' type='text/css'>
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js' type='text/javascript'></script>
    
    <!-- Datepicker -->
    <link href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css' rel='stylesheet' type='text/css'>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js' type='text/javascript'></script>

    <!--font awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        ::placeholder{
            opacity: 0.5;
             font-style: italic;
        }
        *{
            font-family: lato;
        }
    </style>
    <script>
       history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
          localStorage.clear();
          history.pushState(null, null, document.URL);
        })
      </script>
</head>
<body>
    <div class="container">
        <div class="col-sm text-center text-primary mt-3"><h3>Sign up</h3></div>
            <!-- <img src="images.png" alt="profilepic" height="245px" width="205px"> -->
            <hr style="height:2px; width:100%">
            <div class="float-lg-end float-md-end float-sm-end col-sm text-center">
                <div class="p-2">
                    <img src="images.png" alt="profilepic" height="245px" width="205px">
                </div>
            </div>
        <div class="row justify-content-center mt-5 ml">
            
            <div class="col-lg-6">
                
                <form action="Signup" method="post">
                    <div class="mb-3">
                        <label for="fname" class="form-label">First Name:</label>
                        <input type="text" class="form-control" id="fname" placeholder="First Name" name="username" required>
                        
                    </div>
                    <div class="mb-3">
                        <label for="lname" class="form-label">Last Name:</label>
                        <input type="text" class="form-control" id="lname" placeholder="Last Name" name="lastname" required>
                        
                    </div>
                    <label for="dob" class="form-label">Date of Birth:</label>
                    <div class="mb-3">
                      
                       
                        <div class="input-group date" id="datepicker">
                            <input type="text" class="form-control" id="dob" placeholder="mm/dd/yyyy" name="dob" required>
                            <span class="input-group-append">
                              <span class="input-group-text bg-light d-block">
                                <i class="fa fa-calendar"></i>
                              </span>
                            </span>
                          </div>
                        
                    </div>
                    <div class="mb-3">
                        <label for="eid" class="form-label">Employee Id:</label>
                        <input type="text" class="form-control" id="eid" placeholder="Employee Id Number" name="eid" required>
                        
                    </div>
                    <div class="mb-3">
                        <label for="designation" class="form-label">Designation:</label>
                        <input type="text" class="form-control" id="designation" placeholder="" name="designation" required>
                    </div>
                    <div class="mb-3">
                        <label for="mail" class="form-label">Email:</label>
                        <input type="email" class="form-control" id="mail" name="mail" required>
                        
                    </div>
                    <div class="mb-3">
                        <label for="contactNo" class="form-label">Contact Number:</label>
                        <input type="text" class="form-control" id="contactNo" placeholder="Contact Number" name="contactNo" required>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Address:</label>
                        <textarea class="form-control" id="address" rows="2" name="address" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="lang" class="form-label">Language:</label>
                        <!-- <input type="text" class="form-control" id="lang" placeholder="Language" name="language" required> -->
                        <select class="form-select" name="language">
                            <option name="" value="0" selected>Select Language</option>
                            <option name="English" value="English">English</option>
                            <option name="Hindi" value="Hindi">Hindi</option>
                      </select>
                    </div>
                    <label for="url" class="form-label">Link:</label>
                    <div class="input-group mb-3">
                       
                        <!-- <span class="input-group-text" id="urlspan">https://</span> -->
                        <input type="text" class="form-control" id="url" name="url" required>
                    </div>
                    <div class="mb-3">
                        <label for="profilepic" class="form-label">Profile Picture:</label>
                        <input type="file" class="form-control" id="profilepic" name="file" required>
                    </div>
                    <div class="mb-3">
                        <label for="spassword" class="form-label">Password:</label>
                        <input type="password" class="form-control" id="spassword" name="password" required>
                    </div>
                    <div class="mb-3 mt-5 d-grid col-6 mx-auto text-center">
                        <button class="btn btn-primary" type="submit" id="signup">Sign Up</button>
                    </div>
                </form>
               
            </div> 
        </div>
       
    </div>



    <script type="text/javascript">
        $(function(){
  $('#datepicker').datepicker();
});
    </script>
    <iframe src="/home/beehyv/Dailywork/HtmlPrac/Bootstraprac/index.html" style="display: none;"></iframe>
    <script src="bootstrap/js/bootstrap.bundle.js"></script>
    <!-- <script src="signup.js"></script> -->
    <!-- <script src="profile.js"></script> -->
    <!-- <script src="signup.js"></script> -->
    <!-- <script type="module" src="Store.js"></script> -->

</body>
</html>