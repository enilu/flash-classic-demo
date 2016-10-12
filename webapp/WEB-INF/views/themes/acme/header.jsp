<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/webflash.tld" prefix="z"%>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>${title}</title>

    <z:link path="/themes/acme/css/bootstrap.min.css" id="bootstrap-style"/>
    <z:link path="/themes/acme/css/style.min.css" id="base-style"/>

    <z:link path="/assets/select2.css"/>
    <z:link path="/assets/application.css"/>
  </head>
  <body>
  <div class="navbar">
    <div class="navbar-inner">
      <div class="container">
        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".sidebar-nav.nav-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.html"><span>Acme, Inc</span></a>

        <!-- start: Header Menu -->
        <div class="nav-no-collapse header-nav">
          <ul class="nav pull-right">
            <li class="dropdown hidden-xs">
              <a class="btn dropdown-toggle" data-toggle="dropdown" href="index.html#">
                <i class="halflings warning-sign white"></i>
              </a>
              <ul class="dropdown-menu notifications">
                <li>
                  <span class="dropdown-menu-title">You have 11 notifications</span>
                </li>
                <li>
                  <a href="index.html#">
                    + <i class="fa fa-user"></i> <span class="message">New user registration</span> <span class="time">1 min</span>
                  </a>
                </li>
                <li>
                  <a href="index.html#">
                    + <i class="fa fa-comment-o"></i> <span class="message">New comment</span> <span class="time">7 min</span>
                  </a>
                </li>
                <li>
                  <a href="index.html#">
                    + <i class="fa fa-comment-o"></i> <span class="message">New comment</span> <span class="time">8 min</span>
                  </a>
                </li>
                <li>
                  <a href="index.html#">
                    + <i class="fa fa-comment-o"></i> <span class="message">New comment</span> <span class="time">16 min</span>
                  </a>
                </li>
                <li>
                  <a href="index.html#">
                    + <i class="fa fa-user"></i> <span class="message">New user registration</span> <span class="time">36 min</span>
                  </a>
                </li>
                <li>
                  <a href="index.html#">
                    + <i class="fa fa-shopping-cart"></i> <span class="message">2 items sold</span> <span class="time">1 hour</span>
                  </a>
                </li>
                <li class="warning">
                  <a href="index.html#">
                    - <i class="fa fa-user"></i> <span class="message">User deleted account</span> <span class="time">2 hour</span>
                  </a>
                </li>
                <li class="warning">
                  <a href="index.html#">
                    - <i class="fa fa-shopping-cart"></i> <span class="message">Transaction was canceled</span> <span class="time">6 hour</span>
                  </a>
                </li>
                <li>
                  <a href="index.html#">
                    + <i class="fa fa-comment-o"></i> <span class="message">New comment</span> <span class="time">yesterday</span>
                  </a>
                </li>
                <li>
                  <a href="index.html#">
                    + <i class="fa fa-user"></i> <span class="message">New user registration</span> <span class="time">yesterday</span>
                  </a>
                </li>
                <li>
                  <a class="dropdown-menu-sub-footer">View all notifications</a>
                </li>
              </ul>
            </li>
            <!-- start: Notifications Dropdown -->
            <li class="dropdown hidden-xs">
              <a class="btn dropdown-toggle" data-toggle="dropdown" href="index.html#">
                <i class="halflings tasks white"></i>
              </a>
              <ul class="dropdown-menu tasks">
                <li>
                  <span class="dropdown-menu-title">You have 17 tasks in progress</span>
                </li>
                <li>
                  <a href="index.html#">
										<span class="header">
											<span class="title">iOS Development</span>
											<span class="percent">80%</span>
										</span>
                    <div class="taskProgress progressSlim progressBlue ui-progressbar ui-widget ui-widget-content ui-corner-all" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="80">80<div class="ui-progressbar-value ui-widget-header ui-corner-left" style="width: 80%;"></div></div>
                  </a>
                </li>
                <li>
                  <a href="index.html#">
										<span class="header">
											<span class="title">Android Development</span>
											<span class="percent">47%</span>
										</span>
                    <div class="taskProgress progressSlim progressBlue ui-progressbar ui-widget ui-widget-content ui-corner-all" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="47">47<div class="ui-progressbar-value ui-widget-header ui-corner-left" style="width: 47%;"></div></div>
                  </a>
                </li>
                <li>
                  <a href="index.html#">
										<span class="header">
											<span class="title">Django Project For Google</span>
											<span class="percent">32%</span>
										</span>
                    <div class="taskProgress progressSlim progressBlue ui-progressbar ui-widget ui-widget-content ui-corner-all" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="32">32<div class="ui-progressbar-value ui-widget-header ui-corner-left" style="width: 32%;"></div></div>
                  </a>
                </li>
                <li>
                  <a href="index.html#">
										<span class="header">
											<span class="title">SEO for new sites</span>
											<span class="percent">63%</span>
										</span>
                    <div class="taskProgress progressSlim progressBlue ui-progressbar ui-widget ui-widget-content ui-corner-all" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="63">63<div class="ui-progressbar-value ui-widget-header ui-corner-left" style="width: 63%;"></div></div>
                  </a>
                </li>
                <li>
                  <a href="index.html#">
										<span class="header">
											<span class="title">New blog posts</span>
											<span class="percent">80%</span>
										</span>
                    <div class="taskProgress progressSlim progressBlue ui-progressbar ui-widget ui-widget-content ui-corner-all" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="80">80<div class="ui-progressbar-value ui-widget-header ui-corner-left" style="width: 80%;"></div></div>
                  </a>
                </li>
                <li>
                  <a class="dropdown-menu-sub-footer">View all tasks</a>
                </li>
              </ul>
            </li>
            <!-- end: Notifications Dropdown -->
            <!-- start: Message Dropdown -->
            <li class="dropdown hidden-xs">
              <a class="btn dropdown-toggle" data-toggle="dropdown" href="index.html#">
                <i class="halflings envelope white"></i>
              </a>
              <ul class="dropdown-menu messages">
                <li>
                  <span class="dropdown-menu-title">You have 9 messages</span>
                </li>
                <li>
                  <a href="index.html#">
                    <span class="avatar"><img src="/themes/acme/img/avatar.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Łukasz Holeczek
										     </span>
											<span class="time">
										    	6 min
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>
                  </a>
                </li>
                <li>
                  <a href="index.html#">
                    <span class="avatar"><img src="/themes/acme/img/avatar2.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Megan Abott
										     </span>
											<span class="time">
										    	56 min
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>
                  </a>
                </li>
                <li>
                  <a href="index.html#">
                    <span class="avatar"><img src="/themes/acme/img/avatar3.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Kate Ross
										     </span>
											<span class="time">
										    	3 hours
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>
                  </a>
                </li>
                <li>
                  <a href="index.html#">
                    <span class="avatar"><img src="/themes/acme/img/avatar4.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Julie Blank
										     </span>
											<span class="time">
										    	yesterday
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>
                  </a>
                </li>
                <li>
                  <a href="index.html#">
                    <span class="avatar"><img src="/themes/acme/img/avatar5.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Jane Sanders
										     </span>
											<span class="time">
										    	Jul 25, 2012
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>
                  </a>
                </li>
                <li>
                  <a class="dropdown-menu-sub-footer">View all messages</a>
                </li>
              </ul>
            </li>
            <!-- end: Message Dropdown -->
            <li>
              <a class="btn" href="index.html#">
                <i class="halflings cog white"></i>
              </a>
            </li>
            <!-- start: User Dropdown -->
            <li class="dropdown">
              <a class="btn dropdown-toggle" data-toggle="dropdown" href="index.html#">
                <i class="halflings user white"></i> Łukasz Holeczek
                <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <li><a href="index.html#"><i class="halflings user white"></i> Profile</a></li>
                <li><a href="login.html"><i class="halflings off white"></i> Logout</a></li>
              </ul>
            </li>
            <!-- end: User Dropdown -->
          </ul>
        </div>
        <!-- end: Header Menu -->

      </div>
    </div>
  </div>
  
  <div class="navbar">
    <div class="navbar-inner">
      <div class="container-fluid">
        <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </a>
        <a class="brand" href="/"><span>DEMO</span></a>
                
        <!-- start: Header Menu -->
        <div class="nav-no-collapse header-nav">
          <ul class="nav pull-right">
            <!-- start: User Dropdown -->
            <li class="dropdown">
              <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="halflings-icon white user"></i> ${currentUser.name}
                <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <li><a href="#"><i class="halflings-icon white user"></i> 设置</a></li>
                <li><a href="<c:url value="/users/logout"/>"><i class="halflings-icon white off"></i> 退出</a></li>
              </ul>
            </li>
            <!-- end: User Dropdown -->
          </ul>
        </div>
        <!-- end: Header Menu -->
      </div>
    </div>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <jsp:include page="/WEB-INF/views/themes/acme/sidebar.jsp"/>
      <!-- start: Content -->
      <div id="content" class="span11">