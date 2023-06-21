<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Boxicons CSS -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
    <title>Employee</title>
    <link rel="stylesheet" href="/static/css/style.css" type="text/css"/>
    <link rel="icon" href="/static/img/beta80favicon.png" type="image/x-icon">
    <link rel="shortcut icon" href="./img/beta80favicon.png" type="image/x-icon">
    <link href="/static/css/app.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
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

            </div>
        </div>
    </div>
</nav>



    <div class="welcome-text">
        <h3>Benvenuto Dipendente</h3>
            <div style="text-align: center; white-space: pre-line;">
                Benvenuto
            </div>
    </div




     <!-- Sidebar content -->
                <div class="col-md-9" >
                    <h1 class="color-employee" >Lista Task</h1>
                <br>
                                                <div class="row">
                                                    <div class="col-md-12">
                            <table class="table">
                                                                    <thead>
                                                                        <tr>
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
                                                <c:forEach items="${employee_list}" var="employee_model">
                                                    <tr>
                                                        <td>${employee_model.title}</td>
                                                        <td>${employee_model.description}</td>
                                                        <td>${employee_model.imageSrc}</td>
                                                        <td>${employee_model.link}</td>
                                                        <td>${employee_model.link}</td>
                                                         <td>
                                                             <a class="btn btn-primary" href="/employee/${employee_model.title}"><i class="fa fa-eye"></i> Details</a>
                                                         </td>

                                                    </tr>
                                                </c:forEach>

                                        </tbody>
                                  </table>
                               </div>
                               </div>
                </div>
</div>

<!-- JavaScript -->
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
        window.location.href = '/employee';
    }
</script>
<script>
    function goToEmployeePage() {
        window.location.href = '/employee';
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

function closePopup() {
  document.getElementById('popup-overlay').style.display = 'none';
  document.getElementById('popup').style.display = 'none';
}

</script>

<!-- SYSTEM JS -->
<script src="/static/js/jquery-3.2.1.min.js"></script>
        <script src="/static/js/popper.min.js" ></script>
        <script src="/static/js/bootstrap.min.js" ></script>
        <script src="/static/js/sb-admin-2.min.js" ></script>
        <script src="/static/js/app/app_utils.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>

</body>
</html>