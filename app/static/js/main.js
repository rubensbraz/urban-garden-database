/**
 * Domestic Garden Database - Main JavaScript
 * Handles truly random scattered layout and filtering
 */

// Category mapping for filters
const CATEGORY_MAPPING = {
    'all': ['Plants', 'Animals', 'Objects', 'Garden Styles'],
    'plants': ['Plants'],
    'animals': ['Animals'],
    'objects': ['Objects'],
    'garden_styles': ['Garden Styles']
};

/**
 * Initialize scattered layout with truly random positions
 */
function initScatteredLayout() {
    console.log('initScatteredLayout called');
    const grid = document.getElementById('scatteredGrid');
    if (!grid) {
        console.error('Grid not found!');
        return;
    }

    const items = Array.from(grid.children);
    console.log(`Found ${items.length} items`);
    const containerWidth = grid.offsetWidth;

    // Calculate grid height based on number of items
    const itemsCount = items.length;
    const estimatedHeight = Math.max(1800, Math.ceil(itemsCount / 3.5) * 380);
    grid.style.minHeight = `${estimatedHeight}px`;

    // Track occupied spaces to avoid too much overlap
    const occupiedSpaces = [];

    items.forEach((item, index) => {
        const isTextOnly = item.classList.contains('text-only');
        const itemWidth = isTextOnly ? 250 : 280;
        const itemHeight = isTextOnly ? 100 : 280;

        let position = null;
        let attempts = 0;
        const maxAttempts = 50;

        // Try to find a non-overlapping position
        while (!position && attempts < maxAttempts) {
            const x = Math.random() * (containerWidth - itemWidth - 40) + 20;
            const y = Math.random() * (estimatedHeight - itemHeight - 40) + 20;

            // Check if this position overlaps too much with existing items
            const overlaps = occupiedSpaces.some(space => {
                const overlapX = Math.abs(space.x - x) < (space.width + itemWidth) * 0.15;
                const overlapY = Math.abs(space.y - y) < (space.height + itemHeight) * 0.15;
                return overlapX && overlapY;
            });

            if (!overlaps || attempts > 45) {
                position = { x, y };
            }

            attempts++;
        }

        // Fallback position if no good spot found
        if (!position) {
            const row = Math.floor(index / 5);
            const col = index % 5;
            position = {
                x: col * (containerWidth / 5) + Math.random() * 50,
                y: row * 350 + Math.random() * 50
            };
        }

        // Apply position
        item.style.left = `${position.x}px`;
        item.style.top = `${position.y}px`;

        // Add random subtle rotation for more organic feel
        const rotation = (Math.random() - 0.5) * 6;
        item.style.transform = `rotate(${rotation}deg)`;

        // Store occupied space
        occupiedSpaces.push({
            x: position.x,
            y: position.y,
            width: itemWidth,
            height: itemHeight
        });

        // Add staggered fade-in animation
        item.style.opacity = '0';
        item.style.animation = `fadeIn 0.4s ease forwards ${index * 0.01}s`;

        // Make items draggable
        makeDraggable(item);
    });

    console.log('Layout initialized successfully');
}

/**
 * Make an item draggable - FIXED VERSION
 */
function makeDraggable(item) {
    let isDragging = false;
    let startX, startY;
    let initialLeft, initialTop;

    // Prevent default link behavior
    item.addEventListener('dragstart', (e) => e.preventDefault());

    item.addEventListener('mousedown', function (e) {
        // Prevent link navigation
        e.preventDefault();

        isDragging = true;

        // Get current position
        initialLeft = parseInt(item.style.left) || 0;
        initialTop = parseInt(item.style.top) || 0;

        // Store mouse start position
        startX = e.clientX;
        startY = e.clientY;

        item.style.cursor = 'grabbing';
        item.style.zIndex = '1000';
    });

    document.addEventListener('mousemove', function (e) {
        if (!isDragging) return;

        e.preventDefault();

        // Calculate new position
        const deltaX = e.clientX - startX;
        const deltaY = e.clientY - startY;

        const newLeft = initialLeft + deltaX;
        const newTop = initialTop + deltaY;

        item.style.left = `${newLeft}px`;
        item.style.top = `${newTop}px`;
    });

    document.addEventListener('mouseup', function (e) {
        if (isDragging) {
            isDragging = false;
            item.style.cursor = 'grab';
            item.style.zIndex = '';

            // Update initial position for next drag
            initialLeft = parseInt(item.style.left) || 0;
            initialTop = parseInt(item.style.top) || 0;
        }
    });

    // Set initial cursor
    item.style.cursor = 'grab';

    // Prevent link click when dragging
    item.addEventListener('click', function (e) {
        if (Math.abs(e.clientX - startX) > 5 || Math.abs(e.clientY - startY) > 5) {
            e.preventDefault();
            e.stopPropagation();
        }
    });
}

