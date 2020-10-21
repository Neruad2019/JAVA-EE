<%@include file="user.jsp"%>
<nav class="navbar justify-content-around" style="background-color: #180b7a">
    <div><a class="navbar-brand text-decoration-none text-white" href="#">
        <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-x-diamond" fill="#ffff"
             xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
                  d="M6.95.435c.58-.58 1.52-.58 2.1 0l6.515 6.516c.58.58.58 1.519 0 2.098L9.05 15.565c-.58.58-1.519.58-2.098 0L.435 9.05a1.482 1.482 0 0 1 0-2.098L6.95.435zm1.4.7a.495.495 0 0 0-.7 0L1.134 7.65a.495.495 0 0 0 0 .7l6.516 6.516a.495.495 0 0 0 .7 0l6.516-6.516a.495.495 0 0 0 0-.7L8.35 1.134z"/>
            <path fill-rule="evenodd"
                  d="M8.361 1.17a.51.51 0 0 0-.722 0L4.766 4.044 8 7.278l3.234-3.234L8.361 1.17zm3.595 3.596L8.722 8l3.234 3.234 2.873-2.873c.2-.2.2-.523 0-.722l-2.873-2.873zm-.722 7.19L8 8.722l-3.234 3.234 2.873 2.873c.2.2.523.2.722 0l2.873-2.873zm-7.19-.722L7.278 8 4.044 4.766 1.17 7.639a.511.511 0 0 0 0 .722l2.874 2.873zM6.917.45a1.531 1.531 0 0 1 2.166 0l6.469 6.468a1.532 1.532 0 0 1 0 2.166l-6.47 6.469a1.532 1.532 0 0 1-2.165 0L.45 9.082a1.531 1.531 0 0 1 0-2.165L6.917.45z"/>
        </svg>
        Aralasu.kz</a>
    </div>
    <% if(!ONLINE){%>
    <div class="d-flex flex-row">
        <div class="nav-item ml-sm-5">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-plus" fill="#ffff"
                 xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
                      d="M8 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10zM13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
            </svg>
            <a class="text-decoration-none text-white" href="/register.jsp">Register</a>
        </div>
        <div class="nav-item ml-sm-5">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-square" fill="#ffff"
                 xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
                      d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                <path fill-rule="evenodd" d="M2 15v-1c0-1 1-4 6-4s6 3 6 4v1H2zm6-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
            </svg>
            <a class="text-decoration-none text-white" href="/login.jsp">Login</a>
        </div>
        <div class="nav-item ml-sm-5">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-question-circle" fill="#ffff"
                 xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
            </svg>
            <a class="text-decoration-none text-white" href="#">FAQ</a>
        </div>
        <div class="nav-item ml-sm-5">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x-diamond" fill="#ffff"
                 xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
                      d="M6.95.435c.58-.58 1.52-.58 2.1 0l6.515 6.516c.58.58.58 1.519 0 2.098L9.05 15.565c-.58.58-1.519.58-2.098 0L.435 9.05a1.482 1.482 0 0 1 0-2.098L6.95.435zm1.4.7a.495.495 0 0 0-.7 0L1.134 7.65a.495.495 0 0 0 0 .7l6.516 6.516a.495.495 0 0 0 .7 0l6.516-6.516a.495.495 0 0 0 0-.7L8.35 1.134z"/>
                <path fill-rule="evenodd"
                      d="M8.361 1.17a.51.51 0 0 0-.722 0L4.766 4.044 8 7.278l3.234-3.234L8.361 1.17zm3.595 3.596L8.722 8l3.234 3.234 2.873-2.873c.2-.2.2-.523 0-.722l-2.873-2.873zm-.722 7.19L8 8.722l-3.234 3.234 2.873 2.873c.2.2.523.2.722 0l2.873-2.873zm-7.19-.722L7.278 8 4.044 4.766 1.17 7.639a.511.511 0 0 0 0 .722l2.874 2.873zM6.917.45a1.531 1.531 0 0 1 2.166 0l6.469 6.468a1.532 1.532 0 0 1 0 2.166l-6.47 6.469a1.532 1.532 0 0 1-2.165 0L.45 9.082a1.531 1.531 0 0 1 0-2.165L6.917.45z"/>
            </svg>
            <a class="text-decoration-none text-white" href="#">About Aralasu</a>
        </div>
    </div>
    <%}else {%>
    <div class="d-flex flex-row">
        <div class="nav-item ml-sm-5">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-list" fill="#ffff" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                <path fill-rule="evenodd" d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z"/>
                <circle cx="3.5" cy="5.5" r=".5"/>
                <circle cx="3.5" cy="8" r=".5"/>
                <circle cx="3.5" cy="10.5" r=".5"/>
            </svg>
            <a class="text-decoration-none text-white" href="/feed.jsp">Feed</a>
        </div>
        <div class="nav-item ml-sm-5">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-people-fill" fill="#ffff" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
            </svg>
            <a class="text-decoration-none text-white" href="/myfriends.jsp">My Friends</a>
        </div>
        <div class="nav-item ml-sm-5">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-grid-3x3-gap-fill" fill="#ffff" xmlns="http://www.w3.org/2000/svg">
                <path d="M1 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V2zM1 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V7zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V7zM1 12a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1v-2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-2z"/>
            </svg>
            <a class="text-decoration-none text-white" href="#">Groups</a>
        </div>
        <div class="nav-item ml-sm-5">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat-right-fill" fill="#ffff" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M14 0a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
            </svg>
            <a class="text-decoration-none text-white" href="/profile.jsp">My Posts</a>
        </div>
        <div class="nav-item ml-sm-5">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-heading" fill="#ffff" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                <path fill-rule="evenodd" d="M3 8.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5z"/>
                <path d="M3 5.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5v-1z"/>
            </svg>
            <a class="text-decoration-none text-white" href="/messages.jsp">Messages</a>
        </div>
        <div class="nav-item ml-sm-5">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-image" fill="#ffff" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9c0 .013 0 .027.002.04V12l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094L15 9.499V3.5a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13zm4.502 3.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
            </svg>
            <a class="text-decoration-none text-white" href="#">Pictures</a>
        </div>
        <div class="nav-item ml-sm-5">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-camera-video-fill" fill="#ffff" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M0 5a2 2 0 0 1 2-2h7.5a2 2 0 0 1 1.983 1.738l3.11-1.382A1 1 0 0 1 16 4.269v7.462a1 1 0 0 1-1.406.913l-3.111-1.382A2 2 0 0 1 9.5 13H2a2 2 0 0 1-2-2V5z"/>
            </svg>
            <a class="text-decoration-none text-white" href="#">Videos</a>
        </div>
    </div>
    <%}%>
</nav>
