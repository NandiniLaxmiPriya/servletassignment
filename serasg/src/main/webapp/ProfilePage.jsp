<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile page</title>
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css"> 
       <!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        --> 
    
    <link href = "https://fonts.googleapis.com/icon?family=Material+Icons" rel = "stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <style>
      .material-symbols-outlined {
        font-variation-settings:
        'FILL' 1,
        'wght' 300,
        'GRAD' 0,
        'opsz' 48
      }
      </style>


<!-- <script>
  // function preventBack(){window.history.forward();}
  // setTimeout("preventBack()", 0);
  // window.onload=function(){
  //   console.log("hehehin onload e")
  //   console.log(window.localStorage.getItem("usersList"),"heheheh")
    
  //   setTimeout(window.history.forward(), 0);
  //   // null
  // };
  history.pushState(null, null, document.URL);
window.addEventListener('popstate', function () {
  const up = new URLSearchParams(location.search);
    let lusername=""
    let leusername=""
    for(const [key,value] of up)
    {
      if(key==="username")
      {
        lusername = value
        break;
      }
      else if(key==="eusername")
      {
        leusername = value
        break;
      }
    }
   // console.log(window.localStorage.getItem("usersList"),"heheheh")
    let lobj = JSON.parse(window.localStorage.getItem("usersList"))
    let luser = lobj.username;
    let leuser;
    if(window.localStorage.getItem("eusersList"))
    {
      let leobj = JSON.parse(window.localStorage.getItem("eusersList"))
      leuser = leobj.efname;
    }
    
   
    
    
    // console.log(luser,"loggined user")
    if(lusername !== luser)
    {
      console.log("YEsssssssssssssss")
        history.pushState(null, null, document.URL);
    }else  if(leusername !== leuser)
    {
      console.log(leuser,leusername)
      console.log("YEsssssssssssssss in le")
        history.pushState(null, null, document.URL);
    }
   
});


  // if(window.history.back())
  // {
  //   console.log("rueeee")
  // }

 function signout()
  {
    
    localStorage.clear();
    const up = new URLSearchParams(location.search);
    let lusername=""
    let leusername=""
    for(const [key,value] of up)
    {
      if(key==="username")
      {
        lusername = value
        break;
      }
      else if(key==="eusername")
      {
        leusername = value
        break;
      }
    }
    let lobj = JSON.parse(window.localStorage.getItem("usersList"))
    let leobj = JSON.parse(window.localStorage.getItem("eusersList"))
   // let luser = lobj.username;
    // console.log(luser,"loggined user")
    history.pushState(null, null, document.URL);
    if(lobj===null && leobj===null)
    {
      window.location.href="http://127.0.0.1:5500/index.html";
      history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
          console.log("YEsssssssssssssss in out")
          history.pushState(null, null, document.URL);
          
        })
        
    }
    
  }
