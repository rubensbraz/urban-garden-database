
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles

from app.routers import items, pages


def create_application() -> FastAPI:
    """
    Create and configure the FastAPI application.

    Returns:
        FastAPI: The configured application instance.
    """
    application = FastAPI(
        title="Domestic Garden Database",
        description="A database of flora, fauna, and objects found in domestic gardens",
        version="1.0.0",
        docs_url="/docs",
        redoc_url="/redoc",
    )

    # CORS middleware
    application.add_middleware(
        CORSMiddleware,
        allow_origins=["*"],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    # Mount static files
    # 'app/static' stores CSS, JS, and favicons
    application.mount("/static", StaticFiles(directory="app/static"), name="static")

    # 'images' stores the actual content images (mapped via volume)
    application.mount("/images", StaticFiles(directory="images"), name="images")

    # Include routers
    application.include_router(items.router, prefix="/api", tags=["API"])
    application.include_router(pages.router, tags=["Pages"])

    return application


app = create_application()


@app.get("/health")
async def health_check() -> dict:
    """
    Health check endpoint to verify system status.

    Returns:
        dict: Status message {"status": "healthy"}
    """
    return {"status": "healthy"}
