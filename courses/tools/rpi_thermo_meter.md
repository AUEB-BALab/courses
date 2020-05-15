<omg src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Tools and practices: RPi Thermo and humidity meter

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)


# Problem
* Want to measure temperature rooms in a cool way?
* Want to automate this process too?
* Want to get measurements remotely?


# Tools and Equipments
* Raspberry Pi (I am using 3B model)
* Waveshare DHT11 temperature-humidity sensor (3.4 eu)


# Set up a Static IP on RPi
* Open a terminal and inside  /etc/dhcpcd.conf write the following lines:
```java
interface [wlan0||eth0]
static ip_address=192.168.1.2/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.1
```

* Reboot RPi and check IP ($ ifconfig)


# RPi GPIO
<img src="media/rpi_gpio.svg" height="546" />


# Add pins to RPi GPIO
* DHT-11 VCC pin to RPi (Top left 3.3VPWR number 1 pin)
* DHT-11 GND pin to RPi (Top right GND number 6 pin)
* DHT-11 DOUT pin to RPI (Top left GPIO 17 number 11 pin)


# Clone Python utility
* git clone https://github.com/szazo/DHT11_Python.git
* Modify example.py instance = dht11.DHT11(pin=14) to instance = dht11.DHT11(pin=17)
* Execute tool using: $ python3 example.py


# To get reading remotely
* Modify example script to avoid infinite loop by removing the while true
* Establish password-less ssh using the following tutorial: https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
* Test using the following: $ ssh pi@192.168.1.2 "python3 DHT11_Python/example.py"


# Add in Unix System Resource binaries
* Create a small BASH script with the following code:

```java
cat << EOF > getRoomTemperature 
#!/bin/bash
ssh pi@192.168.1.2 "python3 DHT11_Python/example.py"
EOF
```
* chmod +x getRoomTemperature
* Copy to usr binaries: $ cp getRoomTemperature /usr/bin/
* Execute: $ getRoomTemperature


# Thank you for your attention
