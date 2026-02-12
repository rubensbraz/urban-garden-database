from pathlib import Path

from PIL import Image

IMAGES_DIR = Path("/app/images")


def convert_to_webp():
    """Convert all images in IMAGES_DIR to WebP format"""
    print(f"Scanning directory: {IMAGES_DIR}")

    if not IMAGES_DIR.exists():
        print(f"Error: Directory {IMAGES_DIR} not found")
        return

    count = 0
    errors = 0

    # Supported extensions to convert
    extensions = {".jpg", ".jpeg", ".png", ".JPG", ".JPEG", ".PNG"}

    # Use rglob for recursive search in subdirectories
    for file_path in IMAGES_DIR.rglob("*"):
        if file_path.suffix in extensions:
            target_path = file_path.with_suffix(".webp")

            # Skip if WebP already exists
            if target_path.exists():
                print(f"Skipping {file_path.name} (WebP already exists)")
                continue

            try:
                print(f"Converting {file_path.name} -> {target_path.name}")
                with Image.open(file_path) as img:
                    # Convert to RGB if necessary (e.g. for PNG with transparency)
                    if img.mode in ("RGBA", "LA"):
                        img.save(target_path, "WEBP", quality=85)
                    else:
                        img.convert("RGB").save(target_path, "WEBP", quality=85)
                count += 1
            except Exception as e:
                print(f"Error converting {file_path.name}: {e}")
                errors += 1

    print("\nConversion complete!")
    print(f"Converted: {count}")
    print(f"Errors: {errors}")


if __name__ == "__main__":
    convert_to_webp()
