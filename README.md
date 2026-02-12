# 🌿 Domestic Garden Database

A beautiful, modern web application to explore the biodiversity of domestic gardens in Japan. Features a comprehensive database of 218+ species including flora, fauna, objects, and garden styles.

## Quick Start

### Prerequisites

- Docker and Docker Compose.

### Setup

1. **Clone the repository**:

   ```bash
   git clone https://github.com/rubensbraz/domestic_garden_database
   cd domestic_garden_database
   ```

2. **Start the application**:

   ```bash
   docker-compose up -d
   ```

3. **Import Data & Map Images**:

   ```bash
   docker-compose run --rm web python scripts/import_data.py
   ```

   *This script automatically imports data from Excel and maps images from the `images/` directory.*

4. **Access the App**:
   - Web Interface: [http://localhost:8015](http://localhost:8015)
   - API Docs: [http://localhost:8015/docs](http://localhost:8015/docs)

## Configuration

The application is configured via the `.env` file. You can adjust the following settings:

- **APP_PORT**: The port the application runs on (default: `8015`).
- **DEBUG**: Set to `True` for development, `False` for production.
- **Database**: `POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB`.

## Project Structure

```text
domestic_garden_database/
├── app/
│   ├── main.py                 # FastAPI application
│   ├── models.py               # Database models
│   ├── routers/                # API and Page routes
│   └── static/                 # CSS, JS, and Assets
├── scripts/
│   ├── import_data.py          # Data import & Image mapping
│   ├── convert_images.py       # WebP conversion utility
│   └── update_db_images.py     # Database image path updater
├── data/                       # Excel source file
├── images/                     # Source images (Flora, Fauna, etc.)
├── docker-compose.yml
└── requirements.txt
```

## Management

### Converting Images to WebP

To optimize new images, run the conversion script:

```bash
docker-compose run --rm web python scripts/convert_images.py
```

### Updating Database Links

If you add or rename images, update the database references:

```bash
docker-compose run --rm web python scripts/update_db_images.py
```

## Tech Stack

- **Backend**: FastAPI, SQLAlchemy, PostgreSQL
- **Frontend**: HTML5, CSS3, Vanilla JS
- **Infrastructure**: Docker, Docker Compose
