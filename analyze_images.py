"""
Script to analyze images and create mapping to database items
"""
import os
from pathlib import Path

# Get all image files
images_dir = Path('images')
all_images = []

for img_path in sorted(images_dir.rglob('*')):
    if img_path.is_file() and img_path.suffix.lower() in ['.jpg', '.jpeg', '.png', '.gif', '.webp']:
        rel_path = img_path.relative_to(images_dir)
        all_images.append(str(rel_path))

print(f"Total images found: {len(all_images)}\n")
print("=" * 80)
print("IMAGE LIST")
print("=" * 80)

# Group by category
categories = {}
for img in all_images:
    parts = Path(img).parts
    if len(parts) > 1:
        category = parts[0]
    else:
        category = "Root"
    
    if category not in categories:
        categories[category] = []
    categories[category].append(img)

for category, images in sorted(categories.items()):
    print(f"\n### {category} ({len(images)} images)")
    for img in sorted(images):
        # Extract item name and picture type from filename
        filename = Path(img).stem
        print(f"  - {img}")
        print(f"    Filename: {filename}")
