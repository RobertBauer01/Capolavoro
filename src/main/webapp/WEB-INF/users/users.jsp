<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Boxicons CSS -->

    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
    <title>Cruscotto HR - users</title>
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

                <a href="#" id="openPopup" ><i class="fas fa-cog"></i>Impostazioni</a>
                <a href="/logout">Logout</a>
                <div id="popup-overlay"></div>

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
                <h1 class="color-employee">Lista Dipendenti <button id="addEmployeeButton" class="btn btn-primary" style="float: right;">+</button></h1>
            <br>
                                            <div class="row">
                                                <div class="col-md-12">
                        <table class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>
                                                                            ID
                                                                        </th>
                                                                        <th>
                                                                            USERNAME
                                                                        </th>

                                                                        <th>
                                                                            ROLE
                                                                        </th>
                                                                        <th>
                                                                            NAME
                                                                        </th>
                                                                        <th>
                                                                            SURNAME
                                                                        </th>
                                                                        <th>
                                                                            DATE
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
                                            <c:forEach items="${users_list}" var="user_model">
                                                <tr>
                                                    <td>${user_model.idUser}</td>
                                                    <td>${user_model.username}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${user_model.rl == 1}">
                                                                DIPENDENTE
                                                            </c:when>
                                                            <c:when test="${user_model.rl == 0}">
                                                                HR
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td>${user_model.name}</td>
                                                    <td>${user_model.surname}</td>
                                                    <td>${user_model.dt}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test ="${user_model.totTaskDone == 0}">
                                                                <span style="color: red;">Added</span>
                                                            </c:when>
                                                            <c:when test="${user_model.totTaskDone != user_model.totTask }">
                                                                <span style="color: orange;">On going</span>
                                                            </c:when>
                                                            <c:when test="${user_model.totTask == user_model.totTaskDone}">
                                                                <span style="color: green;">Terminated</span>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>

                                                    <td>
                                                        <a id="${user_model.idUser}" class="btn btn-primary delete_button" href=""><i class="fa fa-trash"></i> Delete</a>
                                                        <a class="btn btn-primary" href="/users/${user_model.idUser}"><i class="fa fa-eye"></i> Details</a>
                                                        <c:if test = "${user_model.rl == 1}">
                                                            <a class="btn btn-primary" href="/user_task_details/${user_model.idUser}"><i class "fa fa-eye">👁</i> </a>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                    </tbody>
                              </table>
                           </div>
                           </div>

              <div id="addEmployeeForm" style="display: none;">
                  <h2>Aggiungi Dipendente</h2>
                      <form class="form" action="users" method="post">
                          <div class="form-group">
                          <label for="username">Username</label>
                          <input id="username" type="text" name="username" class="form-control" required>
                          </div>
                          <div class="form-group">
                          <label for="password">Password</label>
                          <input id="password" type="password" name="password" class="form-control" required>
                          </div>
                         <div class="form-group">
                           <label for="rl">Role</label>
                           <input id="rl" type="text" name="rl" class="form-control" oninput="validateRole(this)">
                         </div>
                          <div class="form-group">
                          <label for="name">Name</label>
                          <input id="name" type="text" name="name" class="form-control" required>
                          </div>
                          <div class="form-group">
                          <label for="surname">Surname</label>
                          <input id="surname" type="text" name="surname" class="form-control" required>
                          </div>
                          <div class="form-group">
                          <label for="dt">Date</label>
                          <input id="dt" type="date" name="dt" class="form-control" disabled>
                          </div>
                          <br>
                          <button type="submit" class="btn btn-primary">Submit</button>
                          <button type="button" id="cancelButton" class="btn btn-primary">Cancel</button>
                      </form>
                  </div>
              </div>
        </div>
    </div>
</section>

<!-- JavaScript -->
<script src="/static/js/app/script/script.js"></script>
<script>
        var currentDate = new Date();

        var employeeGridContainer = document.getElementById("employee-grid");

            function addEmployee(event) {
        event.preventDefault();

        var name = document.getElementById("nameInput").value;
        var surname = document.getElementById("surnameInput").value;
        var username = document.getElementById("usernameInput").value;
        var insertDate = document.getElementById("dateInput").value;

        var newEmployee = {
            name: name,
            surname: surname,
            username: username,
            insertDate: insertDate
        };

        employeeData.push(newEmployee);
        displayEmployees(employeeData);

        document.getElementById("addEmployeeForm").style.display = "none";
        document.getElementById("addEmployeeButton").style.display = "block";

        document.getElementById("employeeForm").reset();
    }

    document.getElementById("addEmployeeButton").addEventListener("click", function () {
            document.getElementById("addEmployeeForm").style.display = "block";
            document.getElementById("addEmployeeButton").style.display = "none";
    });

    document.getElementById("employeeForm").addEventListener("submit", addEmployee);

    displayEmployees(employeeData);

        displayEmployees();
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
function goToHomePage() {
        window.location.href = '/hpHR';
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
document.getElementById('openPopup').addEventListener('click', function(e) {
  e.preventDefault();
  document.getElementById('popup-overlay').style.display = 'block';
  document.getElementById('popup').style.display = 'block';
});

document.getElementById('closePopup').addEventListener('click', function() {
  closePopup();
});
// Funzione per aprire il popup
    function openPopup() {
        document.getElementById("popup").style.display = "block";
    }
    function openPopup_delete() {
            document.getElementById("popup_delete").style.display = "block";
        }

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
resetFields();

function resetFields() {
    document.getElementById("name").value = "";
    document.getElementById("surname").value = "";
    document.getElementById("username").value = "";
    document.getElementById("password").value = "";
    document.getElementById("rl").value = "";
}

});

</script>
<<!-- SYSTEM JS -->
<script src="/static/js/jquery-3.2.1.min.js"></script>
        <script src="/static/js/popper.min.js" ></script>
        <script src="/static/js/bootstrap.min.js" ></script>
        <script src="/static/js/sb-admin-2.min.js" ></script>
        <script src="/static/js/app/app_utils.js"></script>>

<script>
            var doDeleteUrl = "/users";
            function onClickDelete(evt){
                if (window.confirm("Sei sicuro di voler cancellare?")) {
                    var _btnId = $(this).attr('id');
                    var real_url = doDeleteUrl + "?idUser=" + _btnId;
                    spinner_on();
                    doDelete(real_url,
                        function(s){
                            console.log(s);
                            console.log("done");
                            window.location.href = '/users';
                        },
                        function(err){
                            console.log(err);
                            console.log("fail");
                            window.location.href = '/users';
                        });
                }

            }

            $( document ).ready(function() {
                $(".delete_button").on("click", onClickDelete);
                <c:if test="${not empty errorVar}">
                        window.alert("${errorVar}");
                </c:if>
                console.log( "ready!" );
            });
        </script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
<script>
function validateRole(input) {
  if (input.value !== "0" && input.value !== "1") {
    input.value = ""; // Reset il valore dell'input se non è 0 o 1
  }
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