<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.manipal.bean.credit"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
   <script src="http://code.highcharts.com/highcharts.js"></script>
   <script src="https://code.highcharts.com/highcharts-3d.js"></script>   
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
   
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category Wise Expenditure </title>
<%
  response.addHeader("Pragma", "no-cache");
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.addHeader("Cache-Control", "pre-check=0, post-check=0");
  response.setDateHeader("Expires", 0);
%>

 <style type="text/css">
 
 html, body {
    margin: 0;
    padding: 0;
}
        
        table { width:800px;
        margin: auto;
        text-align:center;
        table-layout: fixed;
      
    
  }
  
        
        
        table, th{
      
      border-collapse: collapse;
      padding:auto;
      font-size: 18px;
      color:white;
      border: 1px solid #080808;
      border-collapse: collapse;
      font-family:Arial;
      background: linear-gradient(top, #3c3c3c 0%, #222222 100%);
      background:-webkit-linear-gradient(top, #3c3c3c 0%, #222222 100%);
        }
  
        
        
        td, tr {
      
      border-collapse: collapse;
      padding:auto;
      font-size: 18px;
      color:dimgray;
      border: 1px solid #080808;
      border-collapse: collapse;
      font-family:Arial;
     
        }
  
        
        
        tr:nth-child(even) {background-color:  #e9edef;}   
        tr:nth-child(odd) {background-color:  #dee4e6;}
        

      
.hrbr{
    background-image: linear-gradient(to right, #2980B9,#27AE60,#F4F6F7);
    width: 100%;
    height: 6px;
    margin-top: 1%
  }
   
        
 .DATE{
        position:absolute;
        left:425px;
        bottom: -150px;
        
    }
        
        
        
        .From{
        position: absolute;
        left:20px;
    }
    
         
    .To{
         position: absolute;
        right:235px;
    }
    
        
        
        
.footer {
    padding: -5px;
    position: relative;
    left: 0;
    bottom: -200px
    //margin-top: 20%;
    width: 100%;
    background:#2980B9;
    color: white;
    text-align: center;
     height: 40px; 
}
        
        
            
.myButton {
    padding: 10px;
    border-radius: 12px;
    background-color: grey;
    color: black;
    text-align:center;
    position: relative;
    bottom: -20px;
    left: 1250px;
    transition-duration: 0.4s;
   
}
     
        
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
    border: 1px solid #000;
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

        
     
     .myButton:hover{
         
         background-color: lawngreen; 
     }
     
     .mybutton1:hover{
         
         background-color: lawngreen; 
     }
     
     .mybutton2:hover{
         
         background-color: lawngreen; 
     }
     
     
     
     
     
     
.show {display: block;}


  .BN {
            position:absolute;
            right:80px;
    border: none;
    background-color: white;
    padding: 14px 28px;
    font-size: 16px;
    cursor: pointer;
    display: inline-block;
}

        
        
        
        .btn {
             position:absolute;
            right:80px;
            
    border: none;
    background-color: darkgray;
    padding: 14px 28px;
    font-size: 16px;
    cursor: pointer;
    display: inline-block;
}

.btn:hover {background: darkturquoise;}

  
 </style>
 
</head>

<body>
 <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js">
</script>
          <div class="container-fluid">
  <div class="row" style="">
    <br>
      <div class="col-sm-12 navbar">
        <div class= "navbar navbar-header">
            <a class = "navbar-brand" href="#"></a>
        </div>
          
   
      
            <ul class="nav nav-pills" style="margin-left: 80%" style="margin-top: -5%">
              <li><a href="https://www.sc.com/in/about-us/">About</a></li>
              
                            
                
              <li style="position: right; margin-left:10px"><a href="http://localhost:8585/creditanalysis/index.html">Logout</a></li>
              <li class="pull-right"><img src="https://seeklogo.com/images/S/Standard_Chartered_Bank-logo-1D387B302A-seeklogo.com.png" class="img-rounded" alt="SCB" height="40px" width="95px" style= "margin-top: 5% "></li>
              </ul><br>
      </div>
     
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
      <br><br><br> 
    <div class = "hrbr"></div>
    
              </div>
    </div>

   <div id="container" style="width: 600px; height: 500px; margin: 0 auto"></div>

<script language="JavaScript">
$(function () {
    var chart = new Highcharts.Chart({
        chart: {
            renderTo: 'container',
            type: 'column',
            options3d: {
                enabled: true,
                alpha: 4,
                beta: 0,
                depth: 20,
                viewDistance: 40
            }
        },
        xAxis: {

        	 title: {
                 text: 'MONTH'
             },
            
            categories: ['JAN', 'FEB', 'MAR','APR', 'MAY', 'JUN','JUL', 'AUG', 'SEP','OCT', 'NOV', 'DEC',]
        },

        yAxis: {
            title: {
                text: 'EXPENDITURE'
            }
        },
        
        title: {
            text: 'TRANSACTION DETAILS'
        },
        subtitle: {
            text: 'SPEND ANALYSIS OF THIS YEAR'
        },
        plotOptions: {
            column: {
                depth: 25
            }
        },
        series: [{
            data: [${arr[0]},${arr[1]},${arr[2]},${arr[3]},${arr[4]},${arr[5]},${arr[6]},${arr[7]},${arr[8]},${arr[9]},${arr[10]},${arr[11]}]
        }]
    });
    
    function showValues() {
        $('#alpha-value').html(chart.options.chart.options3d.alpha);
        $('#beta-value').html(chart.options.chart.options3d.beta);
        $('#depth-value').html(chart.options.chart.options3d.depth);
    }
    $('#sliders input').on('input change', function () {
        chart.options.chart.options3d[this.id] = this.value;
      //  showValues();
        chart.redraw(false);
    });
    showValues();
});
</script>

 <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js">
</script>
        
    
    
    
<div>
  <header>
      <h1 style="color:white"></h1>
  </header>
</div>
    
    
   
   <div class="DATE">
<form action="catmonth" class="ws-validate" method="post">
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
    


<br><br><br><br><br><br><br><br><br><br>
<table style="width:70%"><br>


<!-- <table border="ll"> -->
<tr>

<!-- <th>card</th> -->
<th>CATEGORY</th>
<th>AMOUNT SPENT</th>
<th>TRANSACTION DATE</th>
<%String disp="";%>


</tr>
<%
	List<credit> record = (List<credit>)request.getAttribute("data");
Iterator<credit> lit = record.iterator();
while(lit.hasNext())
{
	credit cc = lit.next();
        disp=cc.getCategory();
%>
<tr>


<%-- <td><%=cc.getCno()%></td> --%>
<td><%=cc.getCategory()%></td>
<td>₹<%=cc.getAmount()%></td>
<td><%=cc.getTime() %>

<%
}
%>


</table>



<br><br><br> 
<form class="BN" action="back" method="post" >
<input class="btn"  type="submit"  value="back">
</form> 
   <br><br><br><br>   <br><br><br><br> 
<div class="footer">
  <p>SCRUMBLEDORE'S ARMY</p>
</div>

</body>
</html>