import os
import sys

# Add parent directory to path to import app modules
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


from app.database import SessionLocal
from app.models import (
    Fauna,
    FloraAngiosperm,
    FloraBryophyte,
    FloraGimnosperma,
    FloraPteridophyte,
    ObjectsAndOther,
)


def update_db_images():
    """Update all image references in database to use .webp extensions"""
    db = SessionLocal()
    total_updates = 0

    models = [
        FloraAngiosperm,
        FloraPteridophyte,
        FloraGimnosperma,
        FloraBryophyte,
        Fauna,
        ObjectsAndOther,
        # GardenStyle doesn't have an images column in the schema I saw, but checking anyway
    ]

    try:
        for model in models:
            print(f"Processing table: {model.__tablename__}")
            items = db.query(model).all()

            for item in items:
                updated = False

                # Check JSONB images field
                if hasattr(item, "images") and item.images:
                    new_images = []
                    for img in item.images:
                        if isinstance(img, dict) and "path" in img:
                            path = img["path"]
                            if not path.lower().endswith(".webp"):
                                # Replace extension with .webp
                                base_name = os.path.splitext(path)[0]
                                img["path"] = f"{base_name}.webp"
                                updated = True
                        new_images.append(img)

                    if updated:
                        # Force update for SQLAlchemy to detect JSON change
                        item.images = list(new_images)
                        total_updates += 1
                        print(f"Updated item {item.id}: {item.popular_name_en}")

        db.commit()
        print("\nDatabase update complete!")
        print(f"Total records updated: {total_updates}")

    except Exception as e:
        print(f"Error updating database: {e}")
        db.rollback()
    finally:
        db.close()


if __name__ == "__main__":
    update_db_images()
