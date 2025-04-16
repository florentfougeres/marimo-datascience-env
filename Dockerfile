FROM python:3.11-slim

# Dépendances système pour GDAL et co
RUN apt-get update && apt-get install -y \
    build-essential \
    gdal-bin \
    libgdal-dev \
    libproj-dev \
    proj-data \
    proj-bin \
    libspatialindex-dev \
    libgl1-mesa-glx \
    libgeos-dev \
    curl \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Variables nécessaires pour gdal / fiona
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose port 8080 for Marimo
EXPOSE 8080

# Default command to run Marimo
CMD ["marimo", "edit", "--host", "0.0.0.0", "--port", "8080", "--no-token"]