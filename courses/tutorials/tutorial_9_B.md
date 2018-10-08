<img src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Προγραμματισμός ΙΙ
# Καννονικές Εκφράσεις

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)
* [Κωνσταντίος Κραββαρίτης](https://www.balab.aueb.gr/konstantinos-kravvaritis.html)


## Κανονικές Εκφράσεις

* Είναι σειρές από χαρακτήρες, αριθμούς και ειδικά σύμβολα που εκφράζουν καθορισμένα πρότυπα βάσει συγκεκριμένης σύνταξης. 
* Χρησιμοποιούνται για ταυτοποίηση συγκεκριμένων μοτίβων (pattern matching) κανονικών εκφράσεων (regular expressions) σε λέξεις, προτάσεις, αριθμούς, και αρχεία.
* Βοηθούν στην αναζήτηση, στην επεξεργασία και στο χειρισμό κειμένου και δεδομένων.


## Ειδικά Σύμβολα (1)

|  Μοτίβο |                  Επεξήγηση                  |              Παράδειγμα             |
|:-------:|:-------------------------------------------:|:-----------------------------------:|
|   [ab]  | ταιριάζει κάθε χαρακτήρα μέσα στις αγκύλες  | ri[cs]e -> rice ή rise             |
| abc&#124;adc | ταιριάζει είτε τη μία είτε την άλλη λέξη    | man&#124;men -> man ή men                |
|    ^    | ταιριάζει το μοτίβο στην αρχή  της γραμμής  | ^What-> What time...                |
|    $    | ταιριάζει το μοτίβο στο τέλος  της γραμμής  | o'clock\.$ -> 8 o'clock.            |
|    ?    | 0 ή 1 εμφάνιση του  προηγούμενου μοτίβου    | colou?r -> Light blue is  my colour |


## Ειδικά Σύμβολα (2)

|   Μοτίβο  |                       Επεξήγηση                      |  Παράδειγμα  |
|:---------:|:----------------------------------------------------:|:------------:|
|     +     | 1 ή περισσότερες εμφανίσεις του προηγούμενου μοτίβου | [123]+-> 2   |
|     *     | 0 ή περισσότερες εμφανίσεις του προηγούμενου μοτίβου | [123]*->456  |
|    {n}    | ταιριάζει ένα συγκεκριμένο αριθμό ψηφίων             | 5{3}-> 555   |
| {min,max} | ταιριάζει από/μέχρι ένα  συγκεκριμένο αριθμό ψηφίων  | m{1,5}->mmmm |
|   [0-9]   | ταιριάζει αριθμούς από 0 έως 9                       | [0-9] -> 7   |


## Ειδικά Σύμβολα (3)

|  Μοτίβο  |                        Επεξήγηση                        |    Παράδειγμα    |
|:--------:|:-------------------------------------------------------:|:----------------:|
| [a-zA-Z] | ταιριάζει γράμματα από το a έως το z κεφαλαία και μικρά | [a-zA-Z] -> r    |
|  [^a-z]  | δεν ταιριάζει ό,τι υπάρχει μέσα  στα άγκυστρα           | [^a-z] -> R      |
|  \n, \t  | ταιριάζει χαρακτήρες με  backslash                      | new line\n -> \n |
|    \w    | ταιριάζει γράμματα χαρακτήρες  [0-9Α-Ζa-z_]             | [\w]\t -> o\t    |
|    \W    | δεν ταιριάζει γράμματα χαρακτήρες  [^0-9Α-Ζa-z_]        | [\W] -> \n       |


## Ειδικά Σύμβολα (4)

| Μοτίβο |                      Επεξήγηση                      |     Παράδειγμα    |
|:------:|:---------------------------------------------------:|:-----------------:|
|   \d   | ταιριάζει ψηφία όπως το [0-9]                       | [\d] -> 7         |
|   \D   | δεν ταιριάζει ψηφία όπως το  [^0-9]                 | [\D] -> a         |
|   \s   | ταιριάζει whitespace χαρακτήρες  όπως [\t\n\r]      | a\s -> a (space)  |
|   \S   | δεν ταιριάζει whitespace χαρακτήρες  όπως [^\t\n\r] | a[^\t\n\r] -> cat |
|    .   | ταιριάζει οτιδήποτε                                 | .+ -> jdf235!\n   |


## Κανονικές εκφράσεις στη Java

* Για τη χρήση κανονικών εκφράσεων στη Java χρησιμοποιείται το java.util.regex API το οποίο διαθέτει 3 βασικές κλάσεις: Pattern, Matcher, και PatternSyntaxException.
* Η κλάση String διαθέτει μεθόδους που χρησιμοποιούν κανονικές εκφράσεις 
(Summary of regular-expression constructs: 
https://docs.oracle.com/javase/8/docs/api/java/util/regex/Pattern.html).


## Μεθόδοι της κλάσης String για κανονικές εκφράσεις 

|   Τύπος  |             Όνομα μεθόδου            |                        Περιγραφή                        |
|:--------:|:------------------------------------:|:-------------------------------------------------------:|
|  boolean |         matches(String regex)        | επιστρέφει true αν υπάρχει η έκφραση                    |
|  String  | replaceAll(String regex, String relpacement) | αλλάζει μία έκφραση με μία συγκεκριμένη συμβολοσειρά        |
| String[] |          split(String regex)         | Σπάει μια συμβολοσειρά σε  ένα πίνακα από συμβολοσειρές |


## Μοτίβα

|      Τύπος     |               Όνομα μεθόδου               |                          Περιγραφή                         |
|:--------------:|:-----------------------------------------:|:----------------------------------------------------------:|
| static Pattern |           compile(String regex)           | μεταγλωττίζει την κανονική  έκφραση σε μοτίβο              |
| static Pattern |      compile(String regex,  int flag)     | μεταγλωττίζει την κανονική  έκφραση σε μοτίβο με "σημαίες" |
| static Pattern | matches(String regex, CharSequence input) | Προσπαθεί να ταιριάξει το μοτίβο με δεδομένα εισόδου       |


## Ταιριαστής

|  Τύπος  | Όνομα μεθόδου |                         Περιγραφή                        |
|:-------:|:-------------:|:--------------------------------------------------------:|
| boolean |   matches()   | προσπαθεί να βρει την εμφάνιση  ενός μοτίβου             |
|   int   |    start()    | επιστρέφει την θέση  που αρχίζει η έκφραση               |
|   int   |     end()     | επιστρέφει την θέση που  τελειώνει η έκφραση +1          |
| boolean |     find()    | ψάχνει εμφανίσεις της κανονικής  έκφρασης σε ένα κείμενο |



## Παράδειγμα (1)

```java
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

public class RegexMatchFind {
	public static void main(String[] args) throws PatternSyntaxException {
	    Pattern p = Pattern.compile("[\\d]{3}");
	    Matcher m = p.matcher("a123b");
	    System.out.println(m.find());
	    System.out.println(m.matches());
	    boolean b = Pattern.matches("[\\d]{3}", "a123b");
	    System.out.println(b);

	    p = Pattern.compile("^[a-z0-9]+$");
	    m = p.matcher("123");
	    System.out.println(m.find());
	    System.out.println(m.matches());
	    boolean c = Pattern.matches("^[a-z0-9]+$", "123");
	    System.out.println(c);
	}
}
```


## Παράδειγμα (2)

```java
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SimpleRegex {
	
	public static void main(String args[]) {
		// String for the pattern-matching.
		String line = "New order 567TW.";
		// Given pattern
		String pattern = "[0-9]+(Q|TW){1,2}.";

		// Pattern object
		Pattern r = Pattern.compile(pattern);
		// Matcher object.
		Matcher m = r.matcher(line);
		
		// Check
		if (m.find()) {
			System.out.println(m.group());
		} else {
			System.out.println("NO MATCH");
		}

		// Replace m with the given string
		line = m.replaceAll("##");
		System.out.println(line);
		
		String line2 = "mesquite in your cellar";
		System.out.println(line2.replace('e', 'o'));
	}
}
```
