<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gourmet Haven | Fine Dining Experience</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        /* Base Styles */
        :root {
            --primary: #d4af37;
            --secondary: #1a1a1a;
            --light: #f8f8f8;
            --dark: #333;
            --text: #555;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: var(--light);
            color: var(--text);
            overflow-x: hidden;
        }

        h1, h2, h3 {
            font-family: 'Playfair Display', serif;
            color: var(--secondary);
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .btn {
            display: inline-block;
            padding: 12px 30px;
            background: var(--primary);
            color: white;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(212, 175, 55, 0.3);
        }

        .section-title {
            font-size: 2.5rem;
            margin-bottom: 2rem;
            text-align: center;
            position: relative;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: var(--primary);
        }

        /* Header & Navigation */
        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            transition: all 0.3s ease;
            padding: 20px 0;
        }

        header.scrolled {
            background: rgba(26, 26, 26, 0.9);
            padding: 15px 0;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
            height: 40px;
            margin-right: 10px;
        }

        .logo h1 {
            font-size: 1.8rem;
            color: white;
        }

        .nav-links {
            display: flex;
            list-style: none;
        }

        .nav-links li {
            margin-left: 30px;
        }

        .nav-links a {
            color: white;
            font-weight: 500;
            position: relative;
            transition: all 0.3s ease;
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--primary);
            transition: width 0.3s ease;
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        .burger {
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
            display: none;
        }

        /* Hero Section */
        .hero {
            height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }

        .hero-content h2 {
            font-size: 4rem;
            margin-bottom: 20px;
            opacity: 0;
            animation: fadeIn 1s ease forwards;
        }

        .hero-content p {
            font-size: 1.2rem;
            margin-bottom: 30px;
            opacity: 0;
            animation: fadeIn 1s ease forwards 0.5s;
        }

        .hero-content .btn {
            opacity: 0;
            animation: fadeIn 1s ease forwards 1s, pulse 2s infinite 2s;
        }

        /* Menu Section */
        .menu {
            padding: 100px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 50px;
        }

        .menu-item {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            opacity: 0;
            transform: translateY(50px);
        }

        .menu-item:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }

        .menu-item img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .menu-item h3 {
            margin: 20px 0 10px;
            padding: 0 20px;
        }

        .menu-item p {
            padding: 0 20px;
            margin-bottom: 15px;
            color: var(--text);
        }

        .menu-item span {
            display: block;
            padding: 0 20px 20px;
            font-weight: 600;
            color: var(--primary);
            font-size: 1.2rem;
        }

        /* About Section */
        .about {
            padding: 100px 20px;
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)), url('https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80');
            background-size: cover;
            background-attachment: fixed;
            color: white;
            text-align: center;
        }

        .about-content {
            max-width: 800px;
            margin: 0 auto;
            opacity: 0;
            transform: translateX(-50px);
        }

        .about-content p {
            margin-bottom: 30px;
            font-size: 1.1rem;
            line-height: 1.6;
        }

        .about-content img {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid var(--primary);
            margin-top: 30px;
        }

        /* Contact Section */
        .contact {
            padding: 100px 20px;
            max-width: 800px;
            margin: 0 auto;
        }

        .contact-form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-top: 50px;
        }

        .contact-form input,
        .contact-form textarea {
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }

        .contact-form textarea {
            grid-column: span 2;
            height: 150px;
            resize: vertical;
        }

        .contact-form button {
            grid-column: span 2;
            justify-self: center;
        }

        /* Footer */
        footer {
            background: var(--secondary);
            color: white;
            text-align: center;
            padding: 50px 20px;
        }

        .social-links {
            margin-bottom: 20px;
        }

        .social-links a {
            display: inline-block;
            width: 40px;
            height: 40px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            margin: 0 10px;
            line-height: 40px;
            transition: all 0.3s ease;
        }

        .social-links a:hover {
            background: var(--primary);
            transform: translateY(-5px);
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .nav-links {
                position: fixed;
                top: 80px;
                left: -100%;
                width: 100%;
                height: calc(100vh - 80px);
                background: var(--secondary);
                flex-direction: column;
                align-items: center;
                justify-content: center;
                transition: all 0.5s ease;
            }

            .nav-links.active {
                left: 0;
            }

            .nav-links li {
                margin: 20px 0;
            }

            .burger {
                display: block;
            }

            .hero-content h2 {
                font-size: 2.5rem;
            }

            .contact-form {
                grid-template-columns: 1fr;
            }

            .contact-form textarea {
                grid-column: span 1;
            }
        }
    </style>
