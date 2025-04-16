# 🐳 Marimo datascience env

A full-featured Docker environment to run [Marimo](https://github.com/marimo-team/marimo) notebooks with all the essential tools for data science and geospatial Python.

Perfect for prototyping, exploring geospatial datasets, and visualizing data in a modern notebook interface.

---

## 📦 What's Included

- Python 3.10
- Marimo
- Data Science tools: `pandas`, `numpy`, `duckdb`, `scikit-learn`, `polars`, `matplotlib`, `seaborn`, etc.
- GeoPython tools: `geopandas`, `shapely`, `pyproj`, `fiona`, `folium`, `leafmap`, `geemap`, `whitebox`, etc.
- GDAL and all required system dependencies pre-installed

---

## 🚧 Build the Docker Image

From the directory containing your `Dockerfile` and `requirements.txt`:

```bash
docker build -t marimo-geodatapy .
```

---

## 🚀 Run the Marimo Environment

```bash
docker run -it --rm \
  -p 8080:8080 \
  -v $(pwd):/app \
  marimo-geodatapy
```

:warning: Be careful with the `--rm`: the container will be deleted once switched off.

Once running, Marimo is available at:  
👉 `http://localhost:8080`
