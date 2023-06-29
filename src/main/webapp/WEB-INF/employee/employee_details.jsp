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
                <button data-task-id="${employee_model.idTask}" data-user-id="193" type="submit" class="btn btn-primary complete-button" style="float: left; margin-right: 10px;">Completato</button>

                    <div class="form-group" style="visibility:hidden">
                    <span id="idTask">${employee_model.idTask}</span>
                </div>
                <input type="text" value="${employee_model.idTask}" name="idTask" style="visibility:hidden" />
                <input type="text" value="193" name="idUser" style="visibility:hidden" />
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
    // Aggiungi un gestore di eventi al click del pulsante Completato
    $('.complete-button').click(function() {
      // Ottieni l ID della task dalla data attributo
      var taskId = $(this).data('task-id');
      var userId = $(this).data('user-id');

      // Nascondi il pulsante
      $(this).hide();

      // Memorizza lo stato del pulsante nella sessione
      sessionStorage.setItem('completeButton_' + taskId + '_' + userId, 'true');
    });

    // Verifica lo stato dei pulsanti Completato al caricamento della pagina
    $('.complete-button').each(function() {
      var taskId = $(this).data('task-id');
      var userId = $(this).data('user-id');

      // Controlla se il pulsante è stato premuto per questa task nella sessione
      var isButtonPressed = sessionStorage.getItem('completeButton_' + taskId + '_' + userId);

      // Se il pulsante è stato premuto, nascondilo
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