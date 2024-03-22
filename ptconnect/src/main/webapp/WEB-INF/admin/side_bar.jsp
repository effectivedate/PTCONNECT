<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
			
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/admin/admin_index">
                <div class="sidebar-brand-icon "> <!-- rotate-n-15 -->
                    <i class="fas fa-wrench"></i> <!-- fa-laugh-wink -->
                </div>
                <div class="sidebar-brand-text mx-3">관리자 페이지</div>
            </a>
			
            <!-- Divider -->
            <hr class="sidebar-divider">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                    <i class="bi bi-box-arrow-right"></i>
                    <span style="font-weight:600; font-size:16px;">로그아웃</span></a>
            </li>
            
            
            <!-- Divider -->
            <hr class="sidebar-divider my-0">
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item ">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false"
                    aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-folder"></i>  <!-- fa-fw fa-cog -->
                    <span>승인 요청 관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Custom Components:</h6> -->
                        <a class="collapse-item " href="${pageContext.request.contextPath}/admin/trainerRegisterList/1">트레이너 등록 요청</a>
                        <a class="collapse-item " href="${pageContext.request.contextPath}/admin/centerRegisterList/1">센터 등록 요청</a>
                    </div>
                </div>
            </li>
            
            <!-- <i class="fas fa-fw fa-chart-area"></i> -->
            <!-- <i class="fas fa-fw fa-cog"></i> -->
            <!-- <i class="fas fa-fw fa-tachometer-alt"></i> -->
            

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <!-- <div class="sidebar-heading">
                Interface
            </div> -->
            
            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/reportList">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>신고 관리</span></a>
            </li>
            
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities1"
                    aria-expanded="true" aria-controls="collapseUtilities1">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>상품 관리</span>
                </a>
                <div id="collapseUtilities1" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Custom Utilities:</h6> -->
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/registeredProductList">등록 상품 리스트</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/tradedProductList">상품 거래 내역</a>
                        <!-- <a class="collapse-item" href="utilities-animation.html">센터 신고 내역</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a> -->
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities2"
                    aria-expanded="true" aria-controls="collapseUtilities2">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>채팅 관리</span>
                </a>
                <div id="collapseUtilities2" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Custom Utilities:</h6> -->
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/managerChatList">관리자 채팅 내역</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/customerChatList">고객 채팅 내역</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Heading -->
            <!-- <div class="sidebar-heading">
                Addons
            </div> -->
            
            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/userManagement">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>회원 관리</span></a>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/admin_review">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>리뷰 관리</span></a>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePage3"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>포인트 관리</span>
                </a>
                <div id="collapsePage3" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Login Screens:</h6> -->
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/admin_point">포인트 내역</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/admin_point_detail">포인트 관리</a>
                        <!-- <a class="collapse-item" href="forgot-password.html">1:1 문의</a> -->
                        <!-- <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a> -->
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePage4"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>쿠폰 관리</span>
                </a>
                <div id="collapsePage4" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Login Screens:</h6> -->
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/admin_coupon_list">쿠폰 내역</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/admin_coupon">쿠폰 발급하기</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePage5"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>고객지원</span>
                </a>
                <div id="collapsePage5" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Login Screens:</h6> -->
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/admin_notice1">공지사항</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/admin_FAQ1">자주묻는 질문</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>

<script src="${pageContext.request.contextPath}/resources/css/admin/vendor/jquery/jquery.min.js"></script>