</head>
<body>
    <!-- Header & Navigation -->
    <header id="header">
        <nav class="navbar">
            <div class="logo">
                <img src="https://via.placeholder.com/40" alt="Gourmet Haven">
                <h1>Gourmet Haven</h1>
            </div>
            <ul class="nav-links">
                <li><a href="#home">Home</a></li>
                <li><a href="#menu">Menu</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
            <div class="burger">
                <i class="fas fa-bars"></i>
            </div>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero" id="home">
        <div class="hero-content">
            <h2>Exquisite Flavors Await</h2>
            <p>Experience culinary perfection crafted by our master chefs</p>
            <a href="#menu" class="btn">Explore Menu</a>
        </div>
    </section>

    <!-- Menu Section -->
    <section class="menu" id="menu">
        <h2 class="section-title">Our Specialties</h2>
        <div class="menu-grid">
            <div class="menu-item">
                <img src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80" alt="Truffle Pasta">
                <h3>Truffle Pasta</h3>
                <p>Creamy pasta infused with black truffle and parmesan</p>
                <span>$24.99</span>
            </div>
            <div class="menu-item">
                <img src="https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="Grilled Salmon">
                <h3>Grilled Salmon</h3>
                <p>Fresh salmon with lemon butter sauce and seasonal vegetables</p>
                <span>$28.99</span>
            </div>
            <div class="menu-item">
                <img src="https://images.unsplash.com/photo-1563805042-7684c019e1cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1527&q=80" alt="Chocolate Fondant">
                <h3>Chocolate Fondant</h3>
                <p>Decadent molten chocolate dessert with vanilla ice cream</p>
                <span>$12.99</span>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section class="about" id="about">
        <div class="about-content">
            <h2 class="section-title">Our Story</h2>
            <p>Founded in 2010, Gourmet Haven brings world-class cuisine with locally sourced ingredients. Our chefs blend tradition with innovation to create unforgettable dining experiences. We take pride in our commitment to sustainability and supporting local farmers.</p>
            <img src="https://images.unsplash.com/photo-1581349485608-9469926a8e5e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1364&q=80" alt="Master Chef">
        </div>
    </section>

    <!-- Contact Section -->
    <section class="contact" id="contact">
        <h2 class="section-title">Reserve a Table</h2>
        <form class="contact-form" action="reservation.jsp" method="POST">
            <input type="text" name="name" placeholder="Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="tel" name="phone" placeholder="Phone">
            <input type="date" name="date" placeholder="Date">
            <input type="time" name="time" placeholder="Time">
            <input type="number" name="guests" placeholder="Number of Guests" min="1">
            <textarea name="requests" placeholder="Special Requests"></textarea>
            <button type="submit" class="btn">Book Now</button>
        </form>
    </section>

    <!-- Footer -->
    <footer>
        <div class="social-links">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-tripadvisor"></i></a>
        </div>
        <p>123 Gourmet Street, Foodville</p>
        <p>Open Tuesday-Sunday: 5PM - 11PM</p>
        <p>Reservations: (555) 123-4567</p>
        <p>&copy; <%= java.time.Year.now().getValue() %> Gourmet Haven. All Rights Reserved.</p>
    </footer>

    <script>
        // Mobile Navigation Toggle
        const burger = document.querySelector('.burger');
        const navLinks = document.querySelector('.nav-links');

        burger.addEventListener('click', () => {
            navLinks.classList.toggle('active');
        });

        // Smooth Scrolling for Navigation
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();
                navLinks.classList.remove('active');
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });

        // Header Scroll Effect
        window.addEventListener('scroll', () => {
            const header = document.getElementById('header');
            header.classList.toggle('scrolled', window.scrollY > 50);
        });

        // Animation on Scroll
        const animateOnScroll = () => {
            const elements = document.querySelectorAll('.menu-item, .about-content');

            elements.forEach(element => {
                const elementPosition = element.getBoundingClientRect().top;
                const screenPosition = window.innerHeight / 1.3;

                if(elementPosition < screenPosition) {
                    element.style.opacity = '1';
                    element.style.transform = 'translateY(0)';
                    if(element.classList.contains('about-content')) {
                        element.style.transform = 'translateX(0)';
                    }
                }
            });
        };

        window.addEventListener('scroll', animateOnScroll);
        window.addEventListener('load', animateOnScroll);
    </script>
</body>
</html>%  
