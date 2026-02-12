from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List, Optional
from app.database import get_db
from app.models import (
    FloraAngiosperm,
    FloraPteridophyte,
    FloraGimnosperma,
    FloraBryophyte,
    Fauna,
    ObjectsAndOther,
    GardenStyle,
)
from config.field_config import (
    CATEGORY_DISPLAY_NAMES,
    FILTER_CATEGORIES,
)

router = APIRouter()


def get_primary_image(item) -> Optional[str]:
    """Extract primary image path from JSON array"""
    if hasattr(item, "images") and item.images:
        # Try to find 'reference' or 'animal' type first
        for img in item.images:
            if isinstance(img, dict):
                img_type = img.get("type", "")
                if img_type in ["reference", "animal"]:
                    return img.get("path")

        # If no reference/animal image, return first image
        if isinstance(item.images[0], dict):
            return item.images[0].get("path")

    return None


def get_all_items(db: Session):
    """Get all items from all tables"""
    items = []

    # Flora Angiosperm
    for item in db.query(FloraAngiosperm).all():
        items.append(
            {
                "id": item.id,
                "category": "flora_angiosperm",
                "display_category": CATEGORY_DISPLAY_NAMES["flora_angiosperm"],
                "popular_name_english": item.popular_name_en,
                "popular_name_japanese": item.popular_name_jp,
                "image": get_primary_image(item),
            }
        )

    # Flora Pteridophyte
    for item in db.query(FloraPteridophyte).all():
        items.append(
            {
                "id": item.id,
                "category": "flora_pteridophyte",
                "display_category": CATEGORY_DISPLAY_NAMES["flora_pteridophyte"],
                "popular_name_english": item.popular_name_en,
                "popular_name_japanese": item.popular_name_jp,
                "image": get_primary_image(item),
            }
        )

    # Flora Gimnosperma
    for item in db.query(FloraGimnosperma).all():
        items.append(
            {
                "id": item.id,
                "category": "flora_gimnosperma",
                "display_category": CATEGORY_DISPLAY_NAMES["flora_gimnosperma"],
                "popular_name_english": item.popular_name_en,
                "popular_name_japanese": item.popular_name_jp,
                "image": get_primary_image(item),
            }
        )

    # Flora Bryophyte
    for item in db.query(FloraBryophyte).all():
        items.append(
            {
                "id": item.id,
                "category": "flora_bryophyte",
                "display_category": CATEGORY_DISPLAY_NAMES["flora_bryophyte"],
                "popular_name_english": item.popular_name_en,
                "popular_name_japanese": item.popular_name_jp,
                "image": get_primary_image(item),
            }
        )

    # Fauna
    for item in db.query(Fauna).all():
        items.append(
            {
                "id": item.id,
                "category": "fauna",
                "display_category": CATEGORY_DISPLAY_NAMES["fauna"],
                "popular_name_english": item.popular_name_en,
                "popular_name_japanese": item.popular_name_jp,
                "image": get_primary_image(item),
            }
        )

    # Objects
    for item in db.query(ObjectsAndOther).all():
        items.append(
            {
                "id": item.id,
                "category": "objects_and_other",
                "display_category": CATEGORY_DISPLAY_NAMES["objects_and_other"],
                "popular_name_english": item.popular_name_en,
                "popular_name_japanese": item.name_jp,
                "image": get_primary_image(item),
            }
        )

    # Garden Styles
    for item in db.query(GardenStyle).all():
        items.append(
            {
                "id": item.id,
                "category": "garden_styles",
                "display_category": CATEGORY_DISPLAY_NAMES["garden_styles"],
                "popular_name_english": item.popular_name_en,
                "popular_name_japanese": item.name_jp,
                "image": None,
            }
        )

    return items


@router.get("/items")
async def get_items(category: Optional[str] = None, db: Session = Depends(get_db)):
    """Get all items, optionally filtered by category"""
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