/**
 * Initialize filter buttons
 */
function initFilters() {
    console.log('initFilters called');
    const filterButtons = document.querySelectorAll('.filter-btn');
    const items = document.querySelectorAll('.scattered-item');

    console.log(`Found ${filterButtons.length} filter buttons`);
    console.log(`Found ${items.length} items to filter`);

    filterButtons.forEach(button => {
        button.addEventListener('click', () => {
            const filter = button.dataset.filter;
            console.log(`Filter clicked: ${filter}`);

            // Update active button
            filterButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');

            // Filter items
            filterItems(items, filter);
        });
    });
}

/**
 * Filter scattered items based on category
 */
function filterItems(items, filter) {
    const allowedCategories = CATEGORY_MAPPING[filter] || [];
    console.log(`Filtering for: ${filter}, allowed categories:`, allowedCategories);

    items.forEach(item => {
        const itemDisplayCategory = item.dataset.displayCategory;
        console.log(`Item category: ${itemDisplayCategory}`);

        if (filter === 'all' || allowedCategories.includes(itemDisplayCategory)) {
            item.classList.remove('filtered');
        } else {
            item.classList.add('filtered');
        }
    });
}

/**
 * Lazy load images
 */
function initLazyLoading() {
    const images = document.querySelectorAll('img[loading="lazy"]');

    if ('IntersectionObserver' in window) {
        const imageObserver = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const img = entry.target;
                    img.src = img.src;
                    observer.unobserve(img);
                }
            });
        });

        images.forEach(img => imageObserver.observe(img));
    }
}

// Add CSS animation for fade-in
const style = document.createElement('style');
style.textContent = `
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(20px) rotate(var(--initial-rotation, 0deg));
        }
        to {
            opacity: 1;
            transform: translateY(0) rotate(var(--initial-rotation, 0deg));
        }
    }
`;
document.head.appendChild(style);

// Initialize on page load
document.addEventListener('DOMContentLoaded', () => {
    console.log('DOM loaded, initializing...');
    window.scrollTo(0, 0);
    initLazyLoading();
});

// Re-layout on window resize (debounced)
let resizeTimeout;
window.addEventListener('resize', () => {
    clearTimeout(resizeTimeout);
    resizeTimeout = setTimeout(() => {
        const grid = document.getElementById('scatteredGrid');
        if (grid) {
            initScatteredLayout();
        }
    }, 250);
});

/**
 * Image Lightbox with Zoom
 */
class ImageLightbox {
    constructor() {
        this.currentImage = null;
        this.currentZoom = 1;
        this.maxZoom = 5;
        this.minZoom = 1;
        this.zoomStep = 0.5;
        this.panX = 0;
        this.panY = 0;
        this.isDragging = false;
        this.startX = 0;
        this.startY = 0;

        this.createLightbox();
        this.attachEventListeners();
    }

