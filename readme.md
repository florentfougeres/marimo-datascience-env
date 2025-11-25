# 🐳 Marimo datascience env

A full-featured Docker environment to run [Marimo](https://github.com/marimo-team/marimo) notebooks with all the essential tools for data science and geospatial Python.

## 📦 What's Included

- Python 3.10
- Marimo
- Data Science tools: `pandas`, `numpy`, `duckdb`, `scikit-learn`, `polars`, `matplotlib`, `seaborn`, etc.
- GeoPython tools: `geopandas`, `shapely`, `pyproj`, `fiona`, `folium`, `leafmap`, `geemap`, `whitebox`, etc.
- GDAL and all required system dependencies pre-installed

## 🚧 Build the Docker Image

From the directory containing your `Dockerfile` and `requirements.txt`:

```bash
docker build -t marimo-geodatapy .
```

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

## Run as a service

`/etc/systemd/system/marimo.service`

```service
[Unit]
Description=Marimo Notebook Server
After=network.target

[Service]
Type=simple
User=florent
WorkingDirectory=/home/florent/marimo-datascience-env
Environment="PATH=/home/florent/marimo-datascience-env/.data/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
Environment="VIRTUAL_ENV=/home/florent/marimo-datascience-env/.data"
ExecStart=/home/florent/marimo-datascience-env/.data/bin/python -m marimo edit --host 0.0.0.0 --port 8080 --no-token
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

Then :

```bash
sudo systemctl daemon-reload
sudo systemctl enable marimo.service
sudo systemctl start marimo.service
sudo systemctl status marimo.service 
```