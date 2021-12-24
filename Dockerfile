FROM balenalib/raspberrypi4-64-debian-python:3.9-build as build

# RUN install_packages \
#     build-essential \
#     gcc \
#     i2c-tools \
#     kmod \
#     libiio0 \
#     libiio-utils \
#     python-dev \
#     python3-dev \
#     python3-libiio

RUN install_packages \
    python3-dev \
    python3-rpi.gpio \
    i2c-tools

WORKDIR /usr/src/app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY *.py ./

CMD ["python3", "sensor.py"]