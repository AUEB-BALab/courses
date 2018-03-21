<img src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Tools and practices: Measuring Energy Consumption

* [Stefanos Georgiou](https://www.balab.aueb.gr/stefanos-georgiou.html)


# Measuring Applications Energy Consumption 

* Two ways of measuring energy consumption of computer applications.
	* __Direct:__ Using Board sensors or hard power analysers
	* __Indirect:__ Energy estimation models using computer resource usage information
* Each of the above has its own pitfalls (low reporting rate, overheat, and so on)
* Accuracy is a main concern
* Preparing the test-bed is crucail (interferances)


# HEMTs: Examples

* [Watts Up? Pro](https://www.conservationmart.com/specs/wattsup_specifications.pdf)
* [Mosoon](https://www.msoon.com/online-store)
* [DAQ](http://www.ni.com/data-acquisition/)
* [INA219](https://www.adafruit.com/product/904)


# Watts Up? Pro

![](media/watts_up_pro.jpg)


# Watts Up? Pro Info

* display of volts, amps, power factor.
* display of average monthly cost and KWH
* display of minimun and maximum values
* increased 15 amp continuous rating
* accuracy of +/- 1.5%  watts 
* super samping


# Test-bed Requirements

* A computer node (laptop or server)
* An energy monitoring node (e.g., Raspberry Pi)
* Watts Up Pro (with a micro USB)
* Network connection among the nodes
* Install [utility](https://github.com/pyrovski/watts-up) on energy monitoring node
* Set [passwordless SSH](https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/) among the nodes 


# Test-bed overview

![](media/test_bed.png)


# Source Code to Measure

UNDER CONSTRUCTION


# Available on GitHub

UNDER CONSTRUCTION
