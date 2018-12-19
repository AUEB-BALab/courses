<img src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Προγραμματισμός ΙΙ
##  Οδηγός εγκατάστασεις του Jarpeb

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)
* [Κωνσταντίνος Κραββαρίτης](https://www.balab.aueb.gr/konstantinos-kravvaritis.html)


## Εισαγωγή στο Jarpeb

<p align="justify">Για τις ασκήσεις του μαθήματος Προγραμματισμός ΙΙ θα χρειαστεί να
χρησιμοποιήσετε το αρχείο __Exercise.jar__
Το __Exercise.jar__ περιέχει τις ασκήσεις σας καθώς και τη γραφική διεπαφή που θα
χρησιμοποιήσετε για την υποβολή των απαντήσεων και των αποτελεσμάτων σας.
Για να χρησιμοποιήσετε το σύστημα θα πρέπει ο υπολογιστής σας να έχει εγκατεστημένo
το Java SDK (τουλάχιστον την έκδοση SE 8).</p>

<p align="justify">
Παρακάτω, ακολουθούν οδηγίες σχετικά με την εκτέλεση του Exercise.jar και τη
χρήση του jarpeb, για τον έλεγχο και την υποβολή των εργασιών σας. Για όλες τις
ασκήσεις του μαθήματος θα χρησιμοποιήσετε το αρχείο Exercise.jar καθ’ όλη τη
διάρκεια του εξαμήνου.<p>


## Εκτέλεση του Exercise.jar από το εργαστήριο

* Κατεβάστε από τον δύνδεσμο του μαθήματος το [__Exercise.jar__](https://www2.dmst.aueb.gr/dds/isdi/exercise/links.htm)
* Για να εκτελέσετε το Jarpeb, ανοίξτε ένα τερματικό (start-> cmd) και εκτελέστη την εντολή:
	* java -jar μονοπάτι όπου βρισκεται το Exercise.jar/Exercise.jar


## Εκτέλεση του Exercise.jar από το σπιτι (1)

<p align="justify">Εαν δουλεύετε από το σπίτι, σε Windows (7, 8, ή 10), θα πρέπει να εγκαταστήσετε
πρώτα το JDK (οι οδηγίες βρίσκονται πιο κάτω): </p>
* Κατεβάστε και εγκαταστήστε το JDK (Java Development Kit) για το λειτουργικό σύστημα που έχετε και την κατάλληλη αρχιτεκτονική (π.χ. Windows x86 ή x64) από τον ακόλουθω [σύνδεσμο](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)


## Εκτέλεση του Exercise.jar από το σπιτι (2)

* Στη συνέχεια πρέπει να δηλώσετε τη μεταβλητή συστήματος (environment variables) ακολουθώντας τα παρακάτω βήματα:
	* δεξί-κλικ στον προσωπικό σας υπολογιστή (MyComputer) και επιλέξτε
		ιδιότητες (properties) → Ρυθμίσεις συστήματος για προχωρημένους
		(Advanced system settings) → Μεταβλητές περιβάλλοντος (Environment
		Variables) → Πατήστε Δημιουργία (New) που βρίσκεται κάτω απο τις
		Μεταβλητές συστήματος (System Variables) και συμπληρώστε με βάση το
		βήμα ii.
	* Όνομα μεταβλητής (Variable name): JAVA_HOME
		Τιμή μεταβλητής (Variable value): εδώ πρέπει να βάλετε το απόλυτο
		μονοπάτι που έχει εγκατασταθει το jdk (συνήθως είναι στο Program Files \
		JAVA\jdk****\) ακολούθως κάντε αντιγραφή/επικόλληση (copy/paste) το
		σχετικό μονοπάτι.


## Εκτέλεση του Exercise.jar από το σπιτι (2)

Στη συνέχεια, κάντε μια επαλήθευση ότι οι περιβαλλοντικές μεταβλητές λειτουργούν σωστά
εκτελώντας την πιο κάτω εντολή μέσα στο τερματικό (cmd):
	
	$ java -version

Αυτό θα πρέπει να σας εκτυπώσει κάποιο μήνυμα όπως
	
	$ openjdk version "1.8.0_181"
	$ OpenJDK Runtime Environment (build 1.8.0_181-b15)
	$ OpenJDK 64-Bit Server VM (build 25.181-b15, mixed mode)


## Παράδειγμα 2

![](media/Jarpeb_GUI.png)


![](media/Jarpeb_Exercises.jpg)


## Έλεγχος Υλοποιήσης

![](media/Correct_Sumbission.png)


## Έλεγχος Καταχώρησης

![](media/Correctly_Submitted_Exercises.jpg)
