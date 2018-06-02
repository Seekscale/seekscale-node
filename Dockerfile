FROM 10.8.0.1:5500/gdal-python

COPY . worker

#We need this env var, else pyc artefacts remain and pollute code execution
ENV PYTHONDONTWRITEBYTECODE=1
RUN DEBIAN_FRONTEND=noninteractive cd worker \
    && pip install -r requirements.txt \
    && apt-get update --fix-missing \
    && apt-get install -y --force-yes zip \
    && apt-get install -y --force-yes cifs-utils \
    && apt-get install -y --force-yes smbclient \
    && mkdir /slavefolder
