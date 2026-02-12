from sqlalchemy import Column, Integer, String, Text, DateTime
from sqlalchemy.dialects.postgresql import JSONB
from sqlalchemy.sql import func
from app.database import Base


class FloraAngiosperm(Base):
    """Flora - Angiosperm (Flowering plants) - STANDARDIZED SCHEMA"""

    __tablename__ = "flora_angiosperm"

    # Core fields
    id = Column(Integer, primary_key=True, index=True)
    popular_name_en = Column(String(255), index=True)
    popular_name_jp = Column(String(255))
    scientific_name = Column(String(255), index=True)
    classification = Column(String(255))
    description = Column(Text)

    # Images as JSON array: [{"type": "reference", "path": "..."}, ...]
    images = Column(JSONB, default=list)

    # Life cycle
    lifecycle = Column(String(100))  # Annual / Perennial
    cultivated_when = Column(String(255))
    months_foliage = Column(String(255))
    months_flowers = Column(String(255))
    months_fruits = Column(String(255))

    # Edibility
    edible_fruit = Column(String(100))
    fruit_eaten = Column(String(100))
    other_eaten = Column(String(255))
    what_eaten = Column(Text)
    when_harvested = Column(Text)

    # Context
    origin = Column(String(255))
    garden_type = Column(String(255))
    cultural_info = Column(Text)
    habitat = Column(Text)

    # References
    links = Column(Text)
    book_references = Column(Text)
    comments = Column(Text)

    # Metadata
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())


class FloraPteridophyte(Base):
    """Flora - Pteridophyte (Ferns) - STANDARDIZED SCHEMA"""

    __tablename__ = "flora_pteridophyte"

    id = Column(Integer, primary_key=True, index=True)
    popular_name_en = Column(String(255), index=True)
    popular_name_jp = Column(String(255))
    scientific_name = Column(String(255), index=True)
    classification = Column(String(255))
    description = Column(Text)
    images = Column(JSONB, default=list)

    lifecycle = Column(String(100))
    months_foliage = Column(String(255))

    origin = Column(String(255))
    garden_type = Column(String(255))
    cultural_info = Column(Text)
    habitat = Column(Text)

    links = Column(Text)
    book_references = Column(Text)
    comments = Column(Text)

    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())


class FloraGimnosperma(Base):
    """Flora - Gimnosperma (Conifers) - STANDARDIZED SCHEMA"""

    __tablename__ = "flora_gimnosperma"

    id = Column(Integer, primary_key=True, index=True)
    popular_name_en = Column(String(255), index=True)
    popular_name_jp = Column(String(255))
    scientific_name = Column(String(255), index=True)
    classification = Column(String(255))
    description = Column(Text)
    images = Column(JSONB, default=list)

    lifecycle = Column(String(100))
    months_foliage = Column(String(255))
    months_flowers = Column(String(255))
    months_fruits = Column(String(255))

    origin = Column(String(255))
    garden_type = Column(String(255))
    cultural_info = Column(Text)
    habitat = Column(Text)

    links = Column(Text)
    book_references = Column(Text)
    comments = Column(Text)

    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())


class FloraBryophyte(Base):
    """Flora - Bryophyte (Mosses) - STANDARDIZED SCHEMA"""

    __tablename__ = "flora_bryophyte"

    id = Column(Integer, primary_key=True, index=True)
    popular_name_en = Column(String(255), index=True)
    popular_name_jp = Column(String(255))
    scientific_name = Column(String(255), index=True)
    classification = Column(String(255))
    description = Column(Text)
    images = Column(JSONB, default=list)

    origin = Column(String(255))
    garden_type = Column(String(255))
    cultural_info = Column(Text)
    habitat = Column(Text)

    links = Column(Text)
    book_references = Column(Text)
    comments = Column(Text)

    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())


class Fauna(Base):
    """Fauna - Animals - STANDARDIZED SCHEMA"""

    __tablename__ = "fauna"

    id = Column(Integer, primary_key=True, index=True)
    popular_name_en = Column(String(255), index=True)
    popular_name_jp = Column(String(255))
    scientific_name = Column(String(255), index=True)
    animal_class = Column(String(255))
    images = Column(JSONB, default=list)

    # Behavior
    diet_type = Column(String(255))
    diet_natural = Column(Text)
    diet_urban = Column(Text)
    active_period = Column(Text)

    # Context
    origin_status = Column(Text)  # Native/Introduced
    cultural_info = Column(Text)
    habitat = Column(Text)

    # References
    links = Column(Text)
    book_sources = Column(Text)
    book_references = Column(Text)
    comments = Column(Text)

    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())


class ObjectsAndOther(Base):
    """Objects and Other Items - STANDARDIZED SCHEMA"""

    __tablename__ = "objects_and_other"

    id = Column(Integer, primary_key=True, index=True)
    popular_name_en = Column(String(255), index=True)
    name_jp = Column(String(255))
    images = Column(JSONB, default=list)

    purpose_original = Column(Text)
    purpose_other = Column(Text)

    links = Column(Text)

    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())


class GardenStyle(Base):
    """Garden Styles - STANDARDIZED SCHEMA"""

    __tablename__ = "garden_styles"

    id = Column(Integer, primary_key=True, index=True)
    popular_name_en = Column(String(255), index=True)
    name_jp = Column(String(255))
    characteristics = Column(Text)
    links = Column(Text)

    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())
