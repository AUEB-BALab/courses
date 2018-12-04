<img src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Προγραμματισμός ΙΙ
# XML και XSD

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)
* [Κωνσταντίνος Κραββαρίτης](https://www.balab.aueb.gr/konstantinos-kravvaritis.html)


## XML

* Η XML είναι μία γλώσσα επισημείωσης, όπως είναι και η HTML.
* Είναι σχεδιασμένη ώστε να είναι αυτοπεριγραφική.
* Η διαφορά από την HTML είναι πως φέρει δεδομένα ενώ η HTML παρουσιάζει δεδομένα.
* Δεν χρησιμοποιεί προκαθορισμένες ετικέτες (tags) αλλά τις καθορίζει ο χρήστης.
* Είναι επεκτάσιμη και μπορούν να προστεθούν, να διαφοροποιηθούν ή να τροποποιθούν στοιχεία στο αρχικό σχήμα ενός XML αρχείου.


## Δομή XML

* Τα αρχεία XML δομούνται ως δέντρα στοιχεία (element trees).
* Ξεκινούν από την ρίζα (root element) και συνεχίζουν στα παιδιά (child elements).

```xml
<root>
  <child>
    <subchild>.....</subchild>
  </child>
</root>
```

* Τα στοιχεία (elements) της XML μπορούν να περιέχουν κείμενο, προσδιορισμούς (attributes), άλλα στοιχεία ή συνδυασμό όλων των παραπάνω.
* Οι προσδιορισμοί είναι σχεδιασμένοι για να περιέχουν δεδομένα που σχετίζονται με ένα στοιχείο.


## XSD

* Η XSD είναι η γλώσσα περιγραφής του σχήματος XML
* Ο σκοπός της XSD είναι ο καθορισμός:
	* των στοιχείων και των προσδιορισμών ενός αρχείου
	* του αριθμού και της σειράς των στοιχείων-παιδιών
	* του τύπου δεδομένων των στοιχείων και των προσδιορισμών
	* των πιθανών τιμών των στοιχείων και των προσδιορισμών


## Παράδειγμα

```xml
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">

<xsd:element name="shipOrder" type="order"/>

<xsd:complexType name="order">
  <xsd:sequence>
    <xsd:element name="shipTo" type="shipAddress"/>
    <xsd:element name="items" type="cdItems"/>
  </xsd:sequence>
</xsd:complexType>

<xsd:complexType name="shipAddress">
  <xsd:sequence>
    <xsd:element name="name" type="xsd:string"/>
    <xsd:element name="street" type="xsd:string"/>
    <xsd:element name="address" type="xsd:string"/>
    <xsd:element name="country" type="xsd:string"/>
  </xsd:sequence>
</xsd:complexType>

<xsd:complexType name="cdItems">
  <xsd:sequence>
    <xsd:element name="item" type="cdItem"
                maxOccurs="unbounded"/>
  </xsd:sequence>
</xsd:complexType>

<xsd:complexType name="cdItem">
  <xsd:sequence>
    <xsd:element name="title" type="xsd:string"/>
    <xsd:element name="quantity" type="xsd:integer"/>
    <xsd:element name="price" type="xsd:decimal"/>
  </xsd:sequence>
</xsd:complexType>

</xsd:schema>
```


## Παράδειγμα (2)

```xml
<shipOrder xmlns:xsi="http://www.w3.org/2000/10/XMLSchema-instance">
  <shipTo>
    <name>Joe Doe</name>
    <street>There 2</street>
    <address>4000 RigthHere</address>
    <country>Wonderland</country>
  </shipTo>
  <items>
    <item>
      <title>Java Intro</title>
      <quantity>1</quantity>
      <price>10.90</price>
    </item>
    <item>
      <title>Advanced Java</title>
      <quantity>1</quantity>
      <price>19.90</price>
    </item>
  </items>

</shipOrder>
```


## Παράδειγμα 3

```xml
<?xml version="1.0" encoding="utf-8" ?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"
  xmlns="http://www.w3.org/2001/XMLSchema">
  <xsd:element name="oblivial">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="chalcone" type="xsd:string"/>
        <xsd:element name="casearia" minOccurs="2" maxOccurs="5">
            <xsd:complexType>
              <xsd:simpleContent>
                <xsd:extension base="xsd:string">
                  <xsd:attribute name="deplored" type="xsd:string"
use="required"/>
                  <xsd:attribute name="riccia" type="xsd:string"/>
                </xsd:extension>
              </xsd:simpleContent>
            </xsd:complexType>
        </xsd:element>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>
</xsd:schema>
```


## Παράδειγμα (4)

```xml
<?xml version="1.0" encoding="utf-8" ?>
<oblivial>
	<chalcone>exeter</chalcone>
	<casearia deplored="ferfer" riccia="fwfwfe">emfer</casearia>
	<casearia deplored="grbr" riccia="oemvokemv">fergr</casearia>
</oblivial>
```

