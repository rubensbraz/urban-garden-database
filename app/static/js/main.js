/**
 * Domestic Garden Database - Main JavaScript
 * Handles random scattered layout, filtering, and interactive elements.
 * 
 * @module Main
 */

'use strict';

/**
 * Configuration constants
 */
const CONFIG = {
    GRID_ID: 'scatteredGrid',
    ANIMATION_DURATION: 400, // ms
    ITEM: {
        WIDTH_STANDARD: 280,
        HEIGHT_STANDARD: 280,
        WIDTH_TEXT: 250,
        HEIGHT_TEXT: 100,
        PADDING: 40, // Padding around items
        MARGIN: 20   // Margin from container edges
    },
    LIGHTBOX: {
        MAX_ZOOM: 5,
        MIN_ZOOM: 1,
        ZOOM_STEP: 0.5
    }
};

/**
 * Category mapping for filters
 * Maps filter keys to display category names
 */
const CATEGORY_MAPPING = {
    'all': ['Plants', 'Animals', 'Objects', 'Garden Styles'],
    'plants': ['Plants'],
    'animals': ['Animals'],
    'objects': ['Objects'],
    'garden_styles': ['Garden Styles']
};

/**
 * Initialize scattered layout with random positions.
 * Calculates optimal grid height and places items to minimize overlap.
 */
