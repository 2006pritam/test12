<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String email = (String) request.getAttribute("email");
if (email == null || email.trim().isEmpty()) {
    email = "Reader";
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Successful | Online Book Store</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700&family=Sora:wght@500;700&display=swap');

    :root {
        --ink: #0f172a;
        --ink-soft: #475569;
        --surface: rgba(255, 255, 255, 0.9);
        --line: rgba(15, 23, 42, 0.13);
        --green: #16a34a;
        --green-dark: #15803d;
        --amber: #f59e0b;
        --blue: #0ea5e9;
        --glow: 0 30px 70px rgba(15, 23, 42, 0.2);
    }

    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        min-height: 100vh;
        display: grid;
        place-items: center;
        padding: 1.2rem;
        color: var(--ink);
        font-family: "Outfit", "Gill Sans", sans-serif;
        background:
            radial-gradient(circle at 12% 16%, rgba(22, 163, 74, 0.26), transparent 38%),
            radial-gradient(circle at 88% 80%, rgba(14, 165, 233, 0.25), transparent 45%),
            linear-gradient(145deg, #fefce8 0%, #eff6ff 50%, #ecfccb 100%);
        overflow-x: hidden;
    }

    .success-shell {
        width: min(760px, 100%);
        position: relative;
        animation: pop-in 650ms ease both;
    }

    .confetti {
        position: absolute;
        width: 12px;
        height: 12px;
        border-radius: 3px;
        z-index: 0;
        animation: float 5s ease-in-out infinite;
    }

    .c1 { top: -15px; left: 10%; background: var(--amber); }
    .c2 { top: -10px; right: 14%; background: var(--blue); animation-delay: 0.6s; }
    .c3 { bottom: -12px; left: 20%; background: #22c55e; animation-delay: 1.1s; }
    .c4 { bottom: -18px; right: 22%; background: #fb7185; animation-delay: 1.6s; }

    .card {
        position: relative;
        z-index: 1;
        background: var(--surface);
        border: 1px solid rgba(255, 255, 255, 0.65);
        border-radius: 26px;
        box-shadow: var(--glow);
        padding: 2.35rem 2.1rem;
        backdrop-filter: blur(4px);
        text-align: center;
    }

    .check {
        width: 84px;
        height: 84px;
        border-radius: 50%;
        margin: 0 auto 1.1rem;
        background: linear-gradient(130deg, #22c55e, var(--green-dark));
        display: grid;
        place-items: center;
        box-shadow: 0 18px 34px rgba(22, 163, 74, 0.28);
        position: relative;
    }

    .check::before {
        content: "";
        width: 26px;
        height: 14px;
        border-left: 5px solid #ffffff;
        border-bottom: 5px solid #ffffff;
        transform: rotate(-45deg) translateY(-2px);
    }

    h1 {
        margin: 0;
        font-family: "Sora", "Candara", sans-serif;
        font-size: clamp(1.5rem, 3vw, 2rem);
        line-height: 1.2;
        letter-spacing: -0.01em;
    }

    .subtitle {
        margin: 0.7rem auto 0;
        color: var(--ink-soft);
        max-width: 43ch;
        line-height: 1.6;
    }

    .user-pill {
        margin: 1.25rem auto;
        width: fit-content;
        padding: 0.5rem 0.95rem;
        border-radius: 999px;
        border: 1px solid rgba(22, 163, 74, 0.24);
        background: rgba(22, 163, 74, 0.1);
        color: #166534;
        font-weight: 700;
        word-break: break-word;
    }

    .divider {
        height: 1px;
        border: none;
        background: var(--line);
        margin: 1.4rem 0;
    }

    .actions {
        display: flex;
        justify-content: center;
        gap: 0.8rem;
        flex-wrap: wrap;
    }

    .btn,
    .btn-muted {
        text-decoration: none;
        font-weight: 700;
        border-radius: 11px;
        padding: 0.72rem 1.12rem;
        transition: transform 150ms ease, box-shadow 150ms ease;
    }

    .btn {
        background: linear-gradient(125deg, var(--green), var(--green-dark));
        color: #ffffff;
        box-shadow: 0 10px 20px rgba(21, 128, 61, 0.25);
    }

    .btn:hover {
        transform: translateY(-1px);
    }

    .btn-muted {
        color: var(--ink);
        border: 1px solid var(--line);
        background: #ffffff;
    }

    .btn-muted:hover {
        transform: translateY(-1px);
    }

    @keyframes float {
        0%, 100% { transform: translateY(0) rotate(0deg); }
        50% { transform: translateY(-12px) rotate(8deg); }
    }

    @keyframes pop-in {
        from {
            opacity: 0;
            transform: translateY(16px) scale(0.98);
        }
        to {
            opacity: 1;
            transform: translateY(0) scale(1);
        }
    }

    @media (max-width: 620px) {
        body {
            padding: 0.9rem;
        }

        .card {
            border-radius: 20px;
            padding: 1.8rem 1.2rem;
        }

        .check {
            width: 70px;
            height: 70px;
        }

        .subtitle {
            font-size: 0.95rem;
        }

        .actions {
            gap: 0.6rem;
        }
    }
</style>
</head>

<body>
    <main class="success-shell">
        <span class="confetti c1"></span>
        <span class="confetti c2"></span>
        <span class="confetti c3"></span>
        <span class="confetti c4"></span>

        <section class="card">
            <div class="check" aria-hidden="true"></div>
            <h1>Login Successful</h1>
            <p class="subtitle">
                You are now signed in and ready to continue exploring the Online Book Store.
            </p>

            <div class="user-pill">Welcome, <%= email %></div>

            <hr class="divider">

            <div class="actions">
                <a class="btn" href="<%= request.getContextPath() %>/login">Sign in Again</a>
                <a class="btn-muted" href="<%= request.getContextPath() %>/login.jsp">Logout</a>
            </div>
        </section>
    </main>

</body>
</html>