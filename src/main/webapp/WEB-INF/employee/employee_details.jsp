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
      <title>Cruscotto dipendenti - employee-details</title>
      <link rel="stylesheet" href="/static/css/style.css" type="text/css"/>
      <link rel="icon" href="/static/img/beta80favicon.png" type="image/x-icon">
      <link rel="shortcut icon" href="./img/beta80favicon.png" type="image/x-icon">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
   </head>
   <!-- navbar -->
   <nav class="navbar">
      <div class="logo_item">
         <i class="bx bx-menu" id="sidebarOpen"></i>
         <button type="button" class="image-button-nav" onclick="goToEmployeePage()">
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
                <a href="/logout">Logout</a>
            </div>
         </div>
      </div>
   </nav>
   <!-- End of Topbar -->

   </nav>
   <br>
   <div class="container-fluid">
   <div class="row">
   <div class="col-md-3"></div>
   <!-- Spazio a sinistra -->
   <div class="col-md-6">
   <!-- Contenitore del modulo -->
   <h1 class="color-employee center-label">Details task</h1>
   <br>
   <form class="form" method="post">
      ${error}
      <div class="form-group">
         <label for="title"><b><big>${employee_model.title}</big></b></label>
      </div>
      <br>
      <div class="form-group">
         <label for="status">Completion Date: ${employee_model.data}</label>
      </div>
      <br>
      <div class="form-group">
         <label for="description" >${employee_model.description}</label>
      </div>
      <br>
      <div class=form"form-group">
         <a href="${employee_model.link}" for="link">${employee_model.link}</label>
      </div>
      <br>

      <a id="back_btn" class="btn btn-primary" onclick="goToEmployeePage()" style="float: right;">Back</a>
   </form>

    <form class="form" action="/employee" method="post">
         <button data-task-id="${employee_model.idTask}" data-user-id="${employee_model.idUser}" type="submit" class="btn btn-primary complete-button" style="float: left; margin-right: 10px;">Complete</button>

         <div class="form-group" style="visibility:hidden">
            <span id="idTask">${employee_model.idTask}</span>
         </div>
         <input type="text" value="${employee_model.idTask}" name="idTask" style="visibility:hidden" />
         <input type="text" value="${employee_model.idUser}" name="idUser" style="visibility:hidden" />
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
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

<script>
         $(document).ready(function() {
            $('.complete-button').click(function(e) {
               e.preventDefault(); // Previeni il comportamento predefinito del submit

               var taskId = $(this).data('task-id');
               var userId = $(this).data('user-id');

               // Mostra il popup di conferma
               if (confirm('Sei sicuro di voler completare questa attività?')) {
                  $(this).hide();

                  // Memorizza lo stato del pulsante nel localStorage
                  localStorage.setItem('completeButton_' + taskId + '_' + userId, 'true');

                  // Effettua la submit del modulo
                  $(this).closest('form').submit();
               }
            });

            $('.complete-button').each(function() {
               var taskId = $(this).data('task-id');
               var userId = $(this).data('user-id');
               var isButtonPressed = localStorage.getItem('completeButton_' + taskId + '_' + userId);

               if (isButtonPressed) {
                  $(this).hide();
               }
            });
         });
      </script>


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
      function goToEmployeePage() {
          window.location.href = '/employee';
      }
   </script>

   </script>
   <script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous">
   </script>
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
</html>