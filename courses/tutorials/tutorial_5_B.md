<img src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Προγραμματισμός ΙΙ
## Εξαιρέσεις και Ισχυρισμοί

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)
* [Θεόδωρος Στασινόπουλος](https://www.balab.aueb.gr/theodore-stassinopoulos.html)


## Εξαιρέσεις

* Μία εξάιρεση είναι ένα γεγονός που παρακάμπτει την κανονική εκτέλεση ενός προγράμματος.
* Δίνει την δυνατότητα να χειριστούμε γεγονότα όταν γίνει κάτι το ασυνήθιστο.
* Αποφεύγουμε την δημιουργεία περίπλοκου κώδικα στον χειρισμό πιθανού σφάλματος.
* Δίνει δυναντότητα μετάδοσεις σφάλματος στο ίχνος στοίβας (stack trace).


## Παράδειγμα ψευδοκώδικα

* Λάθη? 

```java
readFile {
    open the file;
    determine its size;
    allocate that much memory;
    read the file into memory;
    close the file;
}
```


## Χειρισμός ψευδοκώδικα

```java
errorCodeType readFile {
    initialize errorCode = 0;
    
    open the file;
    if (theFileIsOpen) {
        determine the length of the file;
        if (gotTheFileLength) {
            allocate that much memory;
            if (gotEnoughMemory) {
                read the file into memory;
                if (readFailed) {
                    errorCode = -1;
                }
            } else {
                errorCode = -2;
            }
        } else {
            errorCode = -3;
        }
        close the file;
        if (theFileDidntClose && errorCode == 0) {
            errorCode = -4;
        } else {
            errorCode = errorCode and -4;
        }
    } else {
        errorCode = -5;
    }
    return errorCode;
}
```


## Σωστός χειρισμός ψευδοκώδικα

```java
readFile {
    try {
        open the file;
        determine its size;
        allocate that much memory;
        read the file into memory;
        close the file;
    } catch (fileOpenFailed) {
       doSomething;
    } catch (sizeDeterminationFailed) {
        doSomething;
    } catch (memoryAllocationFailed) {
        doSomething;
    } catch (readFailed) {
        doSomething;
    } catch (fileCloseFailed) {
        doSomething;
    }
```


## Χηρισμός εξαιρέσεων 

* Μπορέι να γίνει χρησιμοποιώντας το **try-catch**.

```java
try {
    some code here
} catch and finally blocks …
```


## throws

* Μπορούμε να ορίσουμε την πιθανότητα να προκήψη μία εξαίρεση στην υπογραφή μίας μεθόδου. 

```java
public void writeList() throws IOException, IndexOutOfBoundsException {...}
```


## throw new

* Μπορούμε να ορίσουμε την πιθανότητα δημιουργίας μίας εξαίρεσης  μέσο της **throw new** λέξης.
* Επίσης, θα πρέπει αν ορίσουμε στην υπογραφή της μεθόδου την λέξη **throws** με το όνομα της εξαίρεσης.

```java

public void checkAmout(int amount) throws NegativeAmoutException {
	if (amount < 0) {
   		throw new NegativeAmountException();
	}
}
```


## Τύποι εξαιρέσεων

![](media/exceptions.png)


## Παραδείγμα Checked Exception

```java
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;

public  class testClass {

	public static void main(String args[])  {		
	      File file = new File("E://file.txt");
	      try {
			FileReader fr = new FileReader(file);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	   }
}
```


## Παράδειγμα Unchecked Exception

```java
	import java.io.*;
	
	public class ExcepTest {
		public static void main(String[] args) {
			int a[] = new int[2];
			try {
				System.out.println("Access elements three:" + a[3]);
			} catch(ArrayIndexOutOfBoundsException e) {
				System.out.println("Exception thrown :" +e);
			}
			System.out.println("Out of the block");
		}
	}
```


## Χρήση της finally

```java
public class ExcepTest {

   public static void main(String args[]) {
      int a[] = new int[2];
      try {
         System.out.println("Access element three :" + a[3]);
      } catch(ArrayIndexOutOfBoundsException e) {
         System.out.println("Exception thrown  :" + e);
      } finally {
         a[0] = 6;
         System.out.println("First element value: " + a[0]);
         System.out.println("The finally statement is executed");
      }
   }
}
```


## Ίχνη Στοίβας

* Τα ίχνη στοίβας περιέχουν αποτελέσματα σφαλμάτων μίας εφαρμογής 
όπου προσφέρουν στοιχεία για τα αίτια του σφάλματος. 
* Η χρήση της μεθόδου **printStackTrace()** δίνει το δέντρο της 
στοίβας αν κάποια μέθοδος έχει αποτύχη.


## Παράδειγμα για Ίχνη Στοίβας

```java
Exception in thread "main" java.lang.NullPointerException: Fictitious NullPointerException
at StackTraceExample.method111(StackTraceExample.java:15)
at StackTraceExample.method11(StackTraceExample.java:11)
at StackTraceExample.method1(StackTraceExample.java:7)
at StackTraceExample.main(StackTraceExample.java:3)
```


## Δημιουργεία εξαιρέσεων

* Μπορούμε να δημιουργήσουμε τις δικές μας εξαιρέσεις επεκτείνοντας τις κλάσεις π.χ. **Exception**, **RuntimeException** 


## Ισχυρισμοί (1)

* Χρησιμοποιείτε για έβρεση λαθών μέσα στον κώδικα.
* Χρησιμοποιεί μια έκφραση boolean, αν αυτή επιστρέψει λάθος τότε προσδιορίζει την ένδειξη σφάλματος στο κώδικα 
με την εκτύπωση κάποιου μηνύματος.
* Για χρήση του assertion πρέπει να εκτελέσετε ώς έχει: java -ea|-enableassertion executable
* Επιτρέπει την τεκμηρίωση του κώδικα και τον τρόπο λειτουργίας του.


## Ισχυρισμοί (2)

* Επιτρέπει την κατανοώηση του προγράμματος μας για άλλα άτομα.
* Βοηθούν στην εύκολη αποσφαλμάτωση του κώδικα.
* Οι ισχυρισμοί δεν έιναι για τους χρήστες ενός προγράμματος αλλά για του μηχανικούς λογισμικού.
* Οταν εντοπιστεί σφάλμα ισχυρισμού συνήθως πρέπει να σταματά η λειτουργία ενός προγράμματος.


## Διαφορές Ισχυρισμών με Εξαιρέσεις

* Με τους ισχυρισμούς ελέγχουμε περιπτώσεις που δεν πρέπει ποτέ να συμβούν ενώ με τις εξαιρέσεις 
κάτι που μπορεί να συμβεί.
* Ο ισχυρισμός σταματάει την εκτέλεση του προγράμματος ενώ η εξαίρεση επιτρέπει την συνέχεια αν μπορεί 
να διορθωθεί το συγκεκριμένο σφάλμα.


## Παράδειγμα (1)

```java
BankAccount acct = null;

// ...
// Get a BankAccount object
// ...

// Check to ensure we have one
              assert acct != null : "Object Null";
``` 


## Παράδειγμα (2)

```java
import java.io.*;

public class AssertionTest3 {

   public static void main(String argv[]) throws IOException {
      System.out.print("Enter your marital status: ");
      int c = System.in.read();
      switch ((char) c) {
         case 's':
         case 'S': System.out.println("Single"); break;
         case 'm':
         case 'M': System.out.println("Married"); break;
         case 'd':
         case 'D': System.out.println("Divorced"); break;
         default: assert !true : "Invalid Option"; break;
      }

   }
}
```


## Παράδειγμα (3)

```bash
	[sgeorgiou@aiolos]$ java -ea AssertionTest3 
	Enter your marital status: n
	Exception in thread "main" java.lang.AssertionError: Invalid Option
		at AssertionTest3.main(AssertionTest3.java:15)

```

