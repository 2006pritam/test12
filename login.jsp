<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String errorMessage = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Online Book Store</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=Sora:wght@400;600;700&display=swap');

        :root {
            --bg-peach: #ffe9db;
            --bg-mint: #d7f4e7;
            --panel: #ffffff;
            --ink: #1f2937;
            --ink-soft: #4b5563;
            --brand: #0f766e;
            --brand-strong: #115e59;
            --accent: #f97316;
            --danger-bg: #fff1f2;
            --danger-text: #b91c1c;
            --border: rgba(31, 41, 55, 0.16);
            --shadow: 0 24px 70px rgba(17, 24, 39, 0.14);
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Space Grotesk", "Trebuchet MS", sans-serif;
            color: var(--ink);
            background:
                radial-gradient(circle at 15% 20%, rgba(249, 115, 22, 0.25), transparent 40%),
                radial-gradient(circle at 85% 80%, rgba(15, 118, 110, 0.3), transparent 45%),
                linear-gradient(130deg, var(--bg-peach), var(--bg-mint));
            display: grid;
            place-items: center;
            padding: 1.2rem;
        }

        .page-shell {
            width: min(980px, 100%);
            position: relative;
            animation: rise 650ms ease-out both;
        }

        .page-shell::before,
        .page-shell::after {
            content: "";
            position: absolute;
            border-radius: 999px;
            z-index: -1;
            filter: blur(2px);
            animation: drift 7s ease-in-out infinite alternate;
        }

        .page-shell::before {
            width: 130px;
            height: 130px;
            right: -22px;
            top: -35px;
            background: rgba(249, 115, 22, 0.2);
        }

        .page-shell::after {
            width: 160px;
            height: 160px;
            left: -35px;
            bottom: -40px;
            background: rgba(15, 118, 110, 0.2);
        }

        .login-panel {
            display: grid;
            grid-template-columns: 1fr 1fr;
            background: rgba(255, 255, 255, 0.88);
            border: 1px solid rgba(255, 255, 255, 0.7);
            border-radius: 28px;
            box-shadow: var(--shadow);
            overflow: hidden;
            backdrop-filter: blur(5px);
        }

        .hero {
            padding: 2.4rem 2rem;
            background:
                linear-gradient(160deg, rgba(255, 255, 255, 0.78), rgba(255, 255, 255, 0.5)),
                repeating-linear-gradient(
                    -35deg,
                    rgba(15, 118, 110, 0.08),
                    rgba(15, 118, 110, 0.08) 10px,
                    rgba(249, 115, 22, 0.08) 10px,
                    rgba(249, 115, 22, 0.08) 20px
                );
            border-right: 1px solid rgba(31, 41, 55, 0.08);
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 1.25rem;
        }

        .badge {
            width: fit-content;
            border-radius: 999px;
            padding: 0.35rem 0.8rem;
            background: rgba(17, 94, 89, 0.1);
            color: var(--brand-strong);
            font-size: 0.85rem;
            font-weight: 700;
            letter-spacing: 0.03em;
        }

        .hero h1 {
            margin: 0;
            font-family: "Sora", "Century Gothic", sans-serif;
            font-size: clamp(1.55rem, 3vw, 2.35rem);
            line-height: 1.16;
            letter-spacing: -0.01em;
        }

        .hero p {
            margin: 0;
            color: var(--ink-soft);
            line-height: 1.6;
            max-width: 35ch;
        }

        .highlight {
            color: var(--accent);
            font-weight: 700;
        }

        .form-wrap {
            padding: 2.4rem 2rem;
            background: var(--panel);
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-wrap h2 {
            margin: 0 0 1.35rem;
            font-size: 1.35rem;
        }

        form {
            display: grid;
            gap: 0.95rem;
        }

        label {
            display: block;
            font-size: 0.92rem;
            font-weight: 700;
            margin-bottom: 0.35rem;
            color: var(--ink-soft);
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            border-radius: 12px;
            border: 1px solid var(--border);
            padding: 0.78rem 0.9rem;
            font: inherit;
            color: var(--ink);
            background: #ffffff;
            transition: border-color 180ms ease, box-shadow 180ms ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: var(--brand);
            box-shadow: 0 0 0 4px rgba(15, 118, 110, 0.16);
        }

        .error {
            border: 1px solid #fecdd3;
            background: var(--danger-bg);
            color: var(--danger-text);
            border-radius: 12px;
            padding: 0.7rem 0.85rem;
            font-size: 0.92rem;
            margin-bottom: 0.9rem;
        }

        .submit-btn {
            margin-top: 0.35rem;
            width: 100%;
            border: none;
            border-radius: 12px;
            background: linear-gradient(120deg, var(--brand), var(--brand-strong));
            color: #ffffff;
            font-family: "Sora", "Verdana", sans-serif;
            font-size: 0.98rem;
            font-weight: 700;
            letter-spacing: 0.02em;
            padding: 0.82rem 1rem;
            cursor: pointer;
            transition: transform 150ms ease, filter 150ms ease;
        }

        .submit-btn:hover {
            transform: translateY(-1px);
            filter: saturate(1.08);
        }

        .submit-btn:active {
            transform: translateY(0);
        }

        .note {
            margin: 0.8rem 0 0;
            font-size: 0.86rem;
            color: var(--ink-soft);
        }

        @keyframes rise {
            from {
                opacity: 0;
                transform: translateY(16px) scale(0.985);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        @keyframes drift {
            from {
                transform: translateY(0);
            }
            to {
                transform: translateY(-12px);
            }
        }

        @media (max-width: 860px) {
            .login-panel {
                grid-template-columns: 1fr;
            }

            .hero {
                border-right: none;
                border-bottom: 1px solid rgba(31, 41, 55, 0.08);
                padding: 2rem 1.5rem;
            }

            .form-wrap {
                padding: 1.8rem 1.5rem;
            }
        }

        @media (max-width: 520px) {
            body {
                padding: 0.85rem;
            }

            .page-shell::before,
            .page-shell::after {
                width: 100px;
                height: 100px;
            }

            .hero h1 {
                font-size: 1.38rem;
            }

            .hero p {
                font-size: 0.94rem;
            }
        }
    </style>
</head>
<body>
    <main class="page-shell">
        <section class="login-panel">
            <div class="hero">
                <span class="badge">ONLINE BOOK STORE</span>
                <h1>
                    Discover your next favorite title in a
                    <span class="highlight">fresh reading space</span>.
                </h1>
                <p>
                    Sign in to continue your journey through curated book picks, personalized shelves, and quick checkout.
                </p>
            </div>

            <div class="form-wrap">
                <h2>Welcome Back</h2>

                <% if (errorMessage != null) { %>
                    <div class="error"><%= errorMessage %></div>
                <% } %>

                <form action="<%= request.getContextPath() %>/login" method="post">
                    <div>
                        <label for="loginId">Login ID</label>
                        <input type="text" id="loginId" name="loginId" placeholder="yourname@example.com" required>
                    </div>

                    <div>
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter your password" required>
                    </div>

                    <input class="submit-btn" type="submit" value="Login">
                </form>

                <p class="note">Secure login powered by your bookstore account.</p>
            </div>
        </section>
    </main>

</body>
</html>
