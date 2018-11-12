<img src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Προγραμματισμός ΙΙ
# Διαχείρηση Αρχείων

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)
* [Κωνσταντίνος Κραββαρίτης](https://www.balab.aueb.gr/konstantinos-kravvaritis.html)


## Αρχεία

* Τρόπος μόνιμης αποθήκευσης δεδομένων.
* Για να γράψουμε ή να διαβάσουμε μέσα από αρχεία, χρησιμοποιούμε τη ροή εισόδου 
και εξόδου (I/O streams)


## Ροή Εισόδου και Εξόδου (I/O Streams)

Μία ροή (**stream**) αναφέρεται σε μια σειρά από ταξινομημένα δεδομένα που διαβάζονται από ή γράφονται σε ένα αρχείο. 

![](media/files_1.png)
![](media/files_2.png)


## Τρόποι διαχείρισης αρχείων (1)

<div style="text-align: justify"> 
**Byte Streams**: εισαγωή και εξαγωγή 8-bit ή 1 byte. Χρησιμοποιούνται για χαμηλού επιπέδου διαχείριση δεδομένων εισόδου και εξόδου. Η είσοδος και η έξοδος από ένα αρχείο βασίζεται σε bytes.
</div>

```java
FileInputStream in = new FileInputStream("infile.txt");
FileOutputStream in = new FileOutputStream("outfile.txt");
```


## Τρόποι διαχείρισης αρχείων (2)
<div style="text-align: justify"> 
**Character Streams**: αποτελούν “wrappers” των byte streams. Χρησιμοποιούν byte streams για χειρισμό δεδομένων εισόδου και εξόδου σε χαμηλό επίπεδο (low-level I/O), καθώς τα character streams χειρίζονται τη μετάφραση των χαρακτήρων σε bytes. Η είσοδος και η έξοδος σε και από ένα αρχείο βασίζεται σε χαρακτήρες.
</div>

```java
FileReader in = new FileReader("infile.txt"); 
FileWriter in = new FileWriter("outfile.txt"); 
```


## Τρόποι διαχείρισης αρχείων (3)
<div style="text-align: justify"> 
**Buffer Streams**: χρήσιμοποιούν _buffers_ στο διάβασμα (**read**) ή στο γράψιμο (**write**) αρχείων. Βοηθούν στην αποδοτικότητα των προγραμμάτων καθώς τα αιτήματα read/write δεν χειρίζονται κατευθείαν από το λειτουργικό σύστημα.
</div>

```java
BufferedReader in = new BufferedReader(new FileReader("infile.txt"));
BufferedWriter out = new BufferedWriter(new FileWriter("outfile.txt"));
```


## Τρόποι διαχείρισης αρχείων (4)
<div style="text-align: justify"> 
**Data Streams**: υποστηρίζουν δυαδική είσοδο και έξοδο (**binary Ι/Ο**) από πρωταρχικούς τύπους δεδομένων (**primitive data types**: boolean, char, byte, short, int, long, float, και double) καθώς και **String**.
</div>

```java
DataOutputStream out = new DataOutputStream(new BufferedOutputStream(
              new FileOutputStream(dataFile)));
DataInputStream in = new DataInputStream(new BufferedInputStream(
              new FileInputStream(dataFile)));
```


![](media/files_3.png)


## Ανάγνωση αρχείου

<div style="text-align: justify"> 
Mε FileInputStream: διαβάζει ροές από bytes (π.χ. image data) αφού ανοίξει μια σύνδεση με το αρχείο. 
</div>

* Μπορεί να διαβάσει μέχρι ένα συγκεκριμένο αριθμό δεδομένων με την χρήση της read(byte[] b).
	* Εάν δε βρεθεί το αρχείο, πετάει την εξαίρεση: **FileNotFoundException**.
	* Με **DataInputStream**: διαβάζει πρωταρχικούς τύπους δεδομένων (boolean, char, double, float, etc.) και String.
	* Γράφει ένα String σε ένα αρχείο με τη χρήση της writeUTF(String str). 
	* Mπορεί να πετάξει IOException (προβλήματα εισόδου/εξόδου), γι’ αυτό πρέπει να χρησιμοποιούνται οι μέθοδοι .flush() για τις ροές (πετάει τα δεδομένα του buffer στο αρχείο).


## Εγγραφή σε αρχείο 

<div style="text-align: justify"> 
Με FileOutputStream: ανοίγει μια ροή για να γράψει δεδομένα σε ένα αρχείο.
</div>
* Μπορεί να γράψει μέχρι ένα συγκεκριμένο αριθμό δεδομένων με την χρήση της write(byte[] b).
	* Εάν δε βρεθεί το αρχείο, πετάει την εξαίρεση: **FileNotFoundException**.
	* Με **DataOutputStream**: γράφει πρωταρχικούς τύπους δεδομένων (boolean, char, double, float, etc.) και String.
