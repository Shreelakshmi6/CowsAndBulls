<%
	if(session.getAttribute("name")==null){
		response.sendRedirect("index.jsp");
	}
%>
<html >
  <head>
    <meta charset="utf-8">
    <title>Bull's and Cow's</title>
   	<link rel="stylesheet" href="style.css">
   	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   	<script src="https://kit.fontawesome.com/64e1bb2e91.js" crossorigin="anonymous"></script>
  </head>
  <body>
<div class="bg" >
<nav class="navbar fixed-top navbar-expand-md navbar-light " id= "myHeader">
  <a href="index.jsp" class="navbar-brand"><i><strong>Cows & Bulls</strong></i></a>

  <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#mnav">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse nav-container" id="mnav">
    <ul class="navbar-nav navmargin" style="padding-right: 350px;" >
      <li class="nav-item" ><a href="index.jsp" class="nav-link">Home</a></li>
         <li class="nav-item"><a href="index.jsp" class="nav-link">Stats</a></li>
          <li class="nav-item"><a href="PrevousOrder.jsp" class="nav-link">About</a></li>
        </ul>
      <form class="form-inline d-flex flex-nowrap searchbar" style="padding-right: 20px;">
        <input type="search" class="form-control" placeholder="search">
        <button class="btn btn-outline-dark">Search</button>
      </form>
      <a href="Profilepage.jsp" class="nav-link profile-name" style="margin-left: 25%;"><i class="fa-solid fa-user">  </i><%=session.getAttribute("name") %></a>
  </div>
	<a href="logout"><button  class="btn btn-outline-dark logout">Logout</button></a>
</nav>


<div class="container-top">
	<h1 class="head" style="margin-top: 4.25%;padding-left:30%;"><strong>The Bulls and Cows game!</strong></h1>
  <div class="wrapper mx-sm-3 mb-2"style="padding-left:30%;">
	<input type="number" class="form-control mb-2" style="width:25%; "max="9999" min="0000" placeholder="e.g. 1234" id="try"
onkeydown = "if (event.keyCode == 13)
                        document.getElementById('submit').click()"
                        /><input type="submit" name="submit" id="submit" class="btn btn-primary mb-2" onclick="check()">
	<p>Console</p>
	<textarea name="console" id="console" cols="50" rows="10">All the best!!</textarea></div>
	<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>

</div>
</div>
  </body>
  <script type="text/javascript">
  var counter=0;
  function randomNumber(){
  var number= Math.floor(Math.random()*10);
  return number
  }
  function computerNumber(){
  var fourth= randomNumber();
  for (var i;i=1;i++) {
  	var third= randomNumber();
  	var second= randomNumber();
  	var first= randomNumber();
  	if(third!=fourth && second!=fourth && second!=third && first!=fourth && first!=third && first!=second){break}
  }
  var rnd=fourth.toString()+third.toString()+second.toString()+first.toString();
  console.log(rnd);
  return rnd;
  }
  function verifyEntry(number){
  	number=number.toString();
  	verif=true;
  	for (var i=0;i<4;i++){
  		if (number.lastIndexOf(number.charAt(i))!=i){
  			verif=false;
  			break;
  		}
  	}
  	return verif;
  }
  rnd = computerNumber();

  function check(){
  	var userNumber=$("#try").val().toString();
  	var vache=0;
  	var toreau=0;
  	if (verifyEntry(userNumber)===false){$("#console").prepend(userNumber+" - Invalid entry or duplicated number, please try again.\r\n")} else {
  	for (var n=0; n<4; n++){
  		for (var i=0; i<4; i++){
  		if (userNumber.charAt(i) === rnd.charAt(n) && i==n)
  			{toreau++;} else {if(userNumber.charAt(i) === rnd.charAt(n)) {vache++;}}

  		}
  	}
  		counter++;
  		if (toreau===4){
  			$("#console").prepend(userNumber+ " - 4 bulls, YOU WIN after "+counter+" tries.\r\n"+"A new number has been set, play again.\r\n");
  			rnd=computerNumber();
  			counter=0;}
  		else{$("#console").prepend(userNumber+ " - " + vache +" cow(s) and "+toreau+" bull(s), tries: "+counter+"\r\n");}}
  		$("#try").val("");
  }
  </script>
</html>
