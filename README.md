# 🌿 Domestic Garden Database

A beautiful, modern web application to explore the biodiversity of domestic gardens in Japan. Features a comprehensive database of 218+ species and items including flora, fauna, objects, and traditional garden styles. Built with FastAPI, PostgreSQL, and Docker.

## ✨ Features

### 🎨 Beautiful Design

- **Truly Random Scattered Layout**: Items positioned randomly across the screen with collision detection for an organic, Pinterest-inspired feel
- **Elegant Aesthetics**: Forest green and lime green color scheme with glassmorphism effects
- **Smart Display**: Items with images show as beautiful cards; items without images display as minimal text-only cards
- **Smooth Animations**: Staggered fade-in effects and hover interactions
- **Fully Responsive**: Optimized for mobile (375px+), tablet (768px+), and desktop (1024px+)

### 📊 Comprehensive Database

- **218 Total Records**: 94 plants, 68 animals, 40 objects, 16 garden styles
- **Standardized Schema**: Professional column names (`popular_name_en`, `scientific_name`, etc.)
- **Automatic Image Mapping**: 229 images automatically mapped to 183 items
- **JSON Image Arrays**: Flexible JSONB storage for unlimited images per item
- **Multiple Image Types**: Reference, habitat, garden, urban, leaf, flower, fruit, roots, etc.

### 🔍 Advanced Features

- **Category Filtering**: Filter by Plants, Animals, Objects, or Garden Styles
- **Detailed Item Pages**: All images displayed in gallery format with labels
- **SEO Optimized**: Complete metatags (Open Graph, Twitter Card, keywords, descriptions)
- **API Endpoints**: RESTful API for programmatic access
- **Easy Customization**: Centralized CSS variables for quick design changes

## 🚀 Quick Start

### Prerequisites

- Docker and Docker Compose installed
- Excel database file at `data/domestic_garden_database.xlsx`
- Item images in the `images/` directory (organized by category folders)

### Setup

1. **Clone the repository** (if needed)

2. **Copy environment file**:

   ```bash
   cp .env.example .env
   ```

3. **Start the application**:

   ```bash
   docker-compose up -d
   ```

4. **Import data from Excel** (with automatic image mapping):

   ```bash
   docker-compose run --rm web python scripts/import_data.py
   ```

   This will:
   - Create all database tables
   - Import all 218 records from Excel
   - Automatically map 229 images to items based on names
   - Display import summary

5. **Access the application**:
   - Homepage: <http://localhost:8000>
   - API documentation: <http://localhost:8000/docs>

## 📁 Project Structure

```
domestic_garden_database/
├── app/
│   ├── main.py                 # FastAPI application
│   ├── database.py             # Database connection
│   ├── models.py               # SQLAlchemy models (STANDARDIZED)
│   ├── routers/
│   │   ├── items.py            # API endpoints
│   │   └── pages.py            # Page routes
│   ├── templates/
│   │   ├── base.html           # Base template with SEO metatags
│   │   ├── index.html          # Homepage with scattered grid
│   │   └── detail.html         # Detail page with image gallery
│   └── static/
│       ├── css/
│       │   └── style.css       # Responsive styles with config
│       └── js/
│           └── main.js         # Scattered layout logic
├── config/
│   └── field_config.py         # Field display configuration
├── scripts/
│   └── import_data.py          # COMPREHENSIVE import with image mapping
├── alembic/                    # Database migrations
├── data/
│   └── domestic_garden_database.xlsx
├── images/                     # Item images (auto-mapped)
│   ├── Animal/
│   ├── Flora/
│   ├── Objects/
│   └── ...
├── docker-compose.yml
├── Dockerfile
└── requirements.txt
```

## 🎨 Design System

### Color Palette

- **Primary (Forest Green)**: `hsl(145, 70%, 45%)` - #3d9970
- **Secondary (Lime Green)**: `hsl(85, 65%, 50%)` - #7fcc4a
- **Background**: `hsl(240, 15%, 8%)` - Dark charcoal
- **Surface**: `hsl(240, 12%, 12%)` - Card backgrounds
- **Text Primary**: `hsl(0, 0%, 95%)` - Almost white

### Responsive Breakpoints

- **Mobile**: 480px and below
- **Tablet**: 768px and below
- **Desktop**: 1024px and below
- **Wide**: 1440px+

### Layout Features

- **Scattered Grid**: Truly random positioning with collision detection
- **Image Cards**: 280x280px (desktop), 240px (tablet), 200px (mobile)
- **Text-Only Cards**: Minimal glassmorphic design
- **Random Rotation**: Subtle -3° to +3° rotation for organic feel

## 📊 Database Schema

### Standardized Column Names

All tables now use professional, consistent naming:

**Common Fields (All Categories)**:

- `popular_name_en` - English name
- `popular_name_jp` - Japanese name
- `scientific_name` - Scientific/botanical name
- `images` - JSONB array of image objects
- `links` - Reference links
- `book_references` - Book citations
- `comments` - Additional notes

**Flora Specific**:

- `classification` - Botanical classification
- `lifecycle` - Annual/Perennial
- `months_foliage` - Foliage months
- `months_flowers` - Flowering months
- `months_fruits` - Fruiting months
- `origin` - Geographic origin
- `garden_type` - Garden type preference
- `cultural_info` - Cultural significance
- `habitat` - Where found

