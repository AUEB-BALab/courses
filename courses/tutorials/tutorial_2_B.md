<img src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Προγραμματισμός ΙΙ
## Κανόνες μορφοποιήσης

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)
* [Κωνσταντίνος Κραββαρίτης](https://www.balab.aueb.gr/konstantinos-kravvaritis.html)


## Καλογραμμένος Κώδικας

* Λιγότερα λάθη
* Ευκολότερος εντοπιζμός σφαλμάτων
* Ευκολότερη συντήρηση του λογισμικού
* Ευκολότερη επέκταση του λογισμικού
* Ευκολότερη κατανόηση του κώδικά μας από τρίτους


## Παράδειγμα(1)

```java
public class Queller{
public static int getDispetal(int cobber,int whinnock){
int result=0;
if(cobber==whinnock)
result=cobber-whinnock;
result++;
else result = cobber*whinnock;
return result;}
public static int getGoverness(int mesodesma,int natrium,int stewardry){
int res = 0;
int haulabout=natrium+(1-mesodesma);
if ((haulabout*haulabout)==stewardry)
res=haulabout;
else res=4*haulabout;
return res;}}
```


## Καλές Πρακτικές

* Γράφουμε σύντομες μεθόδους (<<200 γραμμές)
* Αν μια μέθοδος ή κλάση είναι υπεύθυνη για παραπάνω
από μία λογική λειτουργεία, προσπαθούμε να τη σπάσουμε
σε επιμέρους κομμάτια. (Single Responsibility Principle)
* Χρησιμοποιούμε απλή λογική και ροές ελέγχου
* KISS (Keep It Simple Stupid)


## Συμβάσεις Ονομάτων (1)

* Χρησιμοποιούμε ονόματα (για μεταβλητές, μεθόδους, και κλάσεις) που υπονοούν το σκοπό χρήσης τους.
* Αποφεύγουμε συντομογραφίες (π.χ. επιλέγουμε calculatePerYear, όχι cpy).
* Επιλέγουμε σύντομα ονόματα για δείκτες μέσα σε βρόγχους (π.χ. i) και πιο αναλυτικά ονόματα για μεταβλητές που αφορούν κάποιο σκοπό.
* Αποφεύγουμε γενικά ονόματα (π.χ. foo) και επιλέγουμε όρους σχετικούς με το αντικείμενο της εφαρμογής μας.
* Ονομάζουμε σταθερές με βάση το νόημά τους και όχι την τιμή τους (π.χ. MIN_PER_HOUR, όχι SIXTY).
* Οι boolean μεταβλητές και μέθοδοι θα πρέπει να είναι ξεκάθαρες στο νόημά τους (π.χ. isEmpty(), contains())


## Συμβάσεις Ονομάτων (2)

| Σύμβολο    |                                           Κανόνας                                           | Παράδειγμα                   |
|------------|:-------------------------------------------------------------------------------------------:|------------------------------|
| Μεταβλητές | σύντομα ονόματα,  μικρό αρχικό γράμμα,  camelCase                                           | wageByYear foundName isEmpty |
|  Σταθερές  | κεφαλαία γράμματα, underscore στο διαχωρισμό των λέξεων                                     | MIN_PER_HOUR                 |


## Συμβάσεις Ονομάτων (3)

| Σύμβολο    |                                           Κανόνας                                           | Παράδειγμα                   |
|------------|:-------------------------------------------------------------------------------------------:|------------------------------|
|   Μέθοδοι  | χρήση ρήματος που δηλώνει τι  κάνει η μέθοδος,  μικρό αρχικό γράμμα,  camelCase             | draw() calculateSum()        |
|   Κλάσεις  | χρήση ουσιαστικού που δηλώνει τι  αντιπροσωπεύει η κλάση, κεφαλαίο αρχικό γράμμα, CamelCase | Office, PhoneBook            |


## Παράδειγμα

<div align="justify">
Να γραφτεί πρόγραμμα που να δέχεται σαν όρισμα ένα πίνακα πραγματικών αριθμών που έχει θερμοκρασίες
σε Farenheit για κάθε μήνα του έτους, να υπολογίζει το μέσω όρο όλου του χρόνου και
αν η θερμοκρασία σε Celsius ειναι κάτω απο 0 να επιστρέφει "cold", αλλίως να
επιστρέφει "warm". (Δε χρειάζεται έλεγχος για την εγκυρότητα του ορίσματος)
</div>


```java
    public static String foo(double[] a) {
        double t = 0;
        for (int i = 0; i < 12; i++) {
        t = t + a[i];}
        t=t/12;
        t = ((t-32)*5)/9;
        if (t < 0) {return "cold";}
        else {
        return "warm";
        }
    }

```


```java
    private static final double TEMPERATURE_THRESHOLD = 0.0;
    private static final int NUMBER_OF_MONTHS = 12;
    private static final String COLD = "cold";
    private static final String WARM = "warm";

    public static String findAnnualWeatherCondition(double[] monthlyTemperaturesInFarenheit) {
        double meanTemperature = getMeanTemperatures(monthlyTemperaturesInFarenheit);
        double meanInCelsius = convertFarenheitToCelsius(meanTemperature);
        return weatherLabelRelativeToTemperature(meanInCelsius);
    }

    private static double getMeanTemperatures(double[] monthlyTemperaturesInFarenheit) {
        double sumTemperatures = 0;
        for (int i = 0; i < 12; i++) {
            sumTemperatures = sumTemperatures + monthlyTemperaturesInFarenheit[i];
        }
        return sumTemperatures/NUMBER_OF_MONTHS;
    }

    private static double convertFarenheitToCelsius(double farenheitTemperature) {
        return ((farenheitTemperature - 32)*5)/9;
    }

    private static String weatherLabelRelativeToTemperature(double temperature) {
        if (temperature < TEMPERATURE_THRESHOLD) {
            return COLD;
        } else {
            return WARM;
        }
    }
```


## Σχόλια (1)

* Προσπαθούμε όσο μπορούμε να γράφουμε τον κώδικά μας με επεξηγηματικό τρόπο χρησιμοποιώντας τις παραπάνω καλές παρακτικές
ώστε να μη χρειάζεται η χρήση σχολίων. (“Good code documents itself!”). Αν παρ' όλα αυτά χρειάζεται κάποια
επεξήγηση και τα σχόλια είναι απραίτητα τότε:


## Σχόλια (2)

* Με τη χρήση σχολίων, το πρόγραμμα εξηγεί στον προγραμματιστή γιατί έχει υλοποιηθεί με έναν συγκεκριμένο τρόπο
* Τα σχόλια θα πρέπει να συμφωνούν με τον κώδικα και να ανανεώνονται αναλόγως. Βάζουμε σχόλια όπου χρειάζεται, όχι απαραίτητα σε κάθε γραμμή του προγράμματός μας
* Στην αρχή του προγράμματός μας βάζουμε σε σχόλια: 1) τα στοιχεία μας, 2) την ημερομηνία, 3) τον τρόπο εκτέλεσης, 4) την έκδοση του προγράμματός μας
* Τα σχόλια στην Java δεν εμφωλεύονται


