FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app/ ./app/
COPY scripts/ ./scripts/
COPY config/ ./config/

# Create images directory
RUN mkdir -p /app/images

# Expose port
EXPOSE 8015

# Run the application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8015"]
