"""
Comprehensive Data Import Script with Automatic Image Mapping

This script:
1. Reads all Excel sheets
2. Maps columns to standardized database fields
3. Automatically matches images to items based on scientific/popular names
4. Imports all data with proper validation
"""

import os
import re
import sys
from pathlib import Path
from typing import Dict, List, Optional

import pandas as pd

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from app.database import SessionLocal, engine
from app.models import (
    Base,
    Fauna,
    FloraAngiosperm,
    FloraBryophyte,
    FloraGimnosperma,
    FloraPteridophyte,
    GardenStyle,
    ObjectsAndOther,
)

# ============================================================================
# IMAGE MAPPING SYSTEM
# ============================================================================


class ImageMapper:
    """Maps image files to database items based on names"""

    def __init__(self, images_dir: str = "/app/images"):
        self.images_dir = Path(images_dir)
        self.image_cache = self._build_image_cache()

    def _build_image_cache(self) -> Dict[str, List[Dict]]:
        """
        Build a cache of all images organized by normalized names.
        Prioritizes .webp images over other formats.
        """
        # Intermediate cache: name -> type -> {path, original_name, suffix}
        temp_cache = {}

        # Files to ignore
        ignore_patterns = [
            ".heic",
            ".HEIC",
            "Pyracantha.jpg",
            "Trifoliate orange.jpg",
            "Dandellion differences.jpeg",
            "Dandellion Else Picture.jpg",
        ]

        total_files = 0

        for img_path in self.images_dir.rglob("*"):
            if not img_path.is_file():
                continue

            # Skip ignored files
            if any(pattern in str(img_path) for pattern in ignore_patterns):
                continue

            suffix = img_path.suffix.lower()
            if suffix not in [".jpg", ".jpeg", ".png", ".gif", ".webp"]:
                continue

            total_files += 1

            # Extract item name and image type from filename
            filename = img_path.stem
            rel_path = str(img_path.relative_to(self.images_dir))

            # Parse filename: "Name - Type" or "Name_Type"
            if " - " in filename:
                item_name, img_type = filename.rsplit(" - ", 1)
            elif "_" in filename:
                parts = filename.rsplit("_", 1)
                item_name = parts[0]
                img_type = parts[1] if len(parts) > 1 else "Reference Picture"
            else:
                item_name = filename
                img_type = "Reference Picture"

            # Normalize keys
            normalized_name = self._normalize_name(item_name)
            img_type_std = self._standardize_image_type(img_type)

            if normalized_name not in temp_cache:
                temp_cache[normalized_name] = {}

            # Logic to choose best image (WebP > others)
            existing = temp_cache[normalized_name].get(img_type_std)

            current_data = {
                "type": img_type_std,
                "path": rel_path,
                "original_name": item_name,
                "suffix": suffix,
            }

            if not existing:
                temp_cache[normalized_name][img_type_std] = current_data
            else:
                # If current is webp and existing is not, replace
                if suffix == ".webp" and existing["suffix"] != ".webp":
                    temp_cache[normalized_name][img_type_std] = current_data
                # If both are same format or existing is already webp, keep existing (or do nothing)

        # Convert temp_cache to final format
        final_cache = {}
        total_images = 0

        for name, types in temp_cache.items():
            final_cache[name] = []
            for img_data in types.values():
                # Remove internal 'suffix' key before adding to final list
                img_entry = {k: v for k, v in img_data.items() if k != "suffix"}
                final_cache[name].append(img_entry)
                total_images += 1

        print(
            f"✓ Image cache built: {len(final_cache)} unique items, {total_images} total images (WebP prioritized)"
        )
        return final_cache

    def _normalize_name(self, name: str) -> str:
        """Normalize name for matching"""
        # Remove extra spaces, lowercase, remove special chars
        name = re.sub(r"\s+", " ", name.strip().lower())
        name = re.sub(r"[×_]", " ", name)
        return name

    def _standardize_image_type(self, img_type: str) -> str:
        """Convert image type to standardized format"""
        img_type_lower = img_type.lower()

        # Flora types
        if "reference" in img_type_lower:
            return "reference"
        elif "leaf" in img_type_lower or "folha" in img_type_lower:
            return "leaf"
        elif "root" in img_type_lower or "raiz" in img_type_lower:
            return "roots"
        elif "flower" in img_type_lower or "flor" in img_type_lower:
            return "flower"
        elif (
            "fruit" in img_type_lower
            or "seed" in img_type_lower
            or "fruto" in img_type_lower
        ):
            return "fruit"
        elif "sterile" in img_type_lower:
            return "sterile_stems"
        elif "fertile" in img_type_lower:
            return "fertile_stems"
        elif "rizoma" in img_type_lower or "rhizome" in img_type_lower:
            return "rizoma"
        elif "gametophyte" in img_type_lower:
            return "gametophyte"
        elif "sporophyte" in img_type_lower or "capsule" in img_type_lower:
            return "sporophyte"
        elif "habitat" in img_type_lower:
            return "habitat"

        # Fauna types
        elif "animal" in img_type_lower:
            return "animal"
        elif "natural habitat" in img_type_lower:
            return "habitat_natural"
        elif "garden" in img_type_lower or "jardim" in img_type_lower:
            return "garden"
        elif "urban" in img_type_lower:
            return "urban"

        # Object types
        elif "original" in img_type_lower or "uso original" in img_type_lower:
            return "original_use"
        elif "other" in img_type_lower or "outro" in img_type_lower:
            return "other_use"

        # Default
        return "other"

    def find_images(
        self,
        scientific_name: Optional[str],
        popular_name_en: Optional[str],
        popular_name_jp: Optional[str],
    ) -> List[Dict]:
        """Find all images for an item by trying different name variations"""
        images = []

        # Try scientific name first (highest priority)
        if scientific_name:
            norm_sci = self._normalize_name(scientific_name)
            if norm_sci in self.image_cache:
                images.extend(self.image_cache[norm_sci])

        # Try popular name English
        if not images and popular_name_en:
            norm_pop_en = self._normalize_name(popular_name_en)
            if norm_pop_en in self.image_cache:
                images.extend(self.image_cache[norm_pop_en])

        # Try popular name Japanese
        if not images and popular_name_jp:
            norm_pop_jp = self._normalize_name(popular_name_jp)
            if norm_pop_jp in self.image_cache:
                images.extend(self.image_cache[norm_pop_jp])

        # Special mappings
        if not images:
            special_mappings = {
                "alauda arvensis": "hibari",
                "stink bug": "kamemushi",
                "clothes rail": "varal",
            }

            for key, value in special_mappings.items():
                if scientific_name and key in scientific_name.lower():
                    if value in self.image_cache:
                        images.extend(self.image_cache[value])
                elif popular_name_en and key in popular_name_en.lower():
                    if value in self.image_cache:
                        images.extend(self.image_cache[value])

        return images


