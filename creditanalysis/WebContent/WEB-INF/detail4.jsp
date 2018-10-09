<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>    

    <%@page import="com.manipal.bean.MainBean"%>
    <%@page import="com.manipal.controller.MyController"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
  response.addHeader("Pragma", "no-cache");
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.addHeader("Cache-Control", "pre-check=0, post-check=0");
  response.setDateHeader("Expires", 0);
%>
 

 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 

<style>
/* Main table styling */
#myTable { width:800px;
        margin: auto;
        text-align:center;
        table-layout: fixed;
        border-radius: 20px;
  }
#myTable th{
            text-align: center;
        }
        
        
 #myTable th {
   
      border-radius: 20px;
      padding:20px;
      font-size: 24px;
      color:black;
      border: 3px solid white;
      border-collapse: collapse;
      font-family:Verdana;
      background:#78909C;
      
        }
    
    #myTable tr.d0 td {
       background-color: #e9edef;
      padding:20px;
      font-size: 18px;
      color:dimgray;
      border: 3px solid white;
    border-collapse: collapse;
      font-family:Verdana;
      font-weight: bold;
    border-radius: 20px;
    }
    
#myTable tr.d1 td{
    background-color:  #dee4e6;
       
       border-radius: 20px;
      padding:20px;
      font-size: 18px;
      color:dimgray;
      border: 3px solid white;
      border-collapse: collapse;
      font-family:Verdana;
      font-weight: bold;
    }
    
    
/*Main Table styling ends    */
    
/*    Credit card number table styling on top left corner below welcome user*/
    #Cardno{
        left:100px;
        top:10px;
        color:#5499C7;
        position: relative;
        left: 30px;
        font-family:Verdana;
        background-color: white
    }
    
/*Credit card number table styling ends*/
    
    
    
/*   To move the date selection box itself*/
    .DATE{
        position:absolute;
        right:208px;
        bottom: -210px;
        
    }
        
/*   ends     */

    
/*multi coloured line in header below the login and about buttons    */
.hrbr{
    background-image: linear-gradient(to right, #2980B9,#27AE60,#F4F6F7);
    width: 100%;
    height: 6px;
    margin-top: 4%;
    padding: 5px;  
    }
/*    ends*/
    
/*    Spend Splitup Adjustment*/
    .ak{
        font-family:Verdana;
        color:grey;
        text-align: center;
        
        font-size:30px;
        margin-top: 60px auto; 
        margin-left: 520px ;
    }       
/*     ends*/
    
/*    Addition and adjustment of From and To in Date box*/
    .From{
        position: absolute;
        left:20px;
    }
    
         
    .To{
         position: absolute;
        right:235px;
    }
    
/*    ends*/
    
    
/*    Scrumbledores army footer at the bottom */

    .footer {
    padding: 3px;
    position: absolute;
    left: 0;
    bottom: -200px
    //margin-top: 20%;
    width: 100%;
    background: #2980B9;
    color: white;
    text-align: center;
    height: 40px; 
    }
/*    ends*/

    
   

        
        
/*    Dropdown button for Categories     */
        
.dropbtn {
    position:absolute;
    bottom:-80px;
    background-color: lightgray;
    color: #424949  ;
    padding: 16px;
    font-size: 14px;
    border: none;
    cursor: pointer;
    margin-left: 150px;
    border-radius: 10px;
    width: 300px;
    
}

.dropbtn:hover, .dropbtn:focus {
    background-color: lightgray;
}
/*ends*/
    
    
/*Dropdown contents*/
    
.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 370px;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    left:150px;
    }

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}
/*  ends*/


/* Date Selection CSS all functions inside the date box */    
    div.ws-invalid input {
    border-color: #c88;
}
.ws-invalid label {
    color: #933;
}
div.ws-success input {
    border-color: #8c8;
}

form {
    
    margin-right: 5px;
    margin-bottom: -45px;   
    width: 500px;
   /* border: 1px solid #000; */
    padding: 10px;
    
}
.form-row {
    padding: 5px 10px;
    margin: 5px 0;
}
label {
    display: block;
    margin: 3px 0;
}
.form-row input {
    width: 220px;
    padding: 3px 1px;
    border: 1px solid #ccc;
    box-shadow: none;
}
.form-row input[type="checkbox"] {
    width: 15px;
}


/*  ends*/
    
    
    .Cat{
    position:absolute;
    left: 160px;
    bottom:0px;
    font-size:15px;
    }
    
</style>
 
 <%
 MainBean cc = (MainBean)request.getAttribute("data");
 float sum = cc.getTotal();
 

