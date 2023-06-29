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
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <title>Cruscotto HR - users</title>
        <link rel="stylesheet" href="/static/css/style.css" type="text/css"/>
        <link rel="icon" href="/static/img/beta80favicon.png" type="image/x-icon">
        <link rel="shortcut icon" href="./img/beta80favicon.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    </head>
    <body>
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
                                <h2>My area</h2>
                                <button id="closePopup">Close</button>
                            </div>
                            <form>
                                <label for="benvenuto">Welcome text:</label>
                                <input type="text" id="benvenuto" name="benvenuto" placeholder="Insert welcome text" disabled>
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" placeholder="insert your email" disabled>
                                <button type="button" id="editButton">Edit</button>
                                <button type="submit" id="saveButton" style="display: none;">Save</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
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
        <section class="content">
            <div class="container-fluid">
            <div class="row">
                <div class="col-md-3 sidebar-col">
                    <!-- Sidebar content -->
                </div>
                <div class="col-md-9">
                    <h1 class="color-employee">Employee infomation</h1>
                    <br>
                    <div class="row">
                        <div class="col-md-12">
                            <form class="form" action="task" method="post">
                                ${error}
                                <div class="form-group">
                                    <label for="title">Name</label>
                                    <input id="title" type="text" name="title" class="form-control" value="${user_model.name}" disabled style="width: 200px;">
                                </div>
                                <div class="form-group">
                                    <label for="description">Surname</label>
                                    <input id="description" type="text" name="description" class="form-control" value="${user_model.surname}" disabled style="width: 200px;">
                                </div>
                                <div class=form"form-group">
                                    <label for="link">Date of entry</label>
                                    <input id="link" type="text" name="link" class="form-control" value="${user_model.dt}" disabled style="width: 200px;">
                                </div>
                            </form>
                            <h1 class="color-employee">Task List</h1>
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
                                            COMPLETION DATE
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${task_list}" var="task_model">
                                        <tr>
                                            <td>${task_model.taskTitle}</td>
                                            <td>${task_model.taskDescription}</td>
                                            <td>${task_model.taskStatus}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-primary" onclick="goToUsersPage()">Back</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
            function goToHomePagePage() {
                window.location.href = '/hpHR';
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
        <script>
            function goToHomePage() {
                    window.location.href = '/hpHR';
                }
        </script>
    </body>
</html>