# ============================================================================
# UTILITY FUNCTIONS
# ============================================================================


def clean_value(value, max_length: Optional[int] = None) -> Optional[str]:
    """Clean and normalize cell values"""
    if pd.isna(value):
        return None
    if isinstance(value, str):
        value = value.strip()
        if value == "" or value == "-":
            return None
        if max_length and len(value) > max_length:
            value = value[:max_length]
    return value


# ============================================================================
# IMPORT FUNCTIONS
# ============================================================================


def import_flora_angiosperm(df: pd.DataFrame, session, image_mapper: ImageMapper):
    """Import Flora | Angiosperm with image mapping"""
    print(f"Importing {len(df)} Flora | Angiosperm records...")
    count = 0

    for _, row in df.iterrows():
        if pd.isna(row.get("Popular Name English")):
            continue

        # Get images
        images = image_mapper.find_images(
            clean_value(row.get("Scientific Name")),
            clean_value(row.get("Popular Name English")),
            clean_value(row.get("Popular Name Japanese")),
        )

        item = FloraAngiosperm(
            popular_name_en=clean_value(row.get("Popular Name English")),
            popular_name_jp=clean_value(row.get("Popular Name Japanese")),
            scientific_name=clean_value(row.get("Scientific Name")),
            classification=clean_value(row.get("Botanic Classification")),
            description=clean_value(row.get("Description")),
            images=images,
            lifecycle=clean_value(row.get("Annual / Perene")),
            cultivated_when=clean_value(row.get("If cultivated, when?")),
            months_foliage=clean_value(row.get("Months Live Foliage")),
            months_flowers=clean_value(row.get("Months Flowers")),
            months_fruits=clean_value(row.get("Months Fruits/seeds")),
            edible_fruit=clean_value(row.get("Edible fruit?")),
            fruit_eaten=clean_value(row.get("Fruit normally eaten?")),
            other_eaten=clean_value(row.get("Something else eaten?")),
            what_eaten=clean_value(row.get("What is eaten?")),
            when_harvested=clean_value(
                row.get("When is it harvested? (Domestic amateur context)")
            ),
            origin=clean_value(row.get("Origin")),
            garden_type=clean_value(row.get("Type of Garden")),
            cultural_info=clean_value(row.get("Cultural Perspectives")),
            habitat=clean_value(row.get("Where do you see it?")),
            links=clean_value(row.get("Nice Links")),
            book_references=clean_value(row.get("Book References")),
            comments=clean_value(row.get("Extra Comments")),
        )
        session.add(item)
        count += 1

    session.commit()
    print(f"✓ Imported {count} Flora | Angiosperm records")


