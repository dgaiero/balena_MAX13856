FROM balenalib/aarch64-debian-python

RUN install_packages \
    nano \
    i2c-tools \
    kmod \
    libiio0 \
    libiio-utils \
    python3-libiio

WORKDIR /usr/src/app

RUN pip3 install i2c-tools smbus2 spidev setuptools RPi.GPIO adafruit-blinka adafruit-circuitpython-max31856 paho-mqtt requests

COPY *.py ./

CMD ["python3", "sensor.py"]