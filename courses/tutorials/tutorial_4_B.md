<img src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Προγραμματισμός ΙΙ
## Κληρονομικότητα, Αφηρημένες κλάσεις, Διεπαφές

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)
* [Θεόδωρος Στασινόπουλος](https://www.balab.aueb.gr/theodore-stassinopoulos.html)


## Κληρονομικότητα

* Κληρονομικότητα στον αντικειμενοστραφή προγραμματισμο είναι η δυνατότητα να
παραχθούν ειδικότερες κλάσεις από γενικότερες.
* Οι ειδικότερες κλάσεις ονομάζονται και υποκλάσεις των γενικότερων και
αντίστροφα οι γενικότερες κλάσεις ονομάζονται υπερκλάσεις των ειδικότερων.
* Ένα αντικείμενο μιας υποκλάσης είναι και αντικείμενο της (κάθε) υπερκλασης.
* Στη java κάθε κλάση μπορεί να κληρομησει άμεσα μόνο μία υπερκλάση
χρησιμοποιώντας τη δεσμευμένη λέξη extends.
```java
class SubClass extends SuperClass {...}
```
* Όλες οι κλάσεις στη java κληρονομούν την κλάση Object ακόμα και όταν αυτό δε
γίνεται ρητά μέσω της εντολής extends.


## Παράδειγμα

```java
class Triangle {

    public String whoIAm() { return "I am a triangle"; }
}

class EquilateralTriangle extends Triangle {

    public String whoIReallyAm() { return "I am equilateral"; }
}
```



## Παράδειγμα(συνέχεια)

```java
public class Test {
    EquilateralTriangle equilateral = new EquilateralTriangle();
    System.out.println(equilateral.whoIAm())
    System.out.println(equilateral.whoIReallyAm());
}
```


## Override

* Μια κλάση μπορεί να αλλάξει τη συμπεριφορά μιας μεθόδου που αλλιώς θα
κληρονομούσε απο υπερκλάση της, ορίζοντάς την με το ίδιο όνομα, τα ίδια ορίσματα,
τον ίδιο τύπο και το σώμα που επιθυμεί ο χρήστης. (Αρκεί να μην έχει χαρακτηριστει
final).
* Όταν μια μέθοδος γίνεται Override ο χρήστης μπορεί να προσθέσει πάνω από τον
ορισμό της μεθόδου το annotation '@Overrride'. Αυτό γίνεται για να:
    * κανει ξεκάθαρο στους χρήστες ότι η μέθοδος γίνεται override.
    * ο μεταγλωτιστης θα αναγνωρίσει κάποιο σφάλμα οπώς για παράδειγμα να μην
    υπάρχει αυτή η μέθοδος στην υπερκλάση.


## Παράδειγμα

```java
class Triangle {

    public String whoIAm() { return "I am a triangle"; }
}

class EquilateralTriangle extends Triangle {

    @Overrride
    public String whοΙAm() { return "I am an equilateral triangle"; }
}
```


## super

* Σε μια κλάση η δεσμευμένη λέξη super είναι αντίστοιχη της δεσμευμένης λέξης
this με τη διαφορά ότι το αντικείμενο αναφέρεται στον εαυτό του ως αντικείμενο
της άμεσης υπερκλάσης.
* Το super χρησιμοποιείται για να κληθεί κάποια μέθοδος της υπερκλάσης που έχει
γίνει override από την υποκλάση, ή κάποιο πεδίο που δεν είναι private.
* Το super(ορίσματα) χρησιμοποιείται για να καλέσει τον κατασκευαστή της άμεσης
υπερκλάσης.
* Σε κάθε κατασκευαστή πρέπει να καλείται ο κατασκευαστής της άμεσης υπερκλάσης
στην πρώτη γραμμή του σώματός του. Αν δεν γραφεί κάτι ρητά τοτε και πάλι καλείται
ο κατασκευαστής της υπερκλάσης στη πρώτη γραμμή ουσιαστικά χωρίς κάποιο όρισμα.


## Παράδειγμα

```java
class Triangle {

    public String whoIAm() { return "I am a triangle"; }
}

class EquilateralTriangle extends Triangle {

    @Override
    public String whοΙAm() {
        return super.whoIAm() + " and an equilateral one too";
    }
}
```



## Παράδειγμα(2)

```java
class Triangle {

    private int base;
    private int height;

    public Triangle(int base, int height) {
        // super();   <-- Εννοείται
        this.base = base;
        this.height = height;
    }
}

class EquilateralTriangle extends Triangle {

    public EquilateralTriangle(int base, int height) {
        super(base, height);  // Εδω η κλήση της super είναι απαραίτητη
    }
}
```



## Αφηρημένες κλάσεις

* Όταν μια συλλογη από κλάσεις εχουν κάποια κοινά πεδία ή/και κάποια κοινή
συμπεριφορά τότε Αυτά τα κοινά στοιχεία μπορούν να εγκολποθούν σε μια υπερκλάση.
Αν αυτή η υπερκλάση είναι υπερβολικά γενική ή τα αντικείμενά της από το
προγραμμα, τότε μπορούμε να την κάνουμε αφηρημένη.
* Μια αφηρημένη κλάση, είναι μια κλάση η οποία δε μπορεί να αρχικοποιηθεί
απευθειας και γινεται διακριτή, από τη δεσμευμένη λέξη 'abstract' στον ορισμό της.
* Παρ' όλο που δεν μπορεί να αρχικοποιηθεί, διαθέτει κατασκευαστή.
* Στις αφηρημένες (μόνο) κλάσεις μπορούν να ορισθούν αφηρημένες μέθοδοι.
* Οι αφηρημένες κλάσεις έχουν όμοιες συμβάσεις για τη γραφή του ονόματός τους με
τις συνήθεις κλάσεις.


## Αφηρημένες μέθοδοι

* Σε αφηρημένες κλάσεις δίνεται η δυνατότητα να οριστουν αφηρημένες μέθοδοι.
* Μια αφηρημένη μέθοδος είναι μια μέθοδος με τη δεσμευμένη λέξη 'abstract' στον
όρισμό της.
* Είναι χρήσιμες στο να επιβάλει μια αφηρημένη κλάση μια γενική συμπεριφορά στις
υποκλάσεις της, δίνοντας όμως στις τελευταιες τη δυνατότητα να ορίσουν τις
λεπτομέριές της (το σώμα της).
* Αν σε μια αφηρημένη κλάση ορισθεί μια αφηρημένη μέθοδος, τότε κάθε υποκλάση της
είναι υποχρεωμένη να την ορίσει λεπτομερώς.


## Παράδειγμα

```java
abstract class Shape {

    private int numberOfVertices;

    public Shape(int numberOfVertices) {
        this.numberOfVertices = numberOfVertices;
    }

    public int getNumberOfVertices() {
        return numberOfVertices;
    }

    public abstract double area();
}
```



## Παράδειγμα(συνέχεια)

```java
class triangle extends Shape {

    private int base;
    private int height;

    public Triangle(int base, int height) {
        super(3)
        this.base = base;
        this.height = height;
    }

    public double area() {
        return (base*height) / 2.0;
    }
}
```



## Παράδειγμα(συνέχεια)

```java
class square extends Shape {

    private int edge;

    public Square(int edge) {
        super(4);
        this.edge = edge;
    }

    public double area() {
        return edge*edge;
    }
}
```



## Διεπαφές

* Ομοιότητες με αφηρημένες κλάσεις
    * Καθορίζουν μέρος της συμπεριφοράς των κλάσεων που τις υλοποιούν.
    * Μπορον να ορισθούν μέθοδοι χωρίς σώμα όπως οι αφηρημένες μέθοδοι χωρίς
    όμως την ανάγκη της δεσμευμένης λέξης 'abstract'. Αντίθετα μέθοδοι με σώμα
    μπορούν να ορισθούν (από το jdk1.8 και μετά) με τη δεσμευμένη λέξη 'default'
    στον ορισμό.
    * Κάθε αντικείμενο που υλοποιεί μια διεπαφή αποκτά και τον τύπο που ορίζει
    το όνομά της.


## Διεπαφές(2)

* Διαφορές με αφηρημένες κλάσεις:
    * Οι διεπαφές υλοποιούνται με τη δεσμευμένη λέξη 'implements' από τις
    κλάσεις.
    * Μια κλάση μπορεί να υλοποιήσει παραπάνω από μια διεπαφές.
    * Μια διεπαφή μπορεί να έχει μονο final static πεδιά (σταθερές). Συνεπώς μια
    διεπαφή δεν επιρρεάζει τη κατάσταση του αντικειμένου που την υλοποιεί αλλά
    μόνο τη συμπεριφορά.
    * Δεν έχουν κατασκευαστές.
    * Στα ονόματα των διεπαφών η σύμβαση έιναι να χρησιμοποιείται συνήθως επίθετο
    αντί για ουσιαστικό σε μορφή CamelCase.


## Παράδειγμα

```java
abstract class Shape {

    private int numberOfVertices;

    public Shape(int numberOfVertices) {
        this.numberOfVertices = numberOfVertices;
    }

    public int getNumberOfVertices() {
        return numberOfVertices;
    }
}
```



## Παράδειγμα(συνέχεια)

```java
interface CalculableArea() {

    double area();
}
```




## Παράδειγμα(συνέχεια)

```java
class triangle extends Shape implements CalculableArea {

    private int base;
    private int height;

    public Triangle(int base, int height) {
        super(3)
        this.base = base;
        this.height = height;
    }

    public double area() {
        return (base*height) / 2.0;
    }
}
```    
