<omg src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Tools and practices: Validate Links

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)


# Problem

* Does your webpage includes broken links?
* Are your documents or repositories have valid links?
* Maybe now not but what about later?


# Solution

* [validateLinks](https://github.com/stefanos1316/validateLinks), a command-line tools written in BASH.
* Free of use and open source.
* Can identify passing, redirected, Client and Server Error links.
* Can be used on local documents or online links.
* Offers statistic results on your links status.
* First Depth Search for local directories.
* Can be added as a crotab to check your webpages or documents periodically.


# Usage Instructions

```java
bash validateLinks // Performs analysis on CWD
bash validateLinks --help // prints help message
bash validateLinks --dir ../ //Performs analysis on PWD
bash validateLinks --link http://www.google.com // Analysis on google site
bash validateLinks --recursive //Depth First Search on CWD
bash validateLinks --passing //show all passing links
bash validateLinks --redirection //show all redirected links
bash validateLinks --clientError //show all client error links
bash validateLinks --serverError //show all server error links
bash validateLinks --version //show current version
```


# Overview

![](media/validateLinks.png)


# Report Bugs

* You are more than welcome to replicate and extend the tools.
* You may report bugs [here](https://github.com/stefanos1316/validateLinks/issues)


# Thank you for your attention!
