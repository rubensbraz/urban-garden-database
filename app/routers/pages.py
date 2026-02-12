from fastapi import APIRouter, Depends, Request, HTTPException
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from sqlalchemy.orm import Session
from app.database import get_db
from app.routers.items import get_all_items
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
    FLORA_ANGIOSPERM_FIELDS,
    FLORA_PTERIDOPHYTE_FIELDS,
    FLORA_GIMNOSPERMA_FIELDS,
    FLORA_BRYOPHYTE_FIELDS,
    FAUNA_FIELDS,
    OBJECTS_FIELDS,
    GARDEN_STYLES_FIELDS,
)

router = APIRouter()
templates = Jinja2Templates(directory="app/templates")


@router.get("/", response_class=HTMLResponse)
async def homepage(request: Request, db: Session = Depends(get_db)):
    """Homepage with masonry grid of all items"""
    items = get_all_items(db)

    return templates.TemplateResponse(
        "index.html",
        {
            "request": request,
            "items": items,
        },
    )


@router.get("/item/{category}/{item_id}", response_class=HTMLResponse)
async def item_detail(
    request: Request, category: str, item_id: int, db: Session = Depends(get_db)
):
    """Detail page for a single item"""
    model_map = {
        "flora_angiosperm": (FloraAngiosperm, FLORA_ANGIOSPERM_FIELDS),
        "flora_pteridophyte": (FloraPteridophyte, FLORA_PTERIDOPHYTE_FIELDS),
        "flora_gimnosperma": (FloraGimnosperma, FLORA_GIMNOSPERMA_FIELDS),
        "flora_bryophyte": (FloraBryophyte, FLORA_BRYOPHYTE_FIELDS),
        "fauna": (Fauna, FAUNA_FIELDS),
        "objects_and_other": (ObjectsAndOther, OBJECTS_FIELDS),
        "garden_styles": (GardenStyle, GARDEN_STYLES_FIELDS),
    }

    if category not in model_map:
        raise HTTPException(status_code=404, detail="Category not found")

    model, field_config = model_map[category]
    item = db.query(model).filter(model.id == item_id).first()

    if not item:
        raise HTTPException(status_code=404, detail="Item not found")

    # Build fields list with values (only non-empty)
    fields = []
    for label, field_name in field_config:
        value = getattr(item, field_name, None)
        if value:  # Only include non-empty fields
            fields.append({"label": label, "value": value})

    # Get images from JSON array
    images = []
    if hasattr(item, "images") and item.images:
        for img_data in item.images:
            if isinstance(img_data, dict):
                images.append(
                    {
                        "label": img_data.get("type", "Image")
                        .replace("_", " ")
                        .title(),
                        "path": img_data.get("path", ""),
                    }
                )

    return templates.TemplateResponse(
        "detail.html",
        {
            "request": request,
            "item": item,
            "category": category,
            "fields": fields,
            "images": images,
        },
    )