## Σχόλια (3)

| Είδη | Κανόνας | Συνήθης Χρήση | Παράδειγμα |
|------------------|:----------------------------------------------------------------------------------:|-------------------------------------------------|---------------------------------------------------------------------|
| Σχόλια  γραμμής | ξεκινούν με // | σε μεταβλητές,  σύντομες μέθοδοι (get/set) | //why use this variable |
| Σχόλια σε  block | ξεκινούν με /``*`` και  τελειώνουν με ``*``/ ενώ  στις ενδιάμεσες γραμμές  βάζουμε μόνο ``*``  | σε ροές ελέγχου,  μεθόδους | /``*`` Here is an ``*`` example of ``*`` how to use this. */ |


## Σχόλια (4)

| Είδη | Κανόνας | Συνήθης Χρήση | Παράδειγμα |
|------------------|:----------------------------------------------------------------------------------:|-------------------------------------------------|---------------------------------------------------------------------|
| Σχόλια  Javadoc | ξεκινούν με /``**`` και  τελειώνουν σε ``*``/ ενώ  στις ενδιάμεσες γραμμές  βάζουμε μόνο * | στην τεκμηρίωση κλάσεων, μεθόδων,  και διεπαφών | [http://www.oracle.com/ technetwork/articles/java /index-137868.html](http://www.oracle.com/technetwork/articles/java/index-137868.html) |


## Doc Comments

```java
/**
 * Returns an Image object that can then be painted on the screen.
 * The url argument must specify an absolute {@link URL}. The name
 * argument is a specifier that is relative to the url argument.
 *
 * @param  url  an absolute URL giving the base location of the image
 * @param  name the location of the image, relative to the url argument
 * @return      the image at the specified URL
 * @see         Image
 */

 public Image getImage(URL url, String name) {
        try {
            return getImage(new URL(url, name));
        } catch (MalformedURLException e) {
            return null;
        }
 }
```
[http://www.oracle.com/technetwork/articles/java/index-137868.html](http://www.oracle.com/technetwork/articles/java/index-137868.html)


# Κατανόηση Κώδικα (1)

```java
	public class Nesting {
		//main method
		public static void main(String[] args) {
			boolean nesting = true;
			int x = 10;
			if (x == 10) {
				int y = 20;
				System.out.println("x and y: " + x +y);
				x = y * 2;
			}
			int y = 100;
			System.out.println("x is: " + x);
			/*
			System.out.println(nesting);
			*/ //?
		}
	}
```


## Κενά (1)

* Ξεκινήστε μια κλάση από την αρχή της γραμμής
* Βάζουμε κενές γραμμές για να χωρίσουμε το πρόγραμμά μας σε λογικά μέρη, όχι παντού
* Βάζουμε ένα κενό πριν και μετά από τους τελεστές (<, >, <=, ==)
* Βάζουμε κενό πριν και μετά τα σύμβολα των πράξεων (+, -, \, *, %)
* Βάζουμε ένα κενό μετά τις συνθήκες των while, for, και if, δηλ. if(…) {
* Δε βάζουμε κενό πριν την παρένθεση μιας μεθόδου
* Αφήστε 1 κενή γραμμή πριν ξεκινήσετε μια νέα μέθοδο


## Κενά (2)

* Βαζουμε ένα κενό μετά από κάθε δήλωση στο for loop
* δηλ. for(int i=0;i<10;i++) -> for (int i = 0; i < 10; i++)
* Βάλτε τις αγκύλες στην ίδια σειρά με τη δήλωση των κλάσεων και των
μεθόδων
* Βάζουμε ένα κενό πριν την αγκύλη {
* Χρησιμοποιούμε 1 δήλωση ανά γραμμή, όχι count++; int x = 5; στην ίδια γραμμή
* Βάζουμε μια κενή γραμμή στο τέλος του κώδικα του κάθε αρχείου


## Εσοχές (Indentation)

* Αποφεύγουμε γραμμές με περισσότερους από 80 χαρακτήρες
* Χρησιμοποιούμε 4 spaces ή 1 tab σε κάθε νέο επίπεδο εμφώλευσης (nesting) του προγράμματός μας
* Χρησιμοποιούμε το στυλ K&R (Kernighan and Ritchie’s indentation style)


## Κατανόηση Κώδικα (2)

```java
	public class Queller {

		public static int getDispetal(int cobber, int whinnock) {
			int result = 0;
			if (cobber == whinnock) {
				result = cobber - whinnock;
				result++;
			} else {
				result = cobber * whinnock;
			}
			return result;
		}

		public static int getGoverness(int mesodesma, int natrium, int stewardry) {
			int res = 0;
			int haulabout = natrium + (1 - mesodesma);
			if ((haulabout * haulabout) == stewardry) {
				res = haulabout;
			} else {
				res = 4 * haulabout;
			}
			return res;
			}
	}
```


## Προσομοίωση ρίψης ζαριών

<div align="justify">
Γράψτε ένα πρόγραμμα που προσομοιώνει τη ρίψη ενός ζεύγους ζαριών. Εκτελέστε το πείραμα μέχρι και τα 2 ζάρια να φέρουν 1
και στο τέλος να επιστρέφει πόσες ρίψεις χρειάστηκαν.
<br>
Γράψτε ένα πρόγραμμα που να καλεί και να τρέχει το προηγούμενο πρόγραμμα <b>n<\b> φορές και να επιστρέφει το μέσο όρο των φορών
που χρειάστηκε να γίνουν οι ρίψεις των ζαριών ώστε να έχουν και τα δύο ζάρια 1.
</div>


## Εκτύπωση πίνακα διαγώνια

<div align="justify">
Υλοποιείστε ένα πίνακα που να έχει 10 θέσεις και να λαμβάνει 10 αριθμούς από το 1 μέχρι και το 10. Στην συνέχεια υλοποιείστε μια συνάρτηση η οποία θα μπορεί να μεταφέρει όλα τα στοιχεία από αριστερά προς τα δεξιά, δλδ το πρώτο στοιχείο να το μεταφέρει στην θέση του δεύτερου, το δεύτερο στην θέση του τρίτου κ.τ.λ.
Στο τέλος πρέπει να έχετε το ακόλουθο αποτέλεσμα:
</div>

<div align="center">
[10,1,2,3,4,5,6,7,8,9]<br>
[9,10,1,2,3,4,5,6,7,8]<br>
    . . . . . . .<br>
[2,3,4,5,6,7,8,9,10,1]<br>
[1,2,3,4,5,6,7,8,9,10]<br>
</div>


## Βιβλιογραφία

* Brian W. Kernighan and Rob Pike. 1999. The Practice of Programming. Addison-Wesley Longman Publishing Co., Inc., Boston, MA, USA.
* [http://introcs.cs.princeton.edu/java/11style/](http://introcs.cs.princeton.edu/java/11style/)
