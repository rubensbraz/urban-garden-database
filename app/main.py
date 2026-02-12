from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from fastapi.middleware.cors import CORSMiddleware
import os

from app.routers import items, pages

app = FastAPI(
    title="Domestic Garden Database",
    description="A database of flora, fauna, and objects found in domestic gardens",
    version="1.0.0",
)

# CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Mount static files
app.mount("/static", StaticFiles(directory="app/static"), name="static")
app.mount("/images", StaticFiles(directory="images"), name="images")

# Include routers
app.include_router(items.router, prefix="/api", tags=["API"])
app.include_router(pages.router, tags=["Pages"])


@app.get("/health")
async def health_check():
    """Health check endpoint"""
    return {"status": "healthy"}
