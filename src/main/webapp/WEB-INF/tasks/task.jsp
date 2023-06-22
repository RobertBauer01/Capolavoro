<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<<<<<<< Updated upstream
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">
            <title>TASK PAGE!</title>
            <link href="/static/css/bootstrap.min.css" rel="stylesheet">
            <link href="/static/css/all.css" rel="stylesheet" type="text/css">
               <link
                    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                    rel="stylesheet">
            <link href="/static/css/sb-admin-2.min.css" rel="stylesheet">
            <link href="/static/css/app.css" rel="stylesheet">
=======
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
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
>>>>>>> Stashed changes


        </head>
        <body id="page-top">
            <div id="wrapper">

                <!-- Sidebar -->
                <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                    <!-- Sidebar - Brand -->
                    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                        <div class="sidebar-brand-icon rotate-n-15">
                            <i class="fas fa-laugh-wink"></i>
                        </div>
                        <div class="sidebar-brand-text mx-3">HR PORTAL</div>
                    </a>


<<<<<<< Updated upstream
                    <!-- Nav Item - Dashboard -->
                    <li class="nav-item">
                        <a class="nav-link" href="/hello">
                            <i class="fas fa-fw fa-tachometer-alt"></i>
                            <span>Test Module page</span></a>
                    </li>

                </ul>
                <!-- End of Sidebar -->

                <!-- Content Wrapper -->
                <div id="content-wrapper" class="d-flex flex-column">
=======
          <div id="popup">
            <div class="popup-header">
              <h2>Area Personale</h2>
              <button id="closePopup">Chiudi</button>
            </div>
                    <form id="myForm">
                      <label for="benvenuto">Testo di benvenuto:</label>
                      <textarea id="benvenuto" name="benvenuto" placeholder="Inserisci il testo di benvenuto" disabled></textarea>

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
>>>>>>> Stashed changes

                    <!-- Main Content -->
                    <div id="content">

                        <!-- Topbar -->
                        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                            <h4>Task List</h4>
                            <!-- Sidebar Toggle (Topbar) -->
                            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                <i class="fa fa-bars"></i>
                            </button>


                            <!-- Topbar Navbar -->
                            <ul class="navbar-nav ml-auto">

                                <!-- Nav Item - User Information -->
                                <li class="nav-item dropdown no-arrow">
                                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                    </a>
                                    <!-- Dropdown - User Information -->
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                        aria-labelledby="userDropdown">
                                        <a class="dropdown-item" href="#">
                                            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                            Profile
                                        </a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                            Logout
                                        </a>
                                    </div>
                                </li>

                            </ul>

                        </nav>
                        <!-- End of Topbar -->

                        <!-- Begin Page Content -->
                        <div class="container-fluid">
                            <div class="row">
                                <form class="form" action="task" method="post">
                                    <div class="form-group">
                                        <label for="title">Title</label>
                                        <input id="title" type="text" name="title" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="description">Description</label>
                                        <input id="description" type="text" name="description" class="form-control">
                                    </div>
                                    <div>
                                        <label for="imgSrc">Image</label>
                                        <input id="imgSrc" type="text" name="imgSrc" class="form-control">
                                    </div>
                                    <div>
                                        <label for="link">Link</label>
                                        <input id="link" type="text" name="link" class="form-control">
                                    </div>
                                    <label for="status">Status</label>
                                     <div>
                                        <select id="status" onchange="gestisciSelezione()" >
                                            <option value="1">Attivo 1</option>
                                            <option value="0">Disattivo 2</option>
                                        </select>
                                     </div>

                                    <div>
                                        <label for="orderCol">Priority Level</label>
                                        <input id="orderCol" type="text" name="orderCol" class="form-control">
                                    </div>
                                    <div>
                                    <button id="post_btn" type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                            <div class="row">
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
                                                <td>${task.imageSrc}</td>
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
                                                    <i class="fa fa-eye"></i> Details</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                        <!-- /.container-fluid -->

                    </div>
                    <!-- End of Main Content -->

                    <!-- Footer -->
                    <footer class="sticky-footer bg-white">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto">
                                <span>Copyright &copy; Beta80 Group</span>
                            </div>
                        </div>
                    </footer>
                    <!-- End of Footer -->

                </div>
                <!-- End of Content Wrapper -->

            </div>
            <div class="SPINNER_HOLDER hidden">
                <div class="SPINNER">
                </div>
            </div>
        </body>
        <!-- SYSTEM JS -->
        <script src="/static/js/jquery-3.2.1.min.js"></script>
        <script src="/static/js/popper.min.js" ></script>
        <script src="/static/js/bootstrap.min.js" ></script>
        <script src="/static/js/sb-admin-2.min.js" ></script>
        <script src="/static/js/app/app_utils.js"></script>

        <!-- Page JS -->
        <script src="/static/js/app/hello/hello.js"></script>


        <script>
            var doPostUrl = "/task";
            function onClickPost(evt){
                spinner_on();
                var data = {
                title: $("#title").val(),
                description: $("#description").val(),
                imgSrc: $("imgSrc").val();
                link: $("#link").val(),
                status: $("#status").val(),
                orderCol: $("#orderCol").val()

<<<<<<< Updated upstream
                }
                doPost(data, doPostUrl,
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
                $("#post_btn").on("click", onClickDelete);
                console.log( "ready!" );
            });
        </script>
            <script>
                    function gestisciSelezione() {
                      var valoreSelezionato = document.getElementById("status").value;
                      console.log("Valore selezionato: " + valoreSelezionato);
                    }
                  </script>
</html>
=======
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
<script>
  const form = document.getElementById("myForm");
  const benvenutoField = document.getElementById("benvenuto");
  const emailField = document.getElementById("email");
  const editButton = document.getElementById("editButton");
  const saveButton = document.getElementById("saveButton");

  editButton.addEventListener("click", function() {
    benvenutoField.removeAttribute("disabled");
    emailField.removeAttribute("disabled");
    editButton.style.display = "none";
    saveButton.style.display = "inline";
  });

  form.addEventListener("submit", function(event) {
    event.preventDefault(); // Prevent form submission

    // Here you can perform the necessary actions to save the form data
    // For this example, we'll just log the values to the console
    console.log("Testo di benvenuto:", benvenutoField.value);
    console.log("Email:", emailField.value);

    // Disable the fields and switch the buttons back
    benvenutoField.setAttribute("disabled", "disabled");
    emailField.setAttribute("disabled", "disabled");
    editButton.style.display = "inline";
    saveButton.style.display = "none";
  });
</script>
</body>
</html>
>>>>>>> Stashed changes
