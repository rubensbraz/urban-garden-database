from typing import Any, Dict, List, Optional

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from app.database import get_db
from app.models import (
    Fauna,
    FloraAngiosperm,
    FloraBryophyte,
    FloraGimnosperma,
    FloraPteridophyte,
    GardenStyle,
    ObjectsAndOther,
)
from config.field_config import CATEGORY_DISPLAY_NAMES, FILTER_CATEGORIES

router = APIRouter()


def get_primary_image(item: Any) -> Optional[str]:
    """
    Extract the primary image path from an item's JSON array.

    Prioritizes images with type 'reference' or 'animal'.
    If not found, returns the first available image.

    Args:
        item: The database model instance.

    Returns:
        Optional[str]: Path to the image file, or None if no image exists.
    """
    if hasattr(item, "images") and item.images:
        # Try to find 'reference' or 'animal' type first
        for img in item.images:
            if isinstance(img, dict):
                img_type = img.get("type", "")
                if img_type in ["reference", "animal"]:
                    return img.get("path")

        # If no preferred type found, return first image
        if isinstance(item.images[0], dict):
            return item.images[0].get("path")

    return None


def get_all_items(db: Session) -> List[Dict[str, Any]]:
    """
    Retrieve all items from all tables in the database.

    Aggregates data from Flora, Fauna, Objects, and Garden Styles tables
    into a unified list for the frontend grid.

    Args:
        db: Database session.

    Returns:
        List[Dict[str, Any]]: List of standardized item dictionaries.
    """
    items = []

    # Helper function to process items
    def process_items(query_result, category_key):
        for item in query_result:
            # Handle name field variations (some use name_jp, others popular_name_jp)
            jp_name = getattr(item, "popular_name_jp", getattr(item, "name_jp", ""))

            items.append(
                {
                    "id": item.id,
                    "category": category_key,
                    "display_category": CATEGORY_DISPLAY_NAMES[category_key],
                    "popular_name_english": item.popular_name_en,
                    "popular_name_japanese": jp_name,
                    "image": get_primary_image(item),
                }
            )

    # Flora Angiosperm
    process_items(db.query(FloraAngiosperm).all(), "flora_angiosperm")

    # Flora Pteridophyte
    process_items(db.query(FloraPteridophyte).all(), "flora_pteridophyte")

    # Flora Gimnosperma
    process_items(db.query(FloraGimnosperma).all(), "flora_gimnosperma")

    # Flora Bryophyte
    process_items(db.query(FloraBryophyte).all(), "flora_bryophyte")

    # Fauna
    process_items(db.query(Fauna).all(), "fauna")

    # Objects
    process_items(db.query(ObjectsAndOther).all(), "objects_and_other")

    # Garden Styles
    process_items(db.query(GardenStyle).all(), "garden_styles")

    return items


@router.get("/items")
async def get_items(
    category: Optional[str] = None, db: Session = Depends(get_db)
) -> Dict[str, Any]:
    """
    Get all items, optionally filtered by category.

    Args:
        category: Optional category filter (e.g., 'plants', 'animals').
        db: Database session.

    Returns:
        Dict: Dictionary containing 'items' list and 'total' count.
    """
    items = get_all_items(db)

    # Filter by category if specified
    if category:
        if category in FILTER_CATEGORIES:
            # Filter by grouped category (e.g., "plants" includes all flora types)
            allowed_categories = FILTER_CATEGORIES[category]
            items = [item for item in items if item["category"] in allowed_categories]
        else:
            # Filter by specific category
            items = [item for item in items if item["category"] == category]

    return {"items": items, "total": len(items)}


@router.get("/items/{category}/{item_id}")
async def get_item(category: str, item_id: int, db: Session = Depends(get_db)):
    """Get a single item by category and ID"""
    model_map = {
        "flora_angiosperm": FloraAngiosperm,
        "flora_pteridophyte": FloraPteridophyte,
        "flora_gimnosperma": FloraGimnosperma,
        "flora_bryophyte": FloraBryophyte,
        "fauna": Fauna,
        "objects_and_other": ObjectsAndOther,
        "garden_styles": GardenStyle,
    }

    if category not in model_map:
        raise HTTPException(status_code=404, detail="Category not found")

    model = model_map[category]
    item = db.query(model).filter(model.id == item_id).first()

    if not item:
        raise HTTPException(status_code=404, detail="Item not found")

    # Convert to dict
    item_dict = {
        "id": item.id,
        "category": category,
        "display_category": CATEGORY_DISPLAY_NAMES[category],
    }

    # Add all fields
    for column in item.__table__.columns:
        item_dict[column.name] = getattr(item, column.name)

    return item_dict


@router.get("/categories")
async def get_categories(db: Session = Depends(get_db)):
    """Get all categories with item counts"""
    categories = {
        "plants": {
            "name": "Plants",
            "count": (
                db.query(FloraAngiosperm).count()
                + db.query(FloraPteridophyte).count()
                + db.query(FloraGimnosperma).count()
                + db.query(FloraBryophyte).count()
            ),
        },
        "animals": {"name": "Animals", "count": db.query(Fauna).count()},
        "objects": {"name": "Objects", "count": db.query(ObjectsAndOther).count()},
        "garden_styles": {
            "name": "Garden Styles",
            "count": db.query(GardenStyle).count(),
        },
    }

    return categories