//   if (sessionStorage.getItem('AuthenticationState') === null) {
//     window.location.href="http://127.0.0.1:5500/index.html";
// }
  window.onload =  function(){
    let username = ""
    let eusername = ""
    let imgsrc="";
    const up = new URLSearchParams(location.search);
    let flag=false;
    for(const [key,value] of up)
    {
      if(key==="username")
      {
        username = value
        flag=false;
        break;
      }else if(key==="eusername")
      {
        eusername = value
        flag=true;
        break
      }
    }
    //console.log(username,"heheh")
    //console.log(eusername,"editing user")
   if(flag===false)
   {
     fetch("./userDetails.json").then(res=>
        res.json()
        )
    .then(data=>{
        console.log(data)
        for(let u of data)
        {
            if(u.username === username)
            {
                flag=true
                console.log("hehehe")
                let obj = {};
                let lastname = u.lastname;
                let designation = u.designation;
                let address = u.address
                let contactno = u.contactno
                let mail = u.mail
                let url = u.url
                let language = u.language
                let pic = u.pic;
                imgsrc=u.pic;
                obj.username = username;
                obj.designation = designation;
                obj.address = address;
                obj.contactno = contactno;
                obj.mail = mail;
                obj.url = url;
                obj.language = language;
                obj.pic = pic;
                localStorage.setItem("usersList",JSON.stringify(obj))
                document.getElementById("pname").innerHTML=username+" "+lastname;
                document.getElementById("pdesignation").innerHTML=designation;
                document.getElementById("paddress").innerHTML=address;
                document.getElementById("pcontactNo").innerHTML=contactno;
                document.getElementById("pmail").innerHTML=mail;
                document.getElementById("plink").innerHTML=url;
                document.getElementById("planguage").innerHTML=language;
                const output = document.querySelector("#profilepic1")
                const div = document.createElement("div");
                div.innerHTML=`<img src="${pic}" style="height: 205px; width: 245px;"/>`
                output.appendChild(div);
                $(document).on("click", ".open-AddImgDialog",function(){
                      console.log(imgsrc,"image")
                       $('#my_image').attr('src',imgsrc)
                })
                break
            } 
        }
    })
    .catch(error => 
        console.error(error)
        );
  }else{
    fetch("./editUser.json").then(res=>
      res.json())
    .then(data => {
      console.log(data,"in fetch")
      for(let u of data){
        console.log(u)
      if(u.efname === eusername)
      {
        let obj={}
        console.log("lolo inside ifi")
        let efname = u.efname;
        let edesignation = u.edesignation;
        let eaddress = u.eaddress;
        let econtactNo = u.econtactNo;
        let email = u.email;
        let elanguage = u.elanguage;
        let epic = u.epic;
        let elink = u.elink;
        imgsrc = u.epic;
        obj.efname = efname;
        obj.edesignation = edesignation;
        obj.eaddress = eaddress;
        obj.econtactNo = econtactNo;
        obj.elanguage = elanguage;
        obj.epic = epic;
        obj.elink = elink;
        localStorage.setItem("eusersList",JSON.stringify(obj))
        console.log(localStorage.getItem("usersList"))
        let temp = JSON.parse(localStorage.getItem("usersList"))
        console.log(temp.username,"mememememmeme")
        let tempusername=temp.username;
        if(econtactNo.length!==10 || isNaN(econtactNo))
        {
          alert("contact number must be 10 digit number")
          
         window.location.href="http://127.0.0.1:5500/ProfilePage.html?username="+tempusername;
        }else if(!isNaN(efname)){
          alert("Name must must not contain number")
          
         window.location.href="http://127.0.0.1:5500/ProfilePage.html?username="+tempusername;
        }else if(!isNaN(edesignation)){
          alert("Designation must must not contain number")
          
         window.location.href="http://127.0.0.1:5500/ProfilePage.html?username="+tempusername;
        }else if(!isNaN(elanguage)){
          alert("Language must must not contain number")
          
         window.location.href="http://127.0.0.1:5500/ProfilePage.html?username="+tempusername;
        }
        else{
        document.getElementById("pname").innerHTML=efname;
        document.getElementById("pdesignation").innerHTML=edesignation;
        document.getElementById("paddress").innerHTML=eaddress;
        document.getElementById("pcontactNo").innerHTML=econtactNo;
        document.getElementById("pmail").innerHTML=email;
        document.getElementById("plink").innerHTML=elink;
        document.getElementById("planguage").innerHTML=elanguage;
        const output = document.querySelector("#profilepic1")
        const div = document.createElement("div");
        div.innerHTML=`<img src="${epic}" style="height: 205px; width: 245px;"/>`
        output.appendChild(div);
        $(document).on("click", ".open-AddImgDialog",function(){
                      console.log(imgsrc,"image")
                       $('#my_image').attr('src',imgsrc)
                })
        break;
        }
      }
    }
    })
    .catch(error => 
        console.error(error)
    );
  }
  }



</script>
 -->
