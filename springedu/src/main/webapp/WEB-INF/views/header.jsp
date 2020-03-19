<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
    <div class="wrapper">
        <div class="top">
            <nav id="mobile">
                <div class="product">
                    <ul>
                        <h3>PRODUCT</h3>
                        <li><a class="menu-category" href="">ALL</a></li>
                        <li><a class="menu-category" href="">OUTER</a></li>
                        <li><a class="menu-category" href="">TOP</a></li>
                        <li><a class="menu-category" href="">BOTTOM</a></li>
                        <li><a class="menu-category" href="">ACC</a></li>
                        <li><a class="menu-category" href="">SHOES</a></li>
                    </ul>
                </div>
                <div class="community">
                    <ul>
                        <h3>COMMUNITY</h3> 
                        <li><a class="menu-category" href="<c:url value='/board/list/NOTICE' />">NOTICE</a></li>
                        <li><a class="menu-category" href="<c:url value='/board/list/Q&A' />">Q&A</a></li>
                        <li><a class="menu-category" href="<c:url value='/board/list/REVIEW' />">REVIEW</a></li>
                    </ul>
                </div>
            <c:if test="${empty member }">
            <div class="user-area">
                <ul>
                    <li><a class="menu-category" href="<c:url value='/loginForm' />">LOG-IN</a></li>
                    <li><a class="menu-category" href="<c:url value='/member/joinForm' />">REGISTER</a></li>
                    <li><a class="menu-category" href="">CART </a><span>0</span></li>
                    <li><a class="menu-category" href="">MY PAGE</a></li>
                    <li><a class="menu-category" href="">ORDER</a></li>
                </ul>
            </div>
            </c:if>
            <c:if test="${!empty member }">
            <div class="user-area">
                <ul>
                    <li><a class="menu-category" href="<c:url value='/logout' />">LOG-OUT</a></li>
                    <li><a class="menu-category" href="<c:url value='/member/modifyForm/${sessionScope.member.id }' />">${member.nickname }님</a></li>
                    <li><a class="menu-category" href="<c:url value='/member/outForm' />">회원 탈퇴</a></li>
                    <li><a class="menu-category" href="">CART </a><span>0</span></li>
                    <li><a class="menu-category" href="">MY PAGE</a></li>
                    <li><a class="menu-category" href="">ORDER</a></li>
                </ul>
            </div>
            </c:if>
                <div class="search">
                    <div class="icon">
                        <a href="https://www.facebook.com/jeonminsik94" target="_blank">
                            <i class="fab fa-facebook-square fa-2x"></i>
                        </a>
                        <a href="https://www.instagram.com/sii.ki/" target="_blank">
                            <i class="fab fa-instagram fa-2x"></i>
                        </a>
                    </div>
                    
                <div class="cs-center">
                    <ul>
                        <li>070-1234-5678</li>
                        <li>WEEKDAY <br>
                            10:00 ~ 17:00</li>
                        <li>LUNCH BREAK <br>
                            12:00 ~ 13:00 </li>
                        <li>* WEEKEND AND <br>
                             HOLIDAY CLOSED</li>
                    </ul>
                </div>
            </nav>
            <a href="" class="tab"><span>tab</span><i class="fas fa-bars fa-2x"></i></a>
            <div class="topin">
                <a href="<c:url value='/' /> ">SI BEL HOMME</a>
            </div>
                <div class="searchbox">
                    <a href=""><i class="fas fa-search fa-2x"></i></a>
                </div>
        </div>
        </div>
        <div class="container">
            <div class="dim">

            </div>
            <div class="leftMenu">
                <div class="product">
                    <ul>
                        <h3>PRODUCT</h3>
                        <li><a class="menu-category" href="">ALL</a></li>
                        <li><a class="menu-category" href="">OUTER</a></li>
                        <li><a class="menu-category" href="">TOP</a></li>
                        <li><a class="menu-category" href="">BOTTOM</a></li>
                        <li><a class="menu-category" href="">ACC</a></li>
                        <li><a class="menu-category" href="">SHOES</a></li>
                    </ul>
                </div>
                <div class="community">
                    <ul>
                        <h3>COMMUNITY</h3> 
                        <li><a class="menu-category" href="<c:url value='/board/list/NOTICE' />">NOTICE</a></li>
                        <li><a class="menu-category" href="<c:url value='/board/list/Q&A' />">Q&A</a></li>
                        <li><a class="menu-category" href="<c:url value='/board/list/REVIEW' />">REVIEW</a></li>
                    </ul>
                </div>
                <div class="cs-center">
                    <ul>
                        <li>070-1234-5678</li>
                        <li>WEEKDAY <br>
                            10:00 ~ 17:00</li>
                        <li>LUNCH BREAK <br>
                            12:00 ~ 13:00 </li>
                        <li>* WEEKEND AND <br>
                             HOLIDAY CLOSED</li>
                    </ul>
                </div>
            </div>
            <div class="rightMenu">
            <!-- 로그인 전 -->            
            <c:if test="${empty member }">
                <ul>
                    <li><a class="menu-category" href="<c:url value='/loginForm' />">LOG-IN</a></li>
                    <li><a class="menu-category" href="<c:url value='/member/joinForm' />">REGISTER</a></li>
                    <br>                    
                    <li><a class="menu-category" href="">CART </a><span>0</span></li>
                    <li><a class="menu-category" href="">MY PAGE</a></li>
                    <li><a class="menu-category" href="">ORDER</a></li>
                </ul>
            </c:if>
            <!-- 로그인 후 -->
            <c:if test="${!empty member }">
              <ul>
                    <li><a class="menu-category" href="<c:url value='/logout' />">LOG-OUT</a></li>
                    <li><a class="menu-category" href="<c:url value='/member/modifyForm/${sessionScope.member.id }' />">${member.nickname}님</a></li>
                    <c:if test="${sessionScope.member.admin == 1 }">
                    <li><a class="menu-category" href="<c:url value='/admin/index' />">관리자페이지</a></li>
                    </c:if>
                    <br>                    
                    <li><a class="menu-category" href="">CART </a><span>0</span></li>
                    <li><a class="menu-category" href="">MY PAGE</a></li>
                    <li><a class="menu-category" href="">ORDER</a></li>
                </ul>
             </c:if>
                <div class="search">
                    <div class="icon">
                        <a href="https://www.facebook.com/jeonminsik94" target="_blank">
                            <i class="fab fa-facebook-square fa-2x"></i>
                        </a>
                        <a href="https://www.instagram.com/sii.ki/" target="_blank">
                            <i class="fab fa-instagram-square fa-2x"></i>
                        </a>
                    </div>
                    <form>
                        <div class="searchbox">
                            <input type="text" class="text">
                            <a href=""><i class="fas fa-search fa-2x"></i></a>
                        </div>
                    </form>
                </div>
            </div>