def import_flora_pteridophyte(df: pd.DataFrame, session, image_mapper: ImageMapper):
    """Import Flora | Pteridophyte with image mapping"""
    print(f"Importing {len(df)} Flora | Pteridophyte records...")
    count = 0

    for _, row in df.iterrows():
        if pd.isna(row.get("Popular Name English")):
            continue

        images = image_mapper.find_images(
            clean_value(row.get("Scientific Name")),
            clean_value(row.get("Popular Name English")),
            clean_value(row.get("Popular Name Japanese")),
        )

        item = FloraPteridophyte(
            popular_name_en=clean_value(row.get("Popular Name English")),
            popular_name_jp=clean_value(row.get("Popular Name Japanese")),
            scientific_name=clean_value(row.get("Scientific Name")),
            classification=clean_value(row.get("Botanic Classification")),
            description=clean_value(row.get("Description")),
            images=images,
            lifecycle=clean_value(row.get("Annual / Perene")),
            months_foliage=clean_value(row.get("Months Live Foliage")),
            origin=clean_value(row.get("Origin")),
            garden_type=clean_value(row.get("Type of Garden")),
            cultural_info=clean_value(row.get("Cultural Perspectives")),
            habitat=clean_value(row.get("Where do you see it?")),
            links=clean_value(row.get("Nice Links")),
            book_references=clean_value(row.get("Book References")),
            comments=clean_value(row.get("Extra Comments")),
        )
        session.add(item)
        count += 1

    session.commit()
    print(f"✓ Imported {count} Flora | Pteridophyte records")


def import_flora_gimnosperma(df: pd.DataFrame, session, image_mapper: ImageMapper):
    """Import Flora | Gimnosperma with image mapping"""
    print(f"Importing {len(df)} Flora | Gimnosperma records...")
    count = 0

    for _, row in df.iterrows():
        if pd.isna(row.get("Popular Name English")):
            continue

        images = image_mapper.find_images(
            clean_value(row.get("Scientific Name")),
            clean_value(row.get("Popular Name English")),
            clean_value(row.get("Popular Name Japanese")),
        )

        item = FloraGimnosperma(
            popular_name_en=clean_value(row.get("Popular Name English")),
            popular_name_jp=clean_value(row.get("Popular Name Japanese")),
            scientific_name=clean_value(row.get("Scientific Name")),
            classification=clean_value(row.get("Botanic Classification")),
            description=clean_value(row.get("Description")),
            images=images,
            lifecycle=clean_value(row.get("Annual / Perene")),
            months_foliage=clean_value(row.get("Months Live Foliage")),
            months_flowers=clean_value(row.get("Months Flowers")),
            months_fruits=clean_value(row.get("Months Fruits/seeds")),
            origin=clean_value(row.get("Origin")),
            garden_type=clean_value(row.get("Type of Garden")),
            cultural_info=clean_value(row.get("Cultural Perspectives")),
            habitat=clean_value(row.get("Where do you see it?")),
            links=clean_value(row.get("Nice Links")),
            book_references=clean_value(row.get("Book References")),
            comments=clean_value(row.get("Extra Comments")),
        )
        session.add(item)
        count += 1

    session.commit()
    print(f"✓ Imported {count} Flora | Gimnosperma records")


