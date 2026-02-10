
// DOM Content Loaded to ensure all assets are ready
document.addEventListener('DOMContentLoaded', () => {

    /* --- Scroll Animations --- */
    const fadeElements = document.querySelectorAll('.fade-in-up');
    
    // Intersection Observer for scroll triggers
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                // Optional: Stop observing after first trigger for performance
                // observer.unobserve(entry.target);
            }
        });
    }, {
        threshold: 0.1, // Trigger when 10% of the element is visible
        rootMargin: "0px"
    });

    fadeElements.forEach(el => observer.observe(el));


    /* --- Mobile Navigation --- */
    const menuBtn = document.getElementById('menu-btn');
    const mobileMenu = document.getElementById('mobile-menu');
    const closeMenuBtn = document.getElementById('close-menu-btn');

    if (menuBtn && mobileMenu && closeMenuBtn) {
        menuBtn.addEventListener('click', () => {
            mobileMenu.classList.remove('hidden');
            setTimeout(() => {
                mobileMenu.classList.remove('translate-x-full');
            }, 10); // Small delay for CSS transition
        });

        closeMenuBtn.addEventListener('click', () => {
            mobileMenu.classList.add('translate-x-full');
            setTimeout(() => {
                mobileMenu.classList.add('hidden');
            }, 300); // Waits for transition to finish
        });
    }

    /* --- Gemstone Modal Logic --- */
    // Open modal function (exposed globally for inline onclicks in HTML if needed, though event listeners are better)
    window.openGemModal = (title, desc, imgSrc) => {
        const modal = document.getElementById('gem-modal');
        const modalTitle = document.getElementById('modal-title');
        const modalDesc = document.getElementById('modal-desc');
        const modalImg = document.getElementById('modal-img');

        if (modal && modalTitle && modalDesc && modalImg) {
            modalTitle.textContent = title;
            modalDesc.textContent = desc;
            modalImg.src = imgSrc;
            
            modal.classList.remove('hidden');
            setTimeout(() => {
                modal.classList.remove('opacity-0');
                modal.querySelector('div').classList.remove('scale-95'); // Scale up content
                modal.querySelector('div').classList.add('scale-100');
            }, 10);
        }
    };

    window.closeGemModal = () => {
        const modal = document.getElementById('gem-modal');
        if (modal) {
            modal.classList.add('opacity-0');
            const content = modal.querySelector('div');
            if (content) {
                content.classList.remove('scale-100');
                content.classList.add('scale-95');
            }
            setTimeout(() => {
                modal.classList.add('hidden');
            }, 300);
        }
    };

    // Close on simple outside click
    const gemModal = document.getElementById('gem-modal');
    if (gemModal) {
        gemModal.addEventListener('click', (e) => {
            if (e.target === gemModal) {
                window.closeGemModal();
            }
        });
    }


    /* --- Smooth Scroll for Anchor Links --- */
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });

    /* --- Sticky Navigation Logic (Optional Luxury Touch) --- */
    const navbar = document.querySelector('nav');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            navbar.classList.add('bg-opacity-95', 'backdrop-blur-md', 'shadow-lg');
            navbar.classList.remove('bg-opacity-0');
        } else {
            navbar.classList.remove('bg-opacity-95', 'backdrop-blur-md', 'shadow-lg');
            navbar.classList.add('bg-opacity-0'); // or transparent if initialized that way
        }
    });

});