%>

 <script type="text/javascript">

window.onload = function () {
	var chart = new CanvasJS.Chart("chartContainer", {
		//animationEnabled=true,
		title:{
			              
		},
		data: [              
		{

			 
			        indexLabelPlacement: "outside",
			       
			type: "pie",
			showInLegend: "true",
			yValueFormatString: "##0.000\"%\"", 			
			legendText: "{label}",
			indexLabel: "{label} - {y}",
			//interactivityEnabled: true,
			animationEnabled: true,
			dataPoints: [
				{ label: "FOOD",  y: <%=cc.getFood()/cc.getTotal()*100%> },
				{ label: "MISCELLENEOUS", y: <%=cc.getClothes()/cc.getTotal()*100%>  },
				{ label: "BILLS", y: <%=cc.getPetrol()/cc.getTotal()*100%>  },
				{ label: "HEALTHCARE",  y: <%=cc.getHousehold()/cc.getTotal()*100%>  },
				{ label: "TRAVEL",  y: <%=cc.getHolidays()/cc.getTotal()*100%>  },
				{ label: "SHOPPING",  y: <%=cc.getGrocery()/cc.getTotal()*100%>  },
				{ label: "ENTERTAINMENT",  y: <%=cc.getEnt()/cc.getTotal()*100%>  },
				{ label: "GIFTS",  y: <%=cc.getGifts()/cc.getTotal()*100%>  },
				{ label: "EDUCATION",  y: <%=cc.getEdu()/cc.getTotal()*100%>  }
				
			]
		}
		]
	});
	chart.render();
}
 
</script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script></head>
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js">
</script>

<span class="wb-sessto" data-wb-sessto='{"inactivity": 1200000, , "logouturl": "index.html"}'></span>




</head>
<body>

     <div class="container-fluid">
  <div class="row" style="">
    <br>
      <div class="col-sm-12 navbar">
        <div class= "navbar navbar-header">
            <a class = "navbar-brand" href="#">Welcome <%=cc.getUser1() %></a>
        </div>
          
   
      
            <ul class="nav nav-pills" style="margin-left: 80%" style="margin-top: -5%">
              <li><a href="https://www.sc.com/in/about-us/">About</a></li>
              
                
      
                
                
             <li style="position: right; margin-left:10px"><a href="http://localhost:8585/creditanalysis/index.html">Logout</a></li> 
              
               <!--  <li style="position: right; margin-left:10px"><a href= "show.jsp" onClick="cl();" >Logout</a></li>
               -->
              <li class="pull-right"><img src="https://seeklogo.com/images/S/Standard_Chartered_Bank-logo-1D387B302A-seeklogo.com.png" class="img-rounded" alt="SCB" height="40px" width="95px" style= "margin-top: 5% "></li>
              </ul><br>
      </div>
     
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

      <!--ends-->
      
      
      
<!--      Html for the multi coloured line below about and login-->
<div class = "hrbr"></div>
     <br><br>
<!--ends     -->

      
           
<!--Table for the Card number present below welcome user      -->
<table  style="width:10%" id="Cardno">
      <tr><th>Card Number:</th></tr>
      <tr><td>${cno}</td></tr>
      </table>
<!--      ends-->
        
      
      
      
      
      <br>
<!--      Spend Splitup html-->
      <div class="ak" style="width:20%">SPEND SPLITUP</div>
<!--      ends-->
      
      
 
      
      
<!--      Html for the box containing the piechart and piechart itself-->
      
      <div class="row" style="margin-left: 10%; margin-top: 1%"> 
        <div class="col-md-10" style="height: 120%">
          <div class="well">
 <div id="chartContainer" style="height: 350px; width: 100%;"> 
</div>

            <button class="btn invisible" id="backButton"></button>
          </div>
        </div>
      </div>
    </div></div>
         
<!--   ends-->

 
<!--    Scripting and functionality of the dropdown button categories-->
    
    <script>  //when the user clicks on drop down buttons
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}


    
window.onclick = function(event) {
	  if (!event.target.matches('.dropbtn')) {

	    var dropdowns = document.getElementsByClassName("dropdown-content");
	    var i;
	    for (i = 0; i < dropdowns.length; i++) {
	      var openDropdown = dropdowns[i];
	      if (openDropdown.classList.contains('show')) {
	        openDropdown.classList.remove('show');
	      }
	    }
	  }
	}
</script>
   
<!--    ends-->
    
            <!-- Date Selection Code Scripting -->
    