</head>
<body>
    <header class="clearfix">
    <nav class="navbar navbar-expand-lg navbar fixed-top navbar-dark bg-dark">
        <div class="container-fluid">
          <h5 class="text-white">Patternfly</h5>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="ProfilePage.html">Home</a>
              </li>
             
            </ul>
                <div class="d-flex flex-row-reverse nav-item text-white">
                 <!--  <button class="d-flex nav-link btn btn-link" type="button" id="signout" onclick="/Logout"><button class="d-flex nav-link btn btn-link" type="button" id="signout" onclick="/Logout"><span class="material-symbols-outlined">
                    logout 
                    </span>
                    <p>sign out</p>
                  </button> -->
                  <span class="material-symbols-outlined">
                    logout 
                    </span>
                    <a href="Logout">sign out</a>
                  </div>
          </div>
         
        </div>
      </nav>
      </header>
      <br>
      <main class="mt-5">
        <div class="">
            <div class="row gx-2">
                <div class="col-lg-3 col-md-6">
                    <div class="card">
                    <div class="d-flex flex-column">
                        <div class="p-1 m-1">
                          <div class="d-flex justify-content-end"><button type="button" class="btn btn-light open-AddImgDialog" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="edit">
                          <span class="material-symbols-outlined">
                            edit_square
                            </span></button></div>
                            <div class="d-flex justify-content-center" id="profilepic1"><img src=${sessionScope.file } alt="Profile" style="height: 205px; width: 245px;"></div>
                            <h5 class="d-flex justify-content-center mx-5" id="pname">${sessionScope.username }</h5>
                            <p class="d-flex justify-content-center mx-5" id="pdesignation">${sessionScope.designation }</p>
                                <ul class="justify-content-start" style="list-style-type:none;">
                                <li class="d-flex"><span class="material-symbols-outlined me-1">location_on</span><p id="paddress">${sessionScope.address }</p></li>
                                <li class="d-flex"><span class="material-symbols-outlined me-1">call</span><p id="pcontactNo">${sessionScope.cno }</p></li>
                                <li class="d-flex"><span class="material-symbols-outlined me-1">mail</span><p id="pmail">${sessionScope.mail }</p></li>
                                <li class="d-flex"><span class="material-symbols-outlined me-1">link</span><p id="plink">${sessionScope.link }</p></li>
                                <li class="d-flex"><span class="material-symbols-outlined me-1">g_translate</span><p id="planguage">${sessionScope.language }</p></li>
                                </ul>
                                <div class="d-flex justify-content-center">
                                  <a href=""></a><i class='fa fa-twitter' style='font-size:28px;color:rgb(102, 162, 240)'></i>
                                  <i class="fa fa-soundcloud" style='font-size:28px;color:rgb(224, 109, 15)'></i>
                                </div>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-6">
                    <div class="col">
                        <div class="row">
                          <div class="card col-lg-12">

                            <div class="card-body">
                              <h5 class="card-title">BACKGROUND</h5>
                            </div>
                          </div>
                          <div class="card col-lg-12">
                            <div class="card-body">
                              <div class="d-flex">
                              <span class="material-symbols-outlined me-4">
                                badge
                                </span><h5 class="card-title">ABOUT</h5>
                                </div>
                              <p class="card-text me-5 mx-5">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                 It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                              
                            </div>
                          </div>
                          <div class="card col-lg-12">
                            <div class="card-body">
                              <div class="d-flex">
                                <span class="material-symbols-outlined me-4">
                                  apartment
                                  </span><h5 class="card-title">WORK EXPERIENCE</h5>
                                  </div>
                                  <p class="card-text me-5 mx-5">
                                    PROJECT,<span class="text-primary">Java,React</span>
                                  </p>
                                  <p class="d-flex card-text me-5 mx-5" style="opacity: 0.5;">
                                    Dec,2013-Dec,2014 <span class="material-symbols-outlined mx-2">
                                      pace
                                      </span>1 year
                                  </p>
                                  <p class="card-text me-5 mx-5">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                    It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                  <P>
                                    <ul class="card-text me-5 mx-5" style="list-style-type: circle;">
                                      <li>Random point 1</li>
                                      <li>Random point 1</li>
                                      <li>Random point 1</li>
                                    </ul>
                                  </P>
                            </div>
                          </div>
                          <div class="card col-lg-12">
                            <div class="card-body">
                              <div class="d-flex">
                              <span class="material-symbols-outlined me-4">
                                design_services
                                </span><h5 class="card-title">SKILLS</h5>
                                </div>
                              <div class="card-text mx-5">
                                
                                 <div style="border-left-color: rgb(14, 250, 93);border-left-width: thick; border-left-style: solid;">
                                  <span class="badge bg-primary border rounded mx-2">CS2011-Java Introduction</span>
                                </div>
                                <div style="border-left-color: rgb(14, 250, 93);border-left-width: thick; border-left-style: solid;">
                                  <span class="badge bg-primary border rounded mx-2">CS2012-Databases</span>
                                </div>
                                <div style="border-left-color: rgb(14, 250, 93);border-left-width: thick; border-left-style: solid;">
                                  <span class="badge bg-primary border rounded mx-2">CS2013-UI</span>
                                </div>
                                <div style="border-left-color: rgb(14, 250, 93);border-left-width: thick; border-left-style: solid;">
                                  <span class="badge bg-primary border rounded mx-2">CS2014-Debugging</span>
                                </div>
                              </div>
                              
                            </div>
                          </div>
                          <div class="card col-lg-12">
                            <div class="card-body">
                              <div class="d-flex">
                              <span class="material-symbols-outlined me-4">
                                school
                                </span><h5 class="card-title">EDUCATION</h5>
                                </div>
                                <p class="card-text me-5 mx-5">
                                  <b>Bachelor of Technology,</b><span class=""> IIT Kanpur</span>
                                </p>
                                <p class="d-flex card-text me-5 mx-5" style="opacity: 0.5;">
                                  June,2011-Jan,2014
                                </p>
                                <p class="d-flex card-text me-5 mx-5">
                                  <i>CGPA:Random</i>
                                </p>
                                <p class="d-flex card-text me-5 mx-5">
                                <span class="badge bg-primary border rounded">SQL</span>
                                <span class="badge bg-primary border rounded mx-2">Java OOPS</span>
                                </p>
                            </div>
                          </div>
                          <div class="card col-lg-12">
                            <div class="card-body">
                              <div class="d-flex">
                              <span class="material-symbols-outlined me-4">
                                favorite
                                </span><h5 class="card-title">INTERESTS</h5>
                                </div>
                              <p class="card-text me-5 mx-5">
                                <span class="badge bg-primary border rounded">Singing</span>
                                <span class="badge bg-primary border rounded mx-2">Playing Chess</span>
                              </p>
                              
                            </div>
                          </div>
                          <div class="position-relative">
                            <div class="position-absolute bottom-0 end-0">
                              <img src="BottomRightButton.png" alt="btright" srcset="">
                            </div>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


  <!--POP UP MODAL-->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="col-11 modal-title text-center" id="staticBackdropLabel">Your Details</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body" id="'myCollapse'">
            <div class="container">
                    <div class="float-lg-end col-md text-center col-sm text-center">
                        <div class="p-2">
                            <img src="images.png" alt="profilepic" height="150px" width="150px" id="my_image">
                            <!-- <div id="profilepic2">hellooworld</div> -->
                        </div>
                    </div>
                <div class="row mt-6">
                    
                    <div class="col-lg-11 col-md-10">
                        
                        <form action="http://127.0.0.1:5501/form-edit" method="get">
                            <div class="mb-3">
                                <label for="fullname" class="form-label">Name:</label>
                                <input type="text" class="form-control" id="fullname" placeholder="First Name" name="efname" required>
                                
                            </div>
                            <div class="mb-3">
                                <label for="designation" class="form-label">Designation:</label>
                                <input type="text" class="form-control" id="designation" placeholder="" name="edesignation" required>
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label">Address:</label>
                                <textarea class="form-control" id="address" rows="2" name="eaddress" required></textarea>
                            </div>
                            <div class="row">
                                <div class="col mb-3">
                                    <label for="contactNo" class="form-label">Contact Number:</label>
                                    <input type="text" class="form-control" id="contactNo" placeholder="Contact Number" name="econtactNo" required>
                                </div>
                                <div class="col mb-3">
                                    <label for="mail" class="form-label">Email:</label>
                                    <input type="email" class="form-control" id="mail" name="email" required>
                                    
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mb-3">
                               
                                    <label for="url" class="form-label">Link:</label>
                                    <input type="text" class="form-control" id="url" name="elink" required>
                                </div>
                                <div class="col mb-3">
                                    <label for="lang" class="form-label">Language:</label>
                                    <input type="text" class="form-control" id="lang" placeholder="Language" name="elanguage" required>
                                </div>
                            </div>
                            
                            
                            <div class="mb-3">
                                <label for="profilepic" class="form-label">Profile Picture:</label>
                                <input type="file" class="form-control-sm" id="profilepic" name="epic" required>
                            </div>
                            <div class="col d-flex justify-content-end">
                              <button type="submit" class="btn btn-light">Save</button>
                            </div>
                        </form>
                       
                    </div> 
                </div>
               
            </div>
        </div>
        
      </div>
    </div>
  </div>
      </main>
      <!-- <script src="bootstrap/js/bootstrap.bundle.js"></script> -->
      <!-- <script src="profile.js"></script>  <script src="Json_Js.js"></script>-->
     
</body>
</html>