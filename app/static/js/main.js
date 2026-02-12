/**
 * Domestic Garden Database - Main JavaScript
 * Handles masonry layout randomization and filtering
 */

// Category mapping for filters
const CATEGORY_MAPPING = {
    'all': ['flora_angiosperm', 'flora_pteridophyte', 'flora_gimnosperma', 'flora_bryophyte', 'fauna', 'objects_and_other', 'garden_styles'],
    'plants': ['flora_angiosperm', 'flora_pteridophyte', 'flora_gimnosperma', 'flora_bryophyte'],
    'animals': ['fauna'],
    'objects': ['objects_and_other'],
    'garden_styles': ['garden_styles']
};

/**
 * Initialize masonry layout with random sizes and positions
 */
function initMasonryLayout() {
    const grid = document.getElementById('masonryGrid');
    if (!grid) return;

    const items = Array.from(grid.children);

    // Shuffle items for random positioning
    shuffleArray(items);

    // Clear grid and re-append in random order
    grid.innerHTML = '';
    items.forEach(item => {
        // Randomly assign grid row span for varied heights
        const rowSpan = getRandomRowSpan();
        item.style.gridRow = `span ${rowSpan}`;

        grid.appendChild(item);
    });
}

/**
 * Get random row span for masonry items
 * Creates varied heights for visual interest - MORE CHAOTIC VERSION
 */
function getRandomRowSpan() {
    // Much more varied spans for chaotic layout
    const random = Math.random();
    if (random < 0.15) return 1;      // 15% tiny
    if (random < 0.30) return 2;      // 15% small
    if (random < 0.50) return 3;      // 20% medium
    if (random < 0.70) return 4;      // 20% large
    if (random < 0.85) return 5;      // 15% very large
    return 6;                          // 15% huge
}

/**
 * Shuffle array in place (Fisher-Yates algorithm)
 */
function shuffleArray(array) {
    for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
}

/**
 * Initialize filter buttons
 */
function initFilters() {
    const filterButtons = document.querySelectorAll('.filter-btn');
    const items = document.querySelectorAll('.masonry-item');

    filterButtons.forEach(button => {
        button.addEventListener('click', () => {
            const filter = button.dataset.filter;

            // Update active button
            filterButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');

            // Filter items
            filterItems(items, filter);
        });
    });
}

/**
 * Filter masonry items based on category
 */
function filterItems(items, filter) {
    const allowedCategories = CATEGORY_MAPPING[filter] || [];

    items.forEach(item => {
        const itemCategory = item.dataset.category;

        if (filter === 'all' || allowedCategories.includes(itemCategory)) {
            // Show item
            item.classList.remove('filtered');
            item.style.display = '';
        } else {
            // Hide item with grayscale effect
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
                    img.src = img.src; // Trigger load
                    observer.unobserve(img);
                }
            });
        });

        images.forEach(img => imageObserver.observe(img));
    }
}

// Initialize on page load
document.addEventListener('DOMContentLoaded', () => {
    initLazyLoading();
});