    createLightbox() {
        const lightbox = document.createElement('div');
        lightbox.id = 'imageLightbox';
        lightbox.className = 'lightbox';
        lightbox.innerHTML = `
            <div class="lightbox-backdrop"></div>
            <div class="lightbox-content">
                <button class="lightbox-close" aria-label="Close">&times;</button>
                <div class="lightbox-controls">
                    <button class="lightbox-zoom-out" aria-label="Zoom Out">−</button>
                    <span class="lightbox-zoom-level">100%</span>
                    <button class="lightbox-zoom-in" aria-label="Zoom In">+</button>
                    <button class="lightbox-reset" aria-label="Reset Zoom">Reset</button>
                </div>
                <div class="lightbox-image-container">
                    <img class="lightbox-image" src="" alt="">
                </div>
            </div>
        `;
        document.body.appendChild(lightbox);

        this.lightbox = lightbox;
        this.image = lightbox.querySelector('.lightbox-image');
        this.imageContainer = lightbox.querySelector('.lightbox-image-container');
        this.zoomLevel = lightbox.querySelector('.lightbox-zoom-level');
    }

    attachEventListeners() {
        this.lightbox.querySelector('.lightbox-close').addEventListener('click', () => this.close());
        this.lightbox.querySelector('.lightbox-backdrop').addEventListener('click', () => this.close());

        this.lightbox.querySelector('.lightbox-zoom-in').addEventListener('click', () => this.zoomIn());
        this.lightbox.querySelector('.lightbox-zoom-out').addEventListener('click', () => this.zoomOut());
        this.lightbox.querySelector('.lightbox-reset').addEventListener('click', () => this.resetZoom());

        this.imageContainer.addEventListener('wheel', (e) => {
            e.preventDefault();
            if (e.deltaY < 0) {
                this.zoomIn();
            } else {
                this.zoomOut();
            }
        });

        this.image.addEventListener('mousedown', (e) => this.startPan(e));
        document.addEventListener('mousemove', (e) => this.pan(e));
        document.addEventListener('mouseup', () => this.endPan());

        document.addEventListener('keydown', (e) => {
            if (!this.lightbox.classList.contains('active')) return;

            switch (e.key) {
                case 'Escape':
                    this.close();
                    break;
                case '+':
                case '=':
                    this.zoomIn();
                    break;
                case '-':
                case '_':
                    this.zoomOut();
                    break;
                case '0':
                    this.resetZoom();
                    break;
            }
        });

        document.addEventListener('click', (e) => {
            if (e.target.matches('.detail-image img')) {
                e.preventDefault();
                this.open(e.target.src, e.target.alt);
            }
        });
    }

    open(src, alt) {
        this.currentImage = src;
        this.image.src = src;
        this.image.alt = alt;
        this.lightbox.classList.add('active');
        document.body.style.overflow = 'hidden';
        this.resetZoom();
    }

    close() {
        this.lightbox.classList.remove('active');
        document.body.style.overflow = '';
        this.resetZoom();
    }

    zoomIn() {
        if (this.currentZoom < this.maxZoom) {
            this.currentZoom += this.zoomStep;
            this.updateZoom();
        }
    }

    zoomOut() {
        if (this.currentZoom > this.minZoom) {
            this.currentZoom -= this.zoomStep;
            this.updateZoom();
        }
    }

    resetZoom() {
        this.currentZoom = 1;
        this.panX = 0;
        this.panY = 0;
        this.updateZoom();
    }

    updateZoom() {
        this.image.style.transform = `scale(${this.currentZoom}) translate(${this.panX}px, ${this.panY}px)`;
        this.zoomLevel.textContent = `${Math.round(this.currentZoom * 100)}%`;
        this.image.style.cursor = this.currentZoom > 1 ? 'move' : 'default';
    }

    startPan(e) {
        if (this.currentZoom > 1) {
            this.isDragging = true;
            this.startX = e.clientX - this.panX;
            this.startY = e.clientY - this.panY;
            this.image.style.cursor = 'grabbing';
        }
    }

    pan(e) {
        if (this.isDragging) {
            this.panX = e.clientX - this.startX;
            this.panY = e.clientY - this.startY;
            this.updateZoom();
        }
    }

    endPan() {
        this.isDragging = false;
        if (this.currentZoom > 1) {
            this.image.style.cursor = 'move';
        }
    }
}

// Initialize lightbox when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    new ImageLightbox();
});
