<img src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Προγραμματισμός ΙΙ
## Πολυμορφισμός

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)
* [Κωνσταντίνος Κραββαρίτης](https://www.balab.aueb.gr/konstantinos-kravvaritis.html)


## Πολυμορφισμός

* Είναι η ικανότητα να χρησιμοποιήσουμε μια λειτουργία με
διαφορετικό τύπο, ορίσματα ή παραμέτρους. Υπάρχουν τρία ήδη πολυμορφισμού στη
java.
    * *Ο στατικός*, γνωστός και ως *υπερφόρτωση (overloading)*.
    * *Ο δυναμικός*.
    * *Ο παραμετρικός*, γνωστός και μέσω της χρήσης *γενικευμένων τύπων (generic
        types)*.


## Στατικός πολυμορφισμός και Υπερφόρτωση

* Η υπερφόρτωση είναι η δυνατότητα χρήσης μιας μεθόδου με το όνομά της αλλά με
διαφορετικούς τύπους ορισμάτων.
* Θα προκύψει σφάλμα αν δύο υλοποιήσεις έχουν τον ίδιο αριθμό ορισμάτων
με τον ίδιο τύπο ανεξάρτητα:
    * από τον τύπο που επιστρέφει
    * το όνομα των ορισμάτων
* Μπορεί να προκύψει σφάλμα ακόμα και όταν υπάρχουν ίδια ορίσματα με διαφορετική
σειρά.


## Παράδειγμα

```java
public class Example {

    public int add(int number1, int number2) {...}
    public double add(double number1, int number) {...}
    public int add(int number1, int number2, int number3) {...}
    // public double add(int number1, double number2) {...}
    // public double add(int number1, int number2) {...}
    // public int add(int x, int y) {...}
}
```


## Δυναμικός πολυμορφισμός

* Κάθε αντικείμενο μιας κλάσης που την υλοποιεί έχει τον τύπο της, όπως επίσης
και τον τύπο κάθε υπερκλάσης της και κάθε διεπαφής που υλοποιεί.
* Αυτό είναι χρήσιμο ώστε να μπορούμε να φτιάξουμε πιο αφηρημένα ορίσματα για μεθόδους
ή γενικότερες συλλογές/δομές απο στοιχεία.
* Μπορούμε επίσης να ορίσουμε ένα αντικείμενο τύπου υποκλάσης και αναφορά σε
υπερκλάση ή διεπαφή. Το αντικείμενο θα έχει τη συμπεριφορά της υπερκλάσης/διεπαφής
αφου έχουν γίνει τα overrides που ορίζει η υποκλάση.
```java
Parent child = new Child();
```


## Παράδειγμα

```java
interface CalculableArea {
    public double area(double base, double height);
}

public class Triange implements CalculableArea {
    @ Override
    public double area(double base, double height) {return base*height/2;}
}

public class Square implements CalculableArea {
    @ Override
    public double area(double base, double height) {return base*height;}
}
```


## Παράδειγμα(συνέχεια)

```java
public class Test {
    public static double findArea(CalculableArea shape, double base, double height) {
        return shape.area(base, height);
    }

    public static void main(String[] args) {
        Triangle triangle = new Triangle();
        Square square = new Square();
        double base = 2.0;
        double height = 2.0;

        System.out.println(findArea(triangle, base, height));
        System.out.println(findArea(square, base, height));
    }
}
```


## Παράδειγμα2

```java
class Parent {
    public String whoAmI() {
        return "I am parent";
    }
}

class Child extends Parent{
    @Override
    public String whoAmI() {
        return "I am child ";
    }

    public String also() {
        return "and only a child";
    }
}
```


## Παράδειγμα2(συνέχεια)

```java
public class Test {
    public static void main(String[] args) {
        Parent parent = new Parent();
        Child child = new Child();
        Parent child2 = new Child();

        System.out.println(parent.whoAmI());
        System.out.println(child.whoAmI() + child.also());
        System.out.println(child2.whoAmI());
        // System.out.println(child2.also());
    }
}
```


## Παραμετρικός Πολυμορφισμός και Γενικευμένοι Τύποι

* Ένας γενικευμένος τύπος (generic type) είναι μια γενικευμένη κλάση ή διεπαφή
η οποία μπορεί να παραμετροποιηθεί μέσω τύπων.
* Ένας γενικευμένος τύπος επιτρέπει την επαναχρησιμοποιήση κώδικα με
διαφορετικά αντικείμενα ως παράμετρο.
* Δεν χρειάζεται *type casting*.


## Ορισμός γενικευμένων τύπων

```java
class ΟνομαΚλασης<Τυπος1,... ,ΤυποςΝ> {...}
```

```java
interface ΟνομαΔιεπαφης<Τυπος1,... ,ΤυποςΝ> {...}
```


## Παράδειγμα

```java
class Summarizer<T> {
    public T add(T num1, T num 2) {return num1 + num2;}
}
```


## Αρχικοποίηση γενικευμένων τύπων

```java
ΟνομαΚλάσης<Τυπος1,... , ΤυποςΝ> αντικείμενο = new ΟνομαΚλασης<>();
```

* *Παρατήρηση:* Πριν τη java7 έπρεπε να επαναλάβουμε τους τύπους και στα δεύτερα
'<>'.


## Παράδειγμα

```java
public class Test {
    public static void main(String[] args) {
        Summarizer<Integer> sum1 = new Summarizer<>();
        Summarizer<String> sum2 = new Summarizer<>();

        System.out.println(sum1.add(3, 5));
        System.out.println(sum2.add("foo", "bar"))
    }
}
```
