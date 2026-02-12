# 🌿 Domestic Garden Database

A beautiful, modern web application to explore and manage domestic garden database items including flora, fauna, objects, and garden styles. Built with FastAPI, PostgreSQL, and Docker.

## ✨ Features

- **Dynamic Masonry Layout**: Items displayed in a Pinterest-style grid with random positioning and sizing on each page load
- **Category Filtering**: Filter by Plants, Animals, Objects, or Garden Styles with smooth grayscale transitions
- **Detailed Item Pages**: Comprehensive information pages with configurable field order and automatic hiding of empty fields
- **Image Gallery**: Support for multiple images per item with elegant presentation
- **Fully Responsive**: Beautiful design that works on all devices
- **Professional Database**: PostgreSQL with separate tables for each category
- **Easy Customization**: Extensive CSS configuration section for quick aesthetic changes
- **Containerized**: Fully Dockerized for easy deployment

## 🚀 Quick Start

### Prerequisites

- Docker and Docker Compose installed
- Your Excel database file at `data/domestic_garden_database.xlsx`
- Item images in the `images/` directory

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

4. **Import data from Excel**:

   ```bash
   docker-compose run --rm web python scripts/import_data.py
   ```

5. **Access the application**:
   - Open your browser to: <http://localhost:8000>
   - API documentation: <http://localhost:8000/docs>

## 📁 Project Structure

```
domestic_garden_database/
├── app/
│   ├── main.py                 # FastAPI application
│   ├── database.py             # Database connection
│   ├── models.py               # SQLAlchemy models
│   ├── routers/
│   │   ├── items.py            # API endpoints
│   │   └── pages.py            # Page routes
│   ├── templates/
│   │   ├── base.html           # Base template
│   │   ├── index.html          # Homepage
│   │   └── detail.html         # Detail page
│   └── static/
│       ├── css/
│       │   └── style.css       # Styles with config section
│       └── js/
│           └── main.js         # Frontend logic
├── config/
│   └── field_config.py         # Field display configuration
├── scripts/
│   └── import_data.py          # Data import script
├── alembic/                    # Database migrations
├── data/
│   └── domestic_garden_database.xlsx
├── images/                     # Item images
├── docker-compose.yml
├── Dockerfile
└── requirements.txt
```

## 🎨 Customization

### Changing the Design

All design variables are centralized in `app/static/css/style.css` at the top of the file. You can easily customize:

- **Colors**: Primary, secondary, background, text colors
- **Typography**: Font family, sizes, weights
- **Spacing**: All spacing values
- **Layout**: Grid columns, gaps, container widths
- **Animations**: Transition speeds, effects
- **Glassmorphism**: Background blur, opacity
- **Responsive breakpoints**: Mobile, tablet, desktop sizes

Simply edit the CSS variables in the configuration section - no need to touch the rest of the CSS!

### Changing Field Display Order

Edit `config/field_config.py` to change the order of fields displayed on detail pages for each category.

## 📊 Database Schema

The application uses separate tables for each category:

- `flora_angiosperm` - Flowering plants
- `flora_pteridophyte` - Ferns
- `flora_gimnosperma` - Conifers
- `flora_bryophyte` - Mosses
- `fauna` - Animals
- `objects_and_other` - Objects
- `garden_styles` - Garden styles

## 🔧 Development

### Running Locally

```bash
# Start services
docker-compose up

# View logs
docker-compose logs -f web

# Stop services
docker-compose down
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
docker-compose exec db psql -U postgres -d garden_db
```

## 📝 API Endpoints

- `GET /` - Homepage
- `GET /item/{category}/{id}` - Item detail page
- `GET /api/items` - Get all items (with optional `?category=` filter)
- `GET /api/items/{category}/{id}` - Get single item
- `GET /api/categories` - Get category counts
- `GET /health` - Health check

## 🖼️ Adding Images

1. Place your images in the `images/` directory
2. Ensure filenames match the values in your Excel spreadsheet
3. Supported formats: JPG, PNG, WebP, GIF
