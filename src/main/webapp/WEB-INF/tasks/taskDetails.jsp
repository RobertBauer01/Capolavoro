<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
   <head>
      <meta charset="utf-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- Boxicons CSS -->
      <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
      <title>Cruscotto HR - task-details</title>
      <link rel="stylesheet" href="/static/css/style.css" type="text/css"/>
      <link rel="icon" href="/static/img/beta80favicon.png" type="image/x-icon">
      <link rel="shortcut icon" href="./img/beta80favicon.png" type="image/x-icon">
      <link href="/static/css/app.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
   </head>
   <!-- navbar -->
   <nav class="navbar">
      <div class="logo_item">
         <i class="bx bx-menu" id="sidebarOpen"></i>
         <button type="button" class="image-button-nav" onclick="goToHomePage()">
         <img src="/static/img/beta80favicon.png" alt="Immagine Bottone"> </i>Home Page
         </button>
      </div>
      <div class="navbar_content" >
         <i class="bi bi-grid"></i>
         <div class="dropdown" style="float:right;">
            <button type="button" class="image-button">
            <img src="/static/img/utente.png.png" alt="Immagine Bottone">
            </button>
            <div class="dropdown-content">
               <a href="#" id="openPopup" ><i class="fas fa-cog"></i>Settings</a>
               <a href="/logout">Logout</a>
               <div id="popup-overlay"></div>
               <div id="popup">
                  <div class="popup-header">
                     <h2>Area Personale</h2>
                     <button id="closePopup">Chiudi</button>
                  </div>
                  <form>
                     <label for="benvenuto">Testo di benvenuto:</label>
                     <input type="text" id="benvenuto" name="benvenuto" placeholder="Inserisci il testo di benvenuto" disabled>
                     <label for="email">Email:</label>
                     <input type="email" id="email" name="email" placeholder="Inserisci la tua email" disabled>
                     <button type="button" id="editButton">Modifica</button>
                     <button type="submit" id="saveButton" style="display: none;">Salva</button>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </nav>
   <!-- End of Topbar -->
   <nav class="sidebar">
      <div class="menu_content">
         <ul class="menu_items">
            <div class="menu_title menu_setting"></div>
            <li class="item">
                <a onclick="goToHomePage()" class="nav_link">
                <span class="navlink_icon">
                <i class="bx bx-home"></i>
                </span>
                <span class="navlink">HomePage</span>
                </a>
            </li>
            <li class="item">
            </li>
            <li class="item">
               <a onclick="goToUsersPage()" class="nav_link">
               <span class="navlink_icon">
               <i class="bx bx-face"></i>
               </span>
               <span class="navlink">Employees</span>
               </a>
            </li>
            <li class="item">
               <a onclick="goToTaskPage()" class="nav_link">
               <span class="navlink_icon">
               <i class="bx bx-layer"></i>
               </span>
               <span class="navlink">Task</span>
               </a>
            </li>
         </ul>
         <!-- Sidebar Open / Close -->
         <div class="bottom_content">
            <div class="bottom expand_sidebar">
               <span> Expand </span>
               <i class='bx bx-log-in' ></i>
            </div>
            <div class="bottom collapse_sidebar">
               <span> Reduce </span>
               <i class='bx bx-log-out'></i>
            </div>
         </div>
      </div>
   </nav>
   <br>
   <div class="container-fluid">
   <div class="row">
   <div class="col-md-3"></div>
   <!-- Spazio a sinistra -->
   <div class="col-md-6">
   <!-- Contenitore del modulo -->
   <h1 class="color-employee">Edit task</h1>
   <form class="form" action="task" method="post">
      <div class="form-group">
         <label for="idTask">ID</label>
         <input id="id" type="text" name="idTask" class="form-control id_record" value="${task_model.idTask}" disabled>
      </div>
      ${error}
      <div class="form-group">
         <label for="title">Title</label>
         <input id="title" type="text" name="title" class="form-control" value="${task_model.title}" disabled>
      </div>
      <div class="form-group">
         <label for="description">Description</label>
         <input id="description" type="text" name="description" class="form-control" value="${task_model.description}" disabled>
      </div>
      <div class=form"form-group">
         <label for="link">Link</label>
         <input id="link" type="text" name="link" class="form-control" value="${task_model.link}" disabled>
      </div>
      <div class ="form-group">
         <label for="orderCol">Priority</label>
         <input id="orderCol" type="number" min="1" max="100" name="orderCol" class="form-control" value="${task_model.orderCol}" disabled>
      </div>
      <div class="form-group">
         <label for="status">Status</label>
         <div>
            <select id="status" onchange="gestisciSelezione()" disabled>
               <option value="1">Active</option>
               <option value="0">Disabled</option>
            </select>
         </div>
      </div>
      <br>
      <a id="edit_btn" class="btn btn-primary" href="#"><i class="fa fa-edit"></i> Edit</a>
      <a id="put_btn" class="btn btn-primary hidden" href="#">Submit</a>
      <a id="cancel_btn" class="btn btn-primary hidden" href="#">Cancel</a>
      <button type="button" class="btn btn-primary" onclick="goToTaskPage()" style="float: right;">Back</button>
   </form>
   <div class="col-md-3"></div>
   <!-- Spazio a destra -->
   </body>
   <!-- SYSTEM JS -->
   <script src="/static/js/jquery-3.2.1.min.js"></script>
   <script src="/static/js/popper.min.js" ></script>
   <script src="/static/js/bootstrap.min.js" ></script>
   <script src="/static/js/sb-admin-2.min.js" ></script>
   <script src="/static/js/app/app_utils.js"></script>
   <!-- Page JS -->
   <script src="/static/js/app/script/script.js"></script>
   <script>
      var doPutUrl = "/task";
      function enableEdit(e){
          e.preventDefault();
          $('#cancel_btn').removeClass("hidden");
          $('#put_btn').removeClass("hidden");

          $(this).addClass('hidden');
          $("#title").prop('disabled', false);
          $("#description").prop('disabled', false);
          $("#status").prop('disabled', false);
          $("#link").prop('disabled', false);
          $("#status").prop('disabled', false);
          $("#orderCol").prop('disabled', false);

      }
      function disableEdit(e){
          e.preventDefault();
          $('#edit_btn').removeClass("hidden");
          $(this).addClass('hidden');
          $('#put_btn').addClass("hidden");
          $("#title").prop('disabled', true);
          $("#description").prop('disabled', true);
          $("#link").prop('disabled', true);
          $("#status").prop('disabled', true);
          $("#orderCol").prop('disabled', true);
      }

      function onClickPut(evt){
          var _btnId = $('#id').val();
          var real_url = doPutUrl + "?idTask=" + _btnId;
          spinner_on();
          var data = {
              title: $("#title").val().trim(),
              description: $("#description").val().trim(),
              link: $("#link").val(),
              status: $("#status").val(),
              orderCol: $("#orderCol").val().trim()
          }
          if(data.title == "") {
            window.alert("titolo mancante");
            return;
          } else if(data.description == "") {
            window.alert("descrizione mancante");
            return;
          } else if(data.orderCol == "") {
            window.alert("livello di priorità mancante");
            return;
          }
          doPut(data, real_url,
              function(s){
                  console.log(s);
                  console.log("done");
                  location.reload()
              },
              function(err){
                  console.log(err);
                  console.log("fail");
                  location.reload()
              });
      }
      $( document ).ready(function() {
          $("#edit_btn").on("click", enableEdit);
          $("title").prop("disabled", false);
          $("#title").prop("required", true);
          $("#cancel_btn").on("click", disableEdit);
          $("#put_btn").on("click", onClickPut);



          valoreStatus();

          console.log( "ready!" );
      });
   </script>
   <script>
      function gestisciSelezione() {
        var valoreSelezionato = document.getElementById("status").value;
        console.log("Valore selezionato: " + valoreSelezionato);
      }
      function valoreStatus() {
        document.getElementById("status").value = ${task_model.status};
      }
   </script>
   <script src="/static/js/app/script/script.js"></script>
   <script>
      function toggleDropdown() {
          var dropdownContent = document.getElementById("myDropdown");
          if (dropdownContent.style.display === "none") {
              dropdownContent.style.display = "block";
          } else {
              dropdownContent.style.display = "none";
          }
      }
   </script>
   <script>
      function goToUsersPage() {
          window.location.href = '/users';
      }
   </script>
   <script>
      function goToTaskPage() {
          window.location.href = '/task';
      }
   </script>
   <script>
        function goToHomePage() {
            window.location.href = '/hpHR';
        }
    </script>
   <script>
      document.getElementById('openPopup').addEventListener('click', function(e) {
        e.preventDefault();
        document.getElementById('popup-overlay').style.display = 'block';
        document.getElementById('popup').style.display = 'block';
      });

      document.getElementById('closePopup').addEventListener('click', function() {
        closePopup();
      });

      document.getElementById('editButton').addEventListener('click', function() {
        document.getElementById('benvenuto').disabled = false;
        document.getElementById('email').disabled = false;
        document.getElementById('editButton').style.display = 'none';
        document.getElementById('saveButton').style.display = 'inline-block';
      });

      document.getElementById('saveButton').addEventListener('click', function() {
        // Effettua qui le operazioni di salvataggio dei dati
        document.getElementById('benvenuto').disabled = true;
        document.getElementById('email').disabled = true;
        document.getElementById('editButton').style.display = 'inline-block';
        document.getElementById('saveButton').style.display = 'none';
      });

      function closePopup() {
        document.getElementById('popup-overlay').style.display = 'none';
        document.getElementById('popup').style.display = 'none';
      }

      document.getElementById('cancel_btn').addEventListener('click', function() {
      document.getElementById('addEmployeeForm').style.display = 'none';
      document.getElementById("addEmployeeButton").style.display = "block";
      });

   </script>
   <script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous">
   </script>
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
   <script>
      function validateRole(input) {
        if (input.value !== "0" && input.value !== "1") {
          input.value = ""; // Reset il valore dell'input se non è 0 o 1
        }
      }
   </script>
</html>