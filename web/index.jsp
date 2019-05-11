<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
<head>
  <title>message board</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<script>
    function upload() {

        var data;
        data = document.getElementById("newpost").value;

        document.getElementById("newpost").value= "";

        loadPage("POST", "http://localhost:8080/board?DATA=" + data);

    }


    function upload2() {

        var data;
        data = document.getElementById("newboard").value;

        document.getElementById("newboard").value= "";

        loadPage3("POST", "http://localhost:8080/menue?DATA=" + data);

    }


    function refresh() {
        loadPage("GET", "http://localhost:8080/board");
        setTimeout('refresh()',3);


    }

    function refresh2() {
        document.getElementById("posts").value = "HAHAHHA";
        loadPage2("GET", "http://localhost:8080/menue");
    }





    function loadPage(Method, URL) {

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("posts").value = this.responseText;
            }
        };
        xhttp.open(Method, URL, true);
        xhttp.send();
    }


    function loadPage2(Method, URL) {

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("boards").innerHTML = this.responseText;
            }
        };
        xhttp.open(Method, URL, true);
        xhttp.send();
    }

    function loadPage3(Method, URL) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("boards").innerHTML = this.responseText;
            }
        };
        xhttp.open(Method, URL, true);

        xhttp.send();
    }

</script>
<textarea id="newpost" cols="30" rows="10">  </textarea>
<button onclick="upload()"> POST  </button>
<p></p>
<textarea id="posts" cols="50" rows="10">  </textarea>
<button onclick="refresh()"> REFRESH </button>
<HR>
<select id="boards">  </select>
<button onclick="refresh2()"> REFRESH 2 </button>
<BR>
<textarea id="newboard" cols="30" rows="1">  </textarea>
<button onclick="upload2()"> POST  </button>
</body>
</html>