**Fauna Specific**:

- `animal_class` - Taxonomic class
- `diet_type` - Herbivore/Carnivore/Omnivore
- `diet_natural` - Natural diet
- `diet_urban` - Urban diet
- `active_period` - Activity period
- `origin_status` - Native/Introduced
- `cultural_info` - Cultural significance
- `habitat` - Where found

### Tables

- `flora_angiosperm` - Flowering plants (84 records)
- `flora_pteridophyte` - Ferns (1 record)
- `flora_gimnosperma` - Conifers (3 records)
- `flora_bryophyte` - Mosses (6 records)
- `fauna` - Animals (68 records)
- `objects_and_other` - Objects (40 records)
- `garden_styles` - Garden styles (16 records)

## 🖼️ Image System

### Automatic Image Mapping

The import script automatically maps images to database items:

1. **Parses filenames**: `"Tanuki - Animal Picture.jpg"` → item: "Tanuki", type: "animal"
2. **Normalizes names**: Removes spaces, special chars, lowercase
3. **Matches by priority**:
   - Scientific name (highest priority)
   - Popular name English
   - Popular name Japanese
4. **Stores in JSON**: `[{"type": "animal", "path": "Animal/Tanuki - Animal Picture.jpg"}]`

### Image Types

- **Flora**: reference, leaf, roots, flower, fruit
- **Fauna**: animal, habitat_natural, garden, urban
- **Objects**: reference, context

### Adding New Images

1. Place images in appropriate category folder (`images/Animal/`, `images/Flora/`, etc.)
2. Name files with pattern: `"{Item Name} - {Type} Picture.{ext}"`
3. Re-run import script to update mappings

## 🔧 Development

### Running Locally

```bash
# Start services
docker-compose up

# View logs
docker-compose logs -f web

# Stop services
docker-compose down

# Rebuild after code changes
docker-compose up -d --build
```

### Database Migrations

```bash
# Create a new migration
docker-compose run --rm web alembic revision --autogenerate -m "description"

# Apply migrations
docker-compose run --rm web alembic upgrade head
```

### Accessing the Database

```bash
# PostgreSQL CLI
docker-compose exec db psql -U postgres -d garden_db

# Example queries
SELECT popular_name_en, jsonb_array_length(images) as image_count 
FROM fauna 
WHERE images IS NOT NULL 
LIMIT 10;
```

### Re-importing Data

```bash
# Clean import (drops and recreates tables)
docker-compose down -v
docker-compose up -d
docker-compose run --rm web python scripts/import_data.py
```

## 📝 API Endpoints

### Pages

- `GET /` - Homepage with scattered grid
- `GET /item/{category}/{id}` - Item detail page with image gallery

### API

- `GET /api/items` - Get all items (optional `?category=plants|animals|objects|garden_styles`)
- `GET /api/items/{category}/{id}` - Get single item with all fields
- `GET /api/categories` - Get category counts
- `GET /health` - Health check

### Example API Usage

```bash
# Get all animals
curl http://localhost:8000/api/items?category=animals

# Get specific item
curl http://localhost:8000/api/items/fauna/1

# Get category counts
curl http://localhost:8000/api/categories
```

## 🎨 Customization

### Changing Colors

Edit `app/static/css/style.css` CSS variables:

```css
:root {
    --color-primary: hsl(145, 70%, 45%);      /* Forest green */
    --color-secondary: hsl(85, 65%, 50%);     /* Lime green */
    --color-background: hsl(240, 15%, 8%);    /* Dark background */
    /* ... */
}
```

### Changing Field Display Order

Edit `config/field_config.py`:

```python
FAUNA_FIELDS = [
    ("Popular Name (English)", "popular_name_en"),
    ("Scientific Name", "scientific_name"),
    # ... add/remove/reorder fields
]
```

### Changing Layout

Edit CSS variables in `style.css`:

```css
:root {
    --container-max-width: 1600px;
    --card-border-radius: 12px;
    --spacing-lg: 24px;
    /* ... */
}
```

## 📈 Import Statistics

Last successful import:

- **Total Records**: 218
- **Flora | Angiosperm**: 84
- **Flora | Pteridophyte**: 1
- **Flora | Gimnosperma**: 3
- **Flora | Bryophyte**: 6
- **Fauna**: 68
- **Objects and Other**: 40
- **Garden Styles**: 16
- **Images Mapped**: 229 images to 183 unique items

## 🐛 Troubleshooting

### Images not showing

- Check image paths in database: `SELECT images FROM fauna LIMIT 5;`
- Verify images exist in `images/` directory
- Check Docker volume mounts in `docker-compose.yml`

### Import fails

- Check Excel file format matches expected columns
- Verify all required columns exist
- Check logs: `docker-compose logs web`

### Layout issues

- Clear browser cache
- Check browser console for JavaScript errors
- Verify all CSS/JS files are loading

## 📄 License

This project is for educational and research purposes.

## 🙏 Acknowledgments

Built with:

- FastAPI - Modern Python web framework
- PostgreSQL - Robust database
- SQLAlchemy - ORM
- Docker - Containerization
- Inter Font - Typography