<script>
webshim.setOptions('forms', {
    lazyCustomMessages: true,
    addValidators: true
});
webshim.setOptions('forms-ext', {
    replaceUI: 'auto',
    types: 'date',
    date: {
        startView: 2,
        size: 2,
        classes: 'hide-spinbtns'
    }
});

//start polyfilling
webshim.polyfill('forms forms-ext');

//initial max/min attributes should be done serverside.
$(function(){
    $('#date-from, #date-to').prop('min', function(){
        return new Date().toJSON().split('T')[0];
    });
});
    </script>
    
<!--        ends-->
    
    
 <div class="DATE">
 <form action="month" class="ws-validate" method="post">
  <div class="From">From:</div> <div class="To">To:</div>
    <br>
    <div class="form-row">
        <!-- max of the first date equals value of the second --> <!-- mmin of the second date equals value of the first --> 
        
         <input data-dependent-validation='{"from": "date-to", "prop": "max"}' type="date" id="date-from" name="month1" placeholder="from" /> 
        <input data-dependent-validation='{"from": "date-from", "prop": "min"}' type="date" id="date-to" name="month2" placeholder="to" /> 
        
    </div>
	<div class="form-row">
		<input type="submit" />
	</div>
</form>
    </div> 
    
    
     <style>
    #oTable { 
         margin: auto;
        text-align:center;
        table-layout: fixed;
        
        border-spacing: 200px;
    }

    
    
#oTable th{
            text-align: center;
        }
        
        
#oTable th {
      border-spacing: 200px;
     
      padding:2px;
      font-size: 20px;
      color:black;
      border-collapse: collapse;
      font-family:Verdana;
      background:lightgray;
      ;
        }
    
    </style>
    
    
    <table id="oTable">
<tr>
    <th>Credit Limit:&nbsp;
    </th>
    <th>₹50000&nbsp;&nbsp; </th>
    <th>&nbsp;Expense:
    </th>
    <th>₹<%=cc.getTotal() %>&nbsp;&nbsp; </th>
   <!--  <th>Overlimit:
    </th>
    <th> 35000 p/m </th> -->
    </tr>
</table>
   
<!--    ends-->
    
    
    <!--        drop down button html and dropdown list  , this calls the  myFunction() above-->
    <br><br><br>
   
 
 
 <div class="dropdown">
<form action="option" method = "post">
<div class="Cat">BROWSE CATEGORIES</div>
 <select onchange="this.form.submit()" id="option" name="option" class="dropbtn" value="categories">
        
        <option>select a category</option> 
		<option>food</option>
	<option>shopping</option>
	<option>health</option>
	<option>gifts</option>
	<option>entertainment</option>
	<option>travel</option>
	<option>education</option>
	<option>bills</option>
	<option>miscelleneous</option>



</select>

</form>

         
    </div>
 
 
 
 
 

 <br><br><br><br>  

<!--        html for the main table-->

        
        <br><br><br><br>
        
        
        
        <h2 style="text-align:center">EXPENDITURES</h2>
<table style="width:70%" id="myTable"><br>
<tr>
   
    <th>CATEGORY</th> 
    
    <th>TOTAL SPENT</th>
</tr>
    <tr class="d0">
    <td>HEALTH</td>
    <td>₹<%=cc.getHousehold()%></td>
    </tr>
    
    <tr class="d1">
    <td>EDUCATION</td>
    <td>₹<%=cc.getEdu()%></td>
    </tr>
    
    <tr  class="d0">
    <td >GIFTS</td>
    <td>₹<%=cc.getGifts()%></td>
    </tr>

    <tr class="d1">
    <td>TRAVEL</td>
    <td>₹<%=cc.getHolidays()%></td>
    </tr>

    <tr  class="d0">
    <td>FOOD</td>
    <td>₹<%=cc.getFood()%></td>
    </tr>
    
    <tr class="d1">
    <td>SHOPPING</td>
    <td>₹<%=cc.getGrocery()%></td>
    </tr>
    
    <tr  class="d0">
    <td>MISCELLENEOUS</td>
    <td>₹<%=cc.getClothes()%></td>
    </tr>
    
    
    <tr class="d1">
    <td>BILLS</td>
    <td>₹<%=cc.getPetrol()%></td>
    </tr>
    
    
    <tr  class="d0">
    <td>ENTERTAINMENT</td>
    <td>₹<%=cc.getEnt()%></td>
    </tr>
    
</table>

<!--    ends-->

        
<!--        footer html-->
        
        <br><br><br><br><br><br>
<div class="footer">
  <p>SCRUMBLEDORE'S ARMY</p>
</div>

<!--        ends-->
</body>
</html>


<!--end of dashboard-->
        
        

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  

 
