"""
Field Display Configuration for Detail Pages - UPDATED FOR STANDARDIZED SCHEMA

This configuration defines the order in which fields should be displayed
on detail pages for each category. Fields with empty/null values will be
automatically hidden.
"""

# Flora - Angiosperm (Flowering Plants)
FLORA_ANGIOSPERM_FIELDS = [
    ("Popular Name (English)", "popular_name_en"),
    ("Popular Name (Japanese)", "popular_name_jp"),
    ("Scientific Name", "scientific_name"),
    ("Classification", "classification"),
    ("Description", "description"),
    ("Lifecycle", "lifecycle"),
    ("If Cultivated, When?", "cultivated_when"),
    ("Months with Live Foliage", "months_foliage"),
    ("Months with Flowers", "months_flowers"),
    ("Months with Fruits/Seeds", "months_fruits"),
    ("Edible Fruit?", "edible_fruit"),
    ("Fruit Normally Eaten?", "fruit_eaten"),
    ("Other Parts Eaten?", "other_eaten"),
    ("What is Eaten?", "what_eaten"),
    ("When is it Harvested?", "when_harvested"),
    ("Origin", "origin"),
    ("Type of Garden", "garden_type"),
    ("Cultural Information", "cultural_info"),
    ("Where Do You See It?", "habitat"),
    ("Links", "links"),
    ("Book References", "book_references"),
    ("Comments", "comments"),
]

# Flora - Pteridophyte (Ferns)
FLORA_PTERIDOPHYTE_FIELDS = [
    ("Popular Name (English)", "popular_name_en"),
    ("Popular Name (Japanese)", "popular_name_jp"),
    ("Scientific Name", "scientific_name"),
    ("Classification", "classification"),
    ("Description", "description"),
    ("Lifecycle", "lifecycle"),
    ("Months with Live Foliage", "months_foliage"),
    ("Origin", "origin"),
    ("Type of Garden", "garden_type"),
    ("Cultural Information", "cultural_info"),
    ("Where Do You See It?", "habitat"),
    ("Links", "links"),
    ("Book References", "book_references"),
    ("Comments", "comments"),
]

# Flora - Gimnosperma (Conifers)
FLORA_GIMNOSPERMA_FIELDS = [
    ("Popular Name (English)", "popular_name_en"),
    ("Popular Name (Japanese)", "popular_name_jp"),
    ("Scientific Name", "scientific_name"),
    ("Classification", "classification"),
    ("Description", "description"),
    ("Lifecycle", "lifecycle"),
    ("Months with Live Foliage", "months_foliage"),
    ("Months with Flowers", "months_flowers"),
    ("Months with Fruits/Seeds", "months_fruits"),
    ("Origin", "origin"),
    ("Type of Garden", "garden_type"),
    ("Cultural Information", "cultural_info"),
    ("Where Do You See It?", "habitat"),
    ("Links", "links"),
    ("Book References", "book_references"),
    ("Comments", "comments"),
]

# Flora - Bryophyte (Mosses)
FLORA_BRYOPHYTE_FIELDS = [
    ("Popular Name (English)", "popular_name_en"),
    ("Popular Name (Japanese)", "popular_name_jp"),
    ("Scientific Name", "scientific_name"),
    ("Classification", "classification"),
    ("Description", "description"),
    ("Origin", "origin"),
    ("Type of Garden", "garden_type"),
    ("Cultural Information", "cultural_info"),
    ("Where Do You See It?", "habitat"),
    ("Links", "links"),
    ("Book References", "book_references"),
    ("Comments", "comments"),
]

# Fauna (Animals)
FAUNA_FIELDS = [
    ("Popular Name (English)", "popular_name_en"),
    ("Popular Name (Japanese)", "popular_name_jp"),
    ("Scientific Name", "scientific_name"),
    ("Animal Class", "animal_class"),
    ("Diet Type", "diet_type"),
    ("Natural Diet", "diet_natural"),
    ("Urban Diet", "diet_urban"),
    ("Active Period", "active_period"),
    ("Origin Status", "origin_status"),
    ("Cultural Information", "cultural_info"),
    ("Where Do You See It?", "habitat"),
    ("Links", "links"),
    ("Book Sources", "book_sources"),
    ("Book References", "book_references"),
    ("Comments", "comments"),
]

# Objects and Other
OBJECTS_FIELDS = [
    ("Popular Name (English)", "popular_name_en"),
    ("Name (Japanese)", "name_jp"),
    ("Original Purpose", "purpose_original"),
    ("Other Aspects", "purpose_other"),
    ("Links", "links"),
]

# Garden Styles
GARDEN_STYLES_FIELDS = [
    ("Popular Name (English)", "popular_name_en"),
    ("Name (Japanese)", "name_jp"),
    ("Characteristics", "characteristics"),
    ("Links", "links"),
]

# Primary image field for homepage display (from images JSON array)
# We'll use the first image of type 'reference' or 'animal', or just the first image
PRIMARY_IMAGE_FIELD = {
    "flora_angiosperm": "images",
    "flora_pteridophyte": "images",
    "flora_gimnosperma": "images",
    "flora_bryophyte": "images",
    "fauna": "images",
    "objects_and_other": "images",
    "garden_styles": None,  # No images for garden styles
}

# Category display names
CATEGORY_DISPLAY_NAMES = {
    "flora_angiosperm": "Plants",
    "flora_pteridophyte": "Plants",
    "flora_gimnosperma": "Plants",
    "flora_bryophyte": "Plants",
    "fauna": "Animals",
    "objects_and_other": "Objects",
    "garden_styles": "Garden Styles",
}

# Filter categories (grouped)
FILTER_CATEGORIES = {
    "plants": [
        "flora_angiosperm",
        "flora_pteridophyte",
        "flora_gimnosperma",
        "flora_bryophyte",
    ],
    "animals": ["fauna"],
    "objects": ["objects_and_other"],
    "garden_styles": ["garden_styles"],
}
