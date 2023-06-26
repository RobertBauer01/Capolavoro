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
         <button type="button" class="image-button-nav" onclick="goToHomePage()">
         <img src="/static/img/beta80favicon.png" alt="Immagine Bottone"> </i>Home Page
         </button>
      </div>
      <div class="navbar_content" >
         <i class="bi bi-grid"></i>
         <i class='bx bx-sun' id="darkLight"></i>
         <div class="dropdown" style="float:right;">
            <button type="button" class="image-button">
            <img src="/static/img/utente.png.png" alt="Immagine Bottone">
            </button>
            <div class="dropdown-content">
               <a href="#" id="openPopup">Apri Area Personale</a>
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
               <a href="https://www.facebook.com">Facebook</a>
               <a href="https://www.youtube.com">YouTube</a>
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
   <h1 class="color-employee">Edit task</h1>
   <form class="form" action="task" method="post">
      ${error}
      <div class="form-group">
         <label for="title">Title</label>
         <input id="title" type="text" name="title" class="form-control" value="${employee_model.title}" disabled>
      </div>
      <div class="form-group">
         <label for="description">Description</label>
         <input id="description" type="text" name="description" class="form-control" value="${employee_model.description}" disabled>
      </div>
      <div class=form"form-group">
         <label for="link">Link</label>
         <input id="link" type="text" name="link" class="form-control" value="${employee_model.link}" disabled>
      </div>
      <div class ="form-group">
         <label for="imageSrc">Image</label>
         <input id="imageSrc" type="text" name="imageSrc" class="form-control" value="${employee_model.imageSrc}" disabled>
      </div>
     <div class="form-group">
          <label for="status">Stato</label>
          <div>
             <select id="status" name="status" onchange="gestisciSelezione()" disabled>
                <option value="0">Da fare</option>
                <option value="1">Completato</option>
             </select>
          </div>
       </div>
      <br>
      <button type="submit" class="btn btn-primary" onclick="updateStatusToCompleted()" style="float: right; margin-right: 10px;">Completato</button>
      <a id"back_btn" class="btn btn-primary" onclick="goToEmployeePage()" style="float: right;">Back</a>

   </form>
   <div class="col-md-3"></div>
   <!-- Spazio a destra -->
   </body>
   <!-- SYSTEM JS -->
   <script>
      function updateStatusToCompleted() {
         document.getElementById("status").value = "1"; // Imposta il valore dello stato a "Completato"
      }
   </script>
   <script src="/static/js/jquery-3.2.1.min.js"></script>
   <script src="/static/js/popper.min.js" ></script>
   <script src="/static/js/bootstrap.min.js" ></script>
   <script src="/static/js/sb-admin-2.min.js" ></script>
   <script src="/static/js/app/app_utils.js"></script>
   <!-- Page JS -->
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
         function gestisciSelezione() {
           var valoreSelezionato = document.getElementById("status").value;
           console.log("Valore selezionato: " + valoreSelezionato);
         }
         function valoreStatus() {
           document.getElementById("status").value = ${task_model.status};
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