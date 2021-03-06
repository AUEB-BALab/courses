<img src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Προγραμματισμός ΙΙ
# Συμβολοσειρές και Συλλογές

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)
* [Κωνσταντίνος Κραββαρίτης](https://www.balab.aueb.gr/konstantinos-kravvaritis.html)


## Συμβολοσειρές

* Μία συμβολοσείρα (String) είναι μια σειρά από χαρακτήρες. Στην java τα strings είναι 
αντικείμενα της κλάσης String.

* Οι συμβολοσειρές είναι σταθερές - δηλαδή, οι τιμές τους **δεν αλλάζουν μετά την 
δημιουργία τους**. Αντίθετα, ο Stringbuffer έχει μεταβλητό μήκος και τιμές 
χαρακτήρων.

* Όπως και για την δημιουργία άλλων αντικειμένων, έτσι και για να δημιουργήσουμε 
αντικείμενα τύπου String χρειάζεται να χρησιμοποιήσουμε τη λέξη **new** και να 
επικαλεστούμε τον κατασκευαστή.


## Παράδειγμα

```java
char[] helloArray = {'h', 'e', 'l', 'l', 'o', '!'};
String helloStr = new String(helloArray);
System.out.println(helloStr);
```


## Χειρισμός Συμβολοσειρών 

* Το μέγεθος μία συμβολοσειράς επιστρέφεται με το κάλεσμα της συνάρτησεις **length()**
```java
String h = "hello world!";
int l = h.lenght();
```

* Μία αλληλουχία (**concatenation**) από συμβολοσειρές μπορεί να κληθεί ως εξής:
```java
String h = "hello world";
System.out.println("This is an example: " + h);
```
* Για την μετατροπή ενός αριθμού σε συμοβολοσειρά καλούμε την εξής συνάρτηση:
```java
int i = 600;
String s = Integer.toString(i);	
```


##  Σύκριση Συμβολοσειρών

* Οι θέσεις μίας συμβολοσειράς αριθμούνται από το 0. Η μη ύπαρξη θέσης συμβολίζεται με το -1.
```java
h e l l o
0 1 2 3 4
```
* Για να ελέξουμε εάν μία συμβολοσειρά είναι τμήμα μίας άλλης, μπορούμε να χρησιμοποιήσουμε την 
**indexOf(String str2)**

* Η σύγκριση 2 συμβολοσειρών γίνεται είτε με την **equals(Object Obj)** είτε λεξικογραφικά με την 
**compareTo(String str2)**
```java
if (str1.equals(str2))
	System.out.println(str1 + " " + str2);
```


## Μέθοδος substring

* Για να επιστρέψουμε ένα τμήμα μία συμβολοσειράς χρησιμοποιούμε την **substring(int beginIndex, int endIndex)** 
η οποία επιστρέφει το τμήμα που αρχίζει στη θέση beginIndex και τελειώνει στη θέση endIndex - 1.

```java
// Return sustring "world"
// H e l l o   w o r l d
// 0 1 2 3 4 5 6 7 8 9 10

String h = new String("Hello world");
h.substring(6,11);
``` 


## Μέθοδος split(1)

* Για να σπάσουμε μία συμβολοσειρά σε ένα πίνακα από χαρακτήρες χρησιμοποιούμε την **String.split(String reg)**

```java 
// Split using the underscore
String word = new String("Hello_Programming_II");
String[] splitThisString = word.split("_");

// Split using the whitespace
String word2 = new String(Hello Programming               II);
String[] splitThisOneToo = word2.split("\\s+");
// "\\s+" μπορεί να χρησιμοποιηθεί για κενά όπως \n, \t, κτλ.
```


## Μέθοδος split(2)

* Για να σπάσουμε μία συμβολοσειρά n-φορές χρησιμοποιούμε την **split(String reg, int limit)**.

```java
String word2 = new String(“Hello Programming       II”);
String[] splitThisNow = word2.split(“\\s+”, 1);
System.out.println(splitThisNow.length);
```


## Μεταβλητές Συμβολοσειρές

* Η κλάση **StringBuffer** υλοποιεί μεταβλητές συμβολοσειρές και υποστηρίζει τις περισσότερες μεθόδους 
της συμβολοσειράς και μερικές επιπρόσθετες.

```java 
StringBuffer str1 = new StringBuffer("Programming");
String str = " II"; 
str1.append(String str);

```

```java
StringBuffer sb = new StringBuffer("abcdefghijk");
sb.insert(3,"1234");
```

```java
StringBuffer delete(int start, int end)
```

```java
StringBuffer sb = new StringBuffer("abcdefghijk");
sb.replace(3, 8, "DONE");
```


## Συλλογές

* Μία συλλογή (collection) είναι ένα σύνολο από αντικείμενα.

* Ένα πλαίσιο συλλογών (collection framework) υποστηρίζει την αρχιτεκτονικά 
ομογένη παράσταση και χειρισμό των συλλογών, ανεξάρτητα από την υλοποιήση τους.


## Κατηγορίες Συλλογών

![](media/javaCollectionFramework.svg)


## Υλοποιήσεις Συλλογών

* Οι ακολουθίες υλοποιούνται με τους παρακάτω τρόπους:
	* Πίνακας
	* Συνδεδεμένη λίστα (Linked List)

* Τα σύνολα και οι απεικονίσεις υλοποιούνται με τους παρακάτω τρόπους:
	* Πίνακας κατακερματισμού (Hash Table)
	* Ισοζυγισμένο δέντρο (Balanced Tree)
	* Συνδυασμός συνδεδεμένης λίστα και πίνακα κατακερματισμού


## Διαπαφές και Υλοποιήσεις 

![](media/collectionsTable.png)


## ArrayList -- Λίστα Πίνακα
* **ArrayList** είναι μία κλάση που υλοποιεί την διεπαφή **List**.
* **ArrayList** μπορεί να αλλάξει μέγεθος δυναμικά.

```java
// class declaration according to Oracle
public class ArrayList<E> extends AbstractList<E> implements List<E>, .... {
    // ...
}
```


## Παράδειγμα ArrayList 
```java
import java.util.ArrayList;

public class ArrayListDemo {

    public static void main(String[] args) {
        // Δήλωση ArrayList 
        ArrayList<Integer> myList = new ArrayList<>();
        
        // πρόσθεσε στοιχεία στο τέλος της λίστας
        myList.add(1);
        myList.add(2);
        myList.add(4);
        System.out.println(myList);
        
        // πρόσθεσε στοιχείο στην συγκεκριμένη θέση
        myList.add(2, 3);
        System.out.println(myList);
        
        // έλεγχος αν υπάρχει το συγκεκριμένο στοιχείο
        System.out.println("List contains 2? " + myList.contains(2) + "\n"
                            + "List contains 0? " + myList.contains(0));
        
        // διαγραφή όλων των στοιχείων από την ArrayList
        myList.clear();
        System.out.println(myList);
    }

}
```
with output
```
    [1, 2, 4]
    [1, 2, 3, 4]
    List contains 2? true
    List contains 0? false
    []
```


## LinkedList -- Συνδεδεμένη Λίστα

* Κάθε στοιχείο (**κόμβος**) της λίστας έχει δύο χαρακτηριστικά, τα δεδομένα και τον δείκτη 
για τον επόμενο κόμβο.
* Ο τελευταίος κόμβος πρέπει να αναφέρεται στο **null**.
* Το πρώτο στοιχείο της λίστας ονομάζεται κεφάλι (**head**).
* Στην Java η LinkedList είναι υλοποιημένη ως διπλά συνδεδεμένη λίστα.

```java
// class declaration according to Oracle
public class LinkedList<E> extends AbstractSequentialList<E> implements List<E>, Queue<E>, .... {
    // ...
}
```


## Παράδειγμα LinkedList (1)

![](media/Linkedlist.png)


## Παράδειγμα LinkedList (2)
## CircleList, a linked list example
```java
class Circle {
    private Circle next;

    Circle(){ this.next = null; }
    public void setNext (Circle c) { this.next = c; }
    public Circle getNext () { return this.next; }
}

public class CircleList {
    private Circle first_element;
    
    CircleList() { this.first_element = null; }
    
    public void addElement(Circle c) {
        if(this.first_element == null) {
            this.first_element = c; 
        } else {
            Circle current_circle = this.first_element;
            while (current_circle.getNext() != null) {
                current_circle = current_circle.getNext();
            }
            current_circle.setNext(c);
        }
    }

}
```


## Σύγκριση ArrayList και LinkedList

* Αναζήτηση
	* Η ArrayList παρέχει αναζήτηση στοιχείου σε σταθερό χρόνο (ανεξαρτήτως του πλήθους των στοιχείων της λίστας) ενώ η αναζήτηση στην LinkedList εξαρτάται από τον αριθμό των στοιχείων της λίστας.
* Λειτουργίες
	* Η Linkedlist έχει πιο γρήγορες λειτουργίες εισαγωγής, προσθήκης και αφαίρεσης στοιχείων από την ArrayList.
* Χρήση μνήμης
	* Η Linkedlist καταναλώνει περισσότερη μνήμη από την ArrayList.


##  Stack -- Στοίβα
* **Stack**: προσφέρει 2 βασικές λειτουργίες (μεθόδους)
	* push (προσθέτει στοιχείο)
	* pop (αφαιρεί στοιχείο)
* Εκπροσωπεί το μοντέλο "αυτός που ήρθε τελευταίος εξυπηρετείται πρώτος" (lifo).
* Κάθε φορά μπορεί να αφαιρείται το τελευταίο στοιχείο.

```java
// The Stack class, as defined by Oracle
public class Stack<E> extends Vector<E> implements List<E>, ... { 
    // ... 
}
```


## Παράδειγμα Stack (1)

![](media/Stack.svg)


## Παράδειγμα Stack (2)
```java
import java.util.Stack;

public class StackDemo {

    public static void main(String[] args) {
        // Αρχικοποιήση στοίβας
        Stack<Integer> stack = new Stack<>();
        
        // προσθέτουμε στοιχεία στην οροφή της στοίβας
        stack.push(1);
        stack.push(2);
        stack.push(3);
        stack.push(4);
        System.out.println(stack);
        
        // δες την τελευταία προσθήκη
        int top = stack.peek();
        System.out.println("top element: " + top);
        
        // αφαίρεση του τελευταίου στοιχείου και αποθήκευση
        int first = stack.pop();
        System.out.println("popped element: " + first + "\n" + stack);
        
        // δες το τελευταίο στοιχείο
        top = stack.peek();
        System.out.println("top element: " + top);
    }

}
```