function initScatteredLayout() {
    const grid = document.getElementById(CONFIG.GRID_ID);
    if (!grid) {
        console.error('Grid element not found:', CONFIG.GRID_ID);
        return;
    }

    const items = Array.from(grid.children);
    const containerWidth = grid.offsetWidth;

    // Calculate grid height based on number of items
    // Estimated height helps define the boundary for random placement
    const itemsCount = items.length;
    const estimatedHeight = Math.max(1800, Math.ceil(itemsCount / 3.5) * 380);
    grid.style.minHeight = `${estimatedHeight}px`;

    // Track occupied spaces to avoid too much overlap
    // Array of {x, y, width, height} objects
    const occupiedSpaces = [];

    items.forEach((item, index) => {
        const isTextOnly = item.classList.contains('text-only');
        const itemWidth = isTextOnly ? CONFIG.ITEM.WIDTH_TEXT : CONFIG.ITEM.WIDTH_STANDARD;
        const itemHeight = isTextOnly ? CONFIG.ITEM.HEIGHT_TEXT : CONFIG.ITEM.HEIGHT_STANDARD;

        let position = null;
        let attempts = 0;
        const maxAttempts = 50;

        // Try to find a non-overlapping position
        while (!position && attempts < maxAttempts) {
            const x = Math.random() * (containerWidth - itemWidth - CONFIG.ITEM.PADDING) + CONFIG.ITEM.MARGIN;
            const y = Math.random() * (estimatedHeight - itemHeight - CONFIG.ITEM.PADDING) + CONFIG.ITEM.MARGIN;

            // Check if this position overlaps too much with existing items
            const overlaps = occupiedSpaces.some(space => {
                // Allow 15% overlap
                const overlapX = Math.abs(space.x - x) < (space.width + itemWidth) * 0.15;
                const overlapY = Math.abs(space.y - y) < (space.height + itemHeight) * 0.15;
                return overlapX && overlapY;
            });

            if (!overlaps || attempts > 45) {
                position = { x, y };
            }

            attempts++;
        }

        // Fallback position if no good spot found (grid-like placement)
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

        // Add random subtle rotation for more organic feel (-3deg to +3deg)
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

    console.log(`Initialized layout for ${items.length} items`);
}

/**
 * Make an item draggable via mouse interaction.
 * Handles drag start, move, and end events, updating element position.
 * 
 * @param {HTMLElement} item - The DOM element to make draggable
 */
function makeDraggable(item) {
    let isDragging = false;
    let startX, startY;
    let initialLeft, initialTop;

    // Prevent default link behavior on drag
    item.addEventListener('dragstart', (e) => e.preventDefault());

    item.addEventListener('mousedown', function (e) {
        // Only trigger on left click
        if (e.button !== 0) return;

        e.preventDefault(); // Prevent text selection/link dragging
        isDragging = true;

        // Get current position
        initialLeft = parseInt(item.style.left) || 0;
        initialTop = parseInt(item.style.top) || 0;

        // Store mouse start position
        startX = e.clientX;
        startY = e.clientY;

        item.style.cursor = 'grabbing';
        item.style.zIndex = '1000'; // Bring to front
    });

    document.addEventListener('mousemove', function (e) {
        if (!isDragging) return;

        e.preventDefault();

        // Calculate delta and new position
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
            item.style.zIndex = ''; // Reset z-index

            // Update initial position for next drag
            initialLeft = parseInt(item.style.left) || 0;
            initialTop = parseInt(item.style.top) || 0;
        }
    });

    // Set initial cursor
    item.style.cursor = 'grab';

    // Prevent link navigation if drag distance was significant
    item.addEventListener('click', function (e) {
        if (Math.abs(e.clientX - startX) > 5 || Math.abs(e.clientY - startY) > 5) {
            e.preventDefault();
            e.stopPropagation();
        }
    });
}

/**
 * Initialize category filter buttons.
 * Sets up click listeners to filter the grid items.
 */
function initFilters() {
    const filterButtons = document.querySelectorAll('.filter-btn');
    const items = document.querySelectorAll('.scattered-item');

    if (filterButtons.length === 0) return;

    filterButtons.forEach(button => {
        button.addEventListener('click', () => {
            const filter = button.dataset.filter;

            // Update active button state
            filterButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');

            // Apply filter
            filterItems(items, filter);
        });
    });
}

/**
 * Filter grid items based on selected category.
 * Toggles the 'filtered' class to show/hide items.
 * 
 * @param {NodeList} items - List of grid item elements
 * @param {string} filter - Selected filter category
 */
function filterItems(items, filter) {
    const allowedCategories = CATEGORY_MAPPING[filter] || [];

    items.forEach(item => {
        const itemDisplayCategory = item.dataset.displayCategory;

        if (filter === 'all' || allowedCategories.includes(itemDisplayCategory)) {
            item.classList.remove('filtered');
        } else {
            item.classList.add('filtered');
        }
    });
}

/**
 * Initialize Intersection Observer for lazy loading images.
 * Replaces 'loading="lazy"' logic with manual observer if needed,
 * though native browser lazy loading is preferred where supported.
 * This implementation forces src reload to trigger fade-in if needed.
 */
function initLazyLoading() {
    const images = document.querySelectorAll('img[loading="lazy"]');

    if ('IntersectionObserver' in window) {
        const imageObserver = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const img = entry.target;
                    // Trigger load/render if needed (mostly handled by browser)
                    observer.unobserve(img);
                }
            });
        });

        images.forEach(img => imageObserver.observe(img));
    }
}

/**
 * Inject CSS animations dynamically.
 */
function injectAnimations() {
    // Check if style already exists
    if (document.getElementById('dynamic-animations')) return;

    const style = document.createElement('style');
    style.id = 'dynamic-animations';
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
}

/**
 * Image Lightbox with Zoom and Pan functionality.
 * Handles opening, closing, zooming, and panning of images in a modal.
 */
class ImageLightbox {
    constructor() {
        this.currentImage = null;
        this.currentZoom = 1;
        this.maxZoom = CONFIG.LIGHTBOX.MAX_ZOOM;
        this.minZoom = CONFIG.LIGHTBOX.MIN_ZOOM;
        this.zoomStep = CONFIG.LIGHTBOX.ZOOM_STEP;

        // Panning state
        this.panX = 0;
        this.panY = 0;
        this.isDragging = false;
        this.startX = 0;
        this.startY = 0;

        this.init();
    }

    /**
     * Create lightbox DOM elements and attach events
     */
    init() {
        this.createLightboxElements();
        this.attachEventListeners();
    }

