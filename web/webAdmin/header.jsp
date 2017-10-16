<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="#">Web Admin</a>

    <!--Navigation Side bar-->
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                <a class="nav-link" href="dashboard.jsp">
                    <i class="fa fa-fw fa-dashboard"></i>
                    <span class="nav-link-text">ড্যাশবোর্ড</span>
                </a>
            </li>

            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Example Pages">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseOrganogram" data-parent="#exampleAccordion">
                    <i class="fa fa-fw fa-file"></i>
                    <span class="nav-link-text">অর্গানোগ্রাম</span>
                </a>
                <ul class="sidenav-second-level collapse" id="collapseOrganogram">
                    <li>
                        <a href="addOrganogram.jsp"><i class="fa fa-users fa-fw"></i> নতুন অর্গানোগ্রাম</a>
                    </li>
                    <li>
                        <a href="allOrganogram.jsp"><i class="fa fa-users fa-fw"></i> সকল অর্গানোগ্রাম</a>
                    </li>                            
                </ul>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Menu Levels">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseEmployee" data-parent="#exampleAccordion">
                    <i class="fa fa-fw fa-sitemap"></i>
                    <span class="nav-link-text">কর্মচারী</span>
                </a>
                <ul class="sidenav-second-level collapse" id="collapseEmployee">
                    <li>
                        <a href="addEmployee.jsp"><i class="fa fa-user fa-fw"></i> নতুন কর্মচারী</a>
                    </li>
                    <li>
                        <a href="allEmployee.jsp"><i class="fa fa-user fa-fw"></i> সকল কর্মচারী</a>
                    </li>
                </ul>
            </li>

            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseAnother" data-parent="#exampleAccordion">
                    <i class="fa fa-fw fa-wrench"></i>
                    <span class="nav-link-text">অন্যান্য</span>
                </a>
                <ul class="sidenav-second-level collapse" id="collapseAnother">
                    <li><a href="userProfile.jsp"><i class="fa fa-user fa-fw"></i> ব্যবহারকারী প্রোফাইল</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> সেটিংস</a>
                    </li>
                    <li class="divider"></li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                            <i class="fa fa-fw fa-sign-out"></i>প্রস্থান</a>
                    </li>
                </ul>
            </li>
        </ul>
        <ul class="navbar-nav sidenav-toggler">
            <li class="nav-item">
                <a class="nav-link text-center" id="sidenavToggler">
                    <i class="fa fa-fw fa-angle-left"></i>
                </a>
            </li>
        </ul>

        <!--Navigation top bar-->
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <form class="form-inline my-2 my-lg-0 mr-lg-2">
                    <div class="input-group">
                        <input class="form-control" type="text" placeholder="Search for...">
                        <span class="input-group-btn">
                            <button class="btn btn-primary" type="button">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div>
                </form>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                    <i class="fa fa-fw fa-sign-out"></i>প্রস্থান</a>
            </li>
        </ul>
    </div>
</nav>