<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Boxicons CSS -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="/static/css/app.css" rel="stylesheet">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/static/css/style.css" type="text/css"/>
    <link rel="icon" href="/static/img/beta80favicon.png" type="image/x-icon">
    <link rel="shortcut icon" href="./img/beta80favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<!-- navbar -->
  <nav class="navbar">
    <div class="logo_item">
      <i class="bx bx-menu" id="sidebarOpen"></i>
      <button type="button" class="image-button-nav" onclick="gotToHomePage()">
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
        </div>
      </div>
    </div>
  </nav>

<!-- sidebar -->
<nav class="sidebar">
    <div class="menu_content">

        <ul class="menu_items">
            <div class="menu_title menu_setting"></div>
            <li class="item">
            </li>
            <li class="item">
                              <a onclick="goToHomePage()" class="nav_link">
                                  <span class="navlink_icon">
                                    <i class="bx bx-home"></i>
                                  </span>
                                <span class="navlink">HomePage</span>
                              </a>
                            </li>
            <li class="item">
                <a onclick="goToUsersPage()" class="nav_link">
                  <span class="navlink_icon">
                    <i class="bx bx-face"></i>
                  </span>
                    <span class="navlink">Dipendenti</span>
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
                <span> Espandi </span>
                <i class='bx bx-log-in' ></i>
            </div>
            <div class="bottom collapse_sidebar">
                <span> Riduci </span>
                <i class='bx bx-log-out'></i>
            </div>
        </div>
    </div>
</nav>

<!-- content -->
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3 sidebar-col">
                <!-- Sidebar content -->
            </div>
            <div class="col-md-9">
                <h1 class="color-employee">Lista task <button id="addEmployeeButton" class="btn btn-primary" style="float: right;">+</button></h1>
                <div class="row">
                <br>
                    <div class="col-md-12">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>
                                        ID
                                    </th>
                                    <th>
                                        TITLE
                                    </th>
                                    <th>
                                        DESCRIPTION
                                    </th>
                                    <th>
                                        IMAGE
                                    </th>
                                    <th>
                                        LINK
                                    </th>
                                    <th>
                                        STATUS
                                    </th>
                                    <th>
                                        ACTIONS
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${task_list}" var="task">
                                    <tr>
                                        <td>${task.idTask}</td>
                                        <td>${task.title}</td>
                                        <td>${task.description}</td>
                                        <td> <img src="/static/img/x.png"> </td>
                                        <td>${task.link}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${task.status == 1}">
                                                    Attivo
                                                </c:when>
                                                <c:when test="${task.status == 0}">
                                                    Disattivo
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a class="btn btn-primary" href="/task/${task.idTask}">
                                                <i class="fa fa-eye"></i> Details
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div id="addEmployeeForm" style="display: none;">

                                    <form class="form" action="task" method="post" onsubmit="return validateForm()">
                                                <div class="form-group"><h2 class="color-employee">Aggiunta Task</h2>
                                                <br>
                                                    <label for="title">Title</label>
                                                    <input id="title" type="text" name="title" class="form-control" required>
                                                </div>
                                                <div class="form-group">
                                                     <label for="description">Description</label>
                                                     <input id="description" type="text" name="description" class="form-control" required>
                                                </div>
                                                <div>
                                                     <label for="imgSrc">Image</label>
                                                     <input id="imgSrc" type="text" name="imgSrc" class="form-control">
                                                </div>
                                                <div>
                                                      <label for="link">Link</label>
                                                      <input id="link" type="text" name="link" class="form-control">
                                                </div>
                                                <div>
                                                      <label for="orderCol">Priority Level</label>
                                                      <input id="orderCol2" type="number" min="1" max="100" name="orderCol" class="form-control" required>
                                                      <label for="status">Status</label>
                                                </div>
                                                <div>
                                                <select id="status" onchange="gestisciSelezione()" name="status">
                                                      <option value="1">Attivo</option>
                                                      <option value="0">Disattivo</option>
                                                </select>
                                                </div>
                                                <br>
                                                <div>
                                                     <button id="post_btn" type="submit" class="btn btn-primary">Submit</button>
                                                     <button type="button" class="btn btn-primary" onclick="goToTaskPage()" style="float: right;">Back</button>
                                                </div>
                                            </section>

<!-- SYSTEM JS -->
<script src="/static/js/jquery-3.2.1.min.js"></script>
<script src="/static/js/popper.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/sb-admin-2.min.js"></script>
<script src="/static/js/app/app_utils.js"></script>

<!-- Page JS -->
<script src="/static/js/app/hello/hello.js"></script>
<script>
    function gestisciSelezione() {
        var valoreSelezionato = document.getElementById("status").value;
        console.log("Valore selezionato: " + valoreSelezionato);
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
    function goToTaskPage() {
        window.location.href = '/task';
    }
</script>
<script>
    function goToUsersPage() {
        window.location.href = '/users';
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

    document.getElementById('cancelButton').addEventListener('click', function() {
        document.getElementById('addEmployeeForm').style.display = 'none';
        document.getElementById("addEmployeeButton").style.display = "block";
    });

</script>
<script>
    function openPopup() {
        document.getElementById("popup").style.display = "block";
    }

    function closePopup() {
      document.getElementById('popup-overlay').style.display = 'none';
      document.getElementById("popup").style.display = "none";
    }
     document.getElementById("addEmployeeButton").addEventListener("click", function () {
                document.getElementById("addEmployeeForm").style.display = "block";
        });

</script>
<script>
  function validateForm() {
    // Ottieni i valori dei campi di input
    var title = document.getElementById("title").value.trim();
    var description = document.getElementById("description").value.trim();

    // Verifica se i campi sono vuoti o stringhe vuote
    if (title === "" || description === "") {
      // Mostra il messaggio di errore
      alert("I campi Title e Description sono obbligatori.");
      return false; // Impedisce l'invio del modulo
    }

    // Se la validazione ha successo, il modulo può essere inviato
    return true;
  }
</script>
</body>
</html>