    /**
     * Generate HTML structure for the lightbox
     */
    createLightboxElements() {
        // Prevent duplicate lightbox
        if (document.getElementById('imageLightbox')) return;

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

    /**
     * Attach event listeners for controls and interactions
     */
    attachEventListeners() {
        const closeBtn = this.lightbox.querySelector('.lightbox-close');
        const backdrop = this.lightbox.querySelector('.lightbox-backdrop');
        const zoomInBtn = this.lightbox.querySelector('.lightbox-zoom-in');
        const zoomOutBtn = this.lightbox.querySelector('.lightbox-zoom-out');
        const resetBtn = this.lightbox.querySelector('.lightbox-reset');

        if (closeBtn) closeBtn.addEventListener('click', () => this.close());
        if (backdrop) backdrop.addEventListener('click', () => this.close());
        if (zoomInBtn) zoomInBtn.addEventListener('click', () => this.zoomIn());
        if (zoomOutBtn) zoomOutBtn.addEventListener('click', () => this.zoomOut());
        if (resetBtn) resetBtn.addEventListener('click', () => this.resetZoom());

        // Mouse wheel zoom
        this.imageContainer.addEventListener('wheel', (e) => {
            e.preventDefault();
            if (e.deltaY < 0) {
                this.zoomIn();
            } else {
                this.zoomOut();
            }
        });

        // Panning
        this.image.addEventListener('mousedown', (e) => this.startPan(e));
        document.addEventListener('mousemove', (e) => this.pan(e));
        document.addEventListener('mouseup', () => this.endPan());

        // Keyboard navigation
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

        // Delegate click for detail images to open lightbox
        document.addEventListener('click', (e) => {
            if (e.target.matches('.detail-image img')) {
                e.preventDefault();
                this.open(e.target.src, e.target.alt);
            }
        });
    }

    /**
     * Open lightbox with specific image
     * @param {string} src - Image URL
     * @param {string} alt - Image alt text
     */
    open(src, alt) {
        this.currentImage = src;
        this.image.src = src;
        this.image.alt = alt || 'Image';
        this.lightbox.classList.add('active');
        document.body.style.overflow = 'hidden'; // Disable background scroll
        this.resetZoom();
    }

    /**
     * Close lightbox and cleanup
     */
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
        // Apply transform with current zoom and pan translation
        this.image.style.transform = `scale(${this.currentZoom}) translate(${this.panX}px, ${this.panY}px)`;
        this.zoomLevel.textContent = `${Math.round(this.currentZoom * 100)}%`;

        // Change cursor to indicate pannaability
        this.image.style.cursor = this.currentZoom > 1 ? 'move' : 'default';
    }

    startPan(e) {
        if (this.currentZoom > 1) {
            this.isDragging = true;
            // Calculate start position relative to current pan
            // Note: We divide by zoom to keep pan in sync with mouse movement visually
            this.startX = e.clientX;
            this.startY = e.clientY;

            // Store current pan state
            this.startPanX = this.panX;
            this.startPanY = this.panY;

            this.image.style.cursor = 'grabbing';
            e.preventDefault(); // Prevent default drag
        }
    }

    pan(e) {
        if (this.isDragging) {
            // Calculate delta
            const deltaX = (e.clientX - this.startX) / this.currentZoom;
            const deltaY = (e.clientY - this.startY) / this.currentZoom;

            this.panX = this.startPanX + deltaX;
            this.panY = this.startPanY + deltaY;

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

// Initialize application on DOMContentLoaded
document.addEventListener('DOMContentLoaded', () => {
    // Inject styles
    injectAnimations();

    // Initialize standard features
    window.scrollTo(0, 0);
    initLazyLoading();

    // Initialize Layout and Filters if on homepage
    if (document.getElementById(CONFIG.GRID_ID)) {
        initScatteredLayout();
        initFilters();
    }

    // Initialize Lightbox
    new ImageLightbox();

    console.log('App initialized');
});

// Re-layout on window resize (debounced)
let resizeTimeout;
window.addEventListener('resize', () => {
    clearTimeout(resizeTimeout);
    resizeTimeout = setTimeout(() => {
        const grid = document.getElementById(CONFIG.GRID_ID);
        if (grid) {
            initScatteredLayout();
        }
    }, 250);
});
