<img src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Προγραμματισμός ΙΙ
# Εκφράσεις Lamda

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)
* [Κωνσταντίνος Κραββαρίτης](https://www.balab.aueb.gr/konstantinos-kravvaritis.html)


## Εκφράσεις Lambda

* Τις χρησιμοποιούμε για συναρτησιακό προγραμματισμός.
* Δεν είναι απαραίτητο να δημιουργήσουμε αντικείμενα για την κλήση τους.
* Μπορούμε να τις περάσουμε ως ορίσματα σε μεθόδους.
* Υποστηρίζονται από την Java 8 και μετά.
* Ορίζονται ανώνυμα.


## Παράδειγμα (1)

```java
	(Short a) -> return (short)(a / 35);
	(a) -> return a * a / a + a - a;
	(param) -> {
		System.out.println("param: " + param);
		return "return value";
	}
``` 


## Συναρτήση accept

* __void accept(T t)__ κατανάλωση της τιμής __t__

```java
import java.util.function.Consumer;

public class Main {
  public static void main(String[] args) {
    Consumer<String> c = (x) -> System.out.println(x.toLowerCase());
    c.accept("Java2s.com");
  }
}
```


## Συνάρτηση apply

* __R apply(T t)__ δίνει στην συνάρτηση που την καλή την τιμή __t__

```java
import java.util.function.Function;

public class Decess {
	public static Function<Integer,
		Integer> multiplyThreeElements(int b, int c) {
		return (a) -> a * b * c;
	}

	public static void main(String[] args) {
         System.out.println(multiplyThreeElements(3,3).apply(2));
 }
}
```


## Παράδειγμα (2)

```java
import java.util.function.Function;

public class Lambda {
        public static Function<Long, Long> divideThem(Function<Long,
                Long> divideWith) {
                return (Long a) -> (long)(divideWith.apply(a / 15));
        }

        public static void main(String[] args) {

                Function<Long, Long> divideWith =
					(Long a) -> (long) (100 / a);
                System.out.println(divideThem(divideWith)
					.apply(new Long(30)));
        }
}
```


## Συνάρτηση compose

* __Function compose(Function g)__ εφαρμώζει μια συνάρτηση __f__ (αυτή που καλεί την compose) σε μια συνάρτηση __g__

```java
import java.util.function.Function;

public class Main {

  public static void main(String[] args) {
    Function<Integer,String> converter = (i)-> Integer.toString(i);
    
    Function<String, Integer> reverse = (s)-> Integer.parseInt(s);
   
    System.out.println(converter.apply(3).length());
    System.out.println(converter.compose(reverse).apply("30").length());
  }
}
```


## Παράδειγμα (3)

```java
import java.util.function.Function;

public class Decess {

	public static Function<Integer,
	Integer> multiplyThreeElements(int b, int c) {
		return (a) -> a * b * c;
	}

	public static void main(String[] args) {
		Function<Integer, Integer> multiplyAgain =
				multiplyThreeElements(3, 3)
				.compose(multiplyThreeElements(2, 2));
		System.out.println(multiplyAgain.apply(2));
	}
}
```
