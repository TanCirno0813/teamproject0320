<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="ko_KR" data-locale="ko_KR">
<head>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        :root {
            --primary-color: #2563eb;
            --hover-color: #1d4ed8;
            --text-color: #374151;
            --light-bg: #f8fafc;
        }

        .navbar {
            background: #ffffff !important;
            box-shadow: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            padding: 1rem 0;
            border-bottom: 1px solid #e5e7eb;
        }
        
        .navbar-dark .navbar-nav .nav-link {
            color: var(--text-color) !important;
            font-weight: 500;
            padding: 0.5rem 1rem;
            transition: all 0.3s ease;
            border-radius: 6px;
            margin: 0 0.25rem;
        }

        .navbar-dark .navbar-nav .nav-link:hover {
            color: var(--primary-color) !important;
            background-color: var(--light-bg);
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            color: var(--primary-color) !important;
        }

        .auth-buttons .nav-link {
            padding: 0.5rem 1.25rem !important;
        }

        .login-btn {
            color: var(--primary-color) !important;
            border: 1px solid var(--primary-color);
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .login-btn:hover {
            background-color: var(--primary-color);
            color: white !important;
        }

        .signup-btn {
            background-color: var(--primary-color);
            color: white !important;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .signup-btn:hover {
            background-color: var(--hover-color);
        }

        .navbar-dark .navbar-toggler {
            border-color: transparent;
            padding: 0.5rem;
        }

        .navbar-dark .navbar-toggler:focus {
            box-shadow: none;
        }

        .navbar-dark .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%2833, 33, 33, 0.75%29' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
        }

        .user-welcome {
            color: var(--text-color);
            font-weight: 500;
        }
        
        .download-section {
            background: #1a1a1a;
            padding: 4rem 0;
            color: white;
        }
        
        .footer {
            background: #0a0a0a;
            color: #666;
            padding: 3rem 0;
        }
        
        .social-media {
            background: #1a1a1a;
            padding: 2rem 0;
        }
        
        .social-media-icon {
            font-size: 2rem;
            color: white;
            margin: 0 1rem;
            transition: color 0.3s;
        }
        
        .social-media-icon:hover {
            color: #007bff;
        }

        .main-content {
            padding-top: 76px; /* 네비게이션 바 높이만큼 여백 추가 */
            min-height: calc(100vh - 200px); /* 푸터 높이를 제외한 최소 높이 */
        }
    </style>
</head>
<body>

<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/">
            Brand
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="/characters">공지사항</a></li>
                <li class="nav-item"><a class="nav-link" href="/posts">게시판</a></li>
            </ul>
            <ul class="navbar-nav ms-auto auth-buttons">
                <c:choose>
                    <c:when test="${empty sessionScope.loginMember}">
                        <li class="nav-item">
                            <a class="nav-link login-btn" href="/login">로그인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link signup-btn" href="/register">회원가입</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <span class="nav-link user-welcome">${sessionScope.loginMember}님 환영합니다</span>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link login-btn" href="/logout">로그아웃</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<div class="main-content">