FROM balenalib/aarch64-debian-python

RUN install_packages \
    build-essential \
    gcc \
    i2c-tools \
    kmod \
    libiio0 \
    libiio-utils \
    python-dev \
    python3-dev \
    python3-rpi.gpio \
    python3-libiio

WORKDIR /usr/src/app
RUN export CFLAGS=-fcommon
RUN pip3 install smbus2 spidev setuptools adafruit-blinka adafruit-circuitpython-max31856 paho-mqtt requests

COPY *.py ./

CMD ["python3", "sensor.py"]