def import_flora_bryophyte(df: pd.DataFrame, session, image_mapper: ImageMapper):
    """Import Flora | Bryophyte with image mapping"""
    print(f"Importing {len(df)} Flora | Bryophyte records...")
    count = 0

    for _, row in df.iterrows():
        if pd.isna(row.get("Popular Name English")):
            continue

        images = image_mapper.find_images(
            clean_value(row.get("Scientific Name")),
            clean_value(row.get("Popular Name English")),
            clean_value(row.get("Popular Name Japanese")),
        )

        item = FloraBryophyte(
            popular_name_en=clean_value(row.get("Popular Name English")),
            popular_name_jp=clean_value(row.get("Popular Name Japanese")),
            scientific_name=clean_value(row.get("Scientific Name")),
            classification=clean_value(row.get("Botanic Classification")),
            description=clean_value(row.get("Description")),
            images=images,
            origin=clean_value(row.get("Origin")),
            garden_type=clean_value(row.get("Type of Garden")),
            cultural_info=clean_value(row.get("Cultural Perspectives")),
            habitat=clean_value(row.get("Where do you see it?")),
            links=clean_value(row.get("Nice Links")),
            book_references=clean_value(row.get("Book References")),
            comments=clean_value(row.get("Extra Comments")),
        )
        session.add(item)
        count += 1

    session.commit()
    print(f"✓ Imported {count} Flora | Bryophyte records")


def import_fauna(df: pd.DataFrame, session, image_mapper: ImageMapper):
    """Import Fauna with image mapping"""
    print(f"Importing {len(df)} Fauna records...")
    count = 0

    for _, row in df.iterrows():
        if pd.isna(row.get("Popular Name English")):
            continue

        images = image_mapper.find_images(
            clean_value(row.get("Scientific Name")),
            clean_value(row.get("Popular Name English")),
            clean_value(row.get("Popular Name Japanese")),
        )

        item = Fauna(
            popular_name_en=clean_value(row.get("Popular Name English")),
            popular_name_jp=clean_value(row.get("Popular Name Japanese")),
            scientific_name=clean_value(row.get("Scientific Name")),
            animal_class=clean_value(row.get("Animal Class")),
            images=images,
            diet_type=clean_value(row.get("Eating habits")),
            diet_natural=clean_value(row.get("Natural Diet")),
            diet_urban=clean_value(row.get("Urban Diet")),
            active_period=clean_value(row.get("Active Period")),
            origin_status=clean_value(row.get("Native/Introduced")),
            cultural_info=clean_value(row.get("Cultural Perspective")),
            habitat=clean_value(row.get("Where do you see it?")),
            links=clean_value(row.get("Nice Links")),
            book_sources=clean_value(row.get("Book Sources")),
            book_references=clean_value(row.get("Book References")),
            comments=clean_value(row.get("Extra Comments")),
        )
        session.add(item)
        count += 1

    session.commit()
    print(f"✓ Imported {count} Fauna records")


def import_objects(df: pd.DataFrame, session, image_mapper: ImageMapper):
    """Import Objects and Other with image mapping"""
    print(f"Importing {len(df)} Objects and Other records...")
    count = 0

    for _, row in df.iterrows():
        if pd.isna(row.get("Popular Name English")):
            continue

        images = image_mapper.find_images(
            None,  # No scientific name for objects
            clean_value(row.get("Popular Name English")),
            clean_value(row.get("Name Japanese")),
        )

        item = ObjectsAndOther(
            popular_name_en=clean_value(row.get("Popular Name English")),
            name_jp=clean_value(row.get("Name Japanese")),
            images=images,
            purpose_original=clean_value(row.get("Original Purpose")),
            purpose_other=clean_value(row.get("Other Aspects")),
            links=clean_value(row.get("Nice Links")),
        )
        session.add(item)
        count += 1

    session.commit()
    print(f"✓ Imported {count} Objects and Other records")


def import_garden_styles(df: pd.DataFrame, session, image_mapper: ImageMapper):
    """Import Garden Styles"""
    print(f"Importing {len(df)} Garden Styles records...")
    count = 0

    for _, row in df.iterrows():
        if pd.isna(row.get("Popular Name English")):
            continue

        item = GardenStyle(
            popular_name_en=clean_value(row.get("Popular Name English")),
            name_jp=clean_value(row.get("Garden Style Name [Japanese]")),
            characteristics=clean_value(row.get("Characteristics")),
            links=clean_value(row.get("Nice Links")),
        )
        session.add(item)
        count += 1

    session.commit()
    print(f"✓ Imported {count} Garden Styles records")


# ============================================================================
# MAIN IMPORT FUNCTION
# ============================================================================


def main():
    """Main import function"""
    print("=" * 80)
    print("Domestic Garden Database - COMPLETE DATA IMPORT")
    print("=" * 80)

    # Initialize image mapper
    print("\n1. Initializing image mapper...")
    image_mapper = ImageMapper()

    # Create tables
    print("\n2. Creating database tables...")
    Base.metadata.drop_all(bind=engine)  # Drop old tables
    Base.metadata.create_all(bind=engine)
    print("✓ Tables created")

    # Read Excel file
    excel_path = "/app/data/domestic_garden_database.xlsx"
    print(f"\n3. Reading Excel file: {excel_path}")

    if not os.path.exists(excel_path):
        print(f"ERROR: Excel file not found at {excel_path}")
        return

    xl = pd.ExcelFile(excel_path)
    print(f"✓ Found {len(xl.sheet_names)} sheets")

    # Create database session
    session = SessionLocal()

    try:
        print("\n4. Importing data...")

        # Import each category
        if "Flora | Angiosperm" in xl.sheet_names:
            df = pd.read_excel(xl, "Flora | Angiosperm")
            import_flora_angiosperm(df, session, image_mapper)

        if "Flora | Pteridophyte" in xl.sheet_names:
            df = pd.read_excel(xl, "Flora | Pteridophyte")
            import_flora_pteridophyte(df, session, image_mapper)

        if "Flora | Gimnosperma" in xl.sheet_names:
            df = pd.read_excel(xl, "Flora | Gimnosperma")
            import_flora_gimnosperma(df, session, image_mapper)

        if "Flora | Bryophyte" in xl.sheet_names:
            df = pd.read_excel(xl, "Flora | Bryophyte")
            import_flora_bryophyte(df, session, image_mapper)

        if "Fauna" in xl.sheet_names:
            df = pd.read_excel(xl, "Fauna")
            import_fauna(df, session, image_mapper)

        if "Objects and other" in xl.sheet_names:
            df = pd.read_excel(xl, "Objects and other")
            import_objects(df, session, image_mapper)

        if "Garden Styles" in xl.sheet_names:
            df = pd.read_excel(xl, "Garden Styles")
            import_garden_styles(df, session, image_mapper)

        print("\n" + "=" * 80)
        print("✓ DATA IMPORT COMPLETED SUCCESSFULLY!")
        print("=" * 80)

        # Print summary
        print("\nImport Summary:")
        print(f"  Flora | Angiosperm: {session.query(FloraAngiosperm).count()} records")
        print(
            f"  Flora | Pteridophyte: {session.query(FloraPteridophyte).count()} records"
        )
        print(
            f"  Flora | Gimnosperma: {session.query(FloraGimnosperma).count()} records"
        )
        print(f"  Flora | Bryophyte: {session.query(FloraBryophyte).count()} records")
        print(f"  Fauna: {session.query(Fauna).count()} records")
        print(f"  Objects and Other: {session.query(ObjectsAndOther).count()} records")
        print(f"  Garden Styles: {session.query(GardenStyle).count()} records")
        total = (
            session.query(FloraAngiosperm).count()
            + session.query(FloraPteridophyte).count()
            + session.query(FloraGimnosperma).count()
            + session.query(FloraBryophyte).count()
            + session.query(Fauna).count()
            + session.query(ObjectsAndOther).count()
            + session.query(GardenStyle).count()
        )
        print(f"  TOTAL: {total} records")

    except Exception as e:
        print(f"\n✗ Critical error during import: {e}")
        import traceback

        traceback.print_exc()
        session.rollback()
    finally:
        session.close()


if __name__ == "__main__":
    main()
