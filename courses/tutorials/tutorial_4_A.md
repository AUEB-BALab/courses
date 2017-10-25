<img src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Προγραμματισμός ΙΙ
## Τύποι Πεδίων και Μεθόδων

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)
* [Θεόδωρος Στασινόπουλος](https://www.balab.aueb.gr/theodore-stassinopoulos.html)


```java
public class Car {
	// κατάσταση αυτοκινήτου
	public Color color; // χρώμα
	private String licenseNumber; // αριθμός κυκλοφορίας
	public int cc; // κυβισμός κινητήρα
	private double speed; // ταχύτητα
	public static int numberOfCars = 0; // αριθμός αυτοκινήτων

	// κατασκευαστής χωρίς ορίσματα
	public Car() {
		numberOfCars++;
	}

	// κατασκευαστής με ορίσματα
	public Car(Color color, String licenseNumber, int cc) {
		this();
		this.color = color;
		this.licenseNumber = licenseNumber;
		this.cc = cc;
	}

	// συμπεριφορά αυτοκινήτου
	public void startEngine() {...} // εκκίνηση του κινητήρα
	public void stopEngine() {...} // σβήσιμο του κινητήρα
	public void turnLeft(int degrees) {...} // στροφή αριστερά
	public void turnRight(int degrees) {...} // στροφή δεξιά
	public void break() {...} // φρενάρισμα
	public double getSpeed() {return speed;} // μέτρηση ταχύτητας
	// στατική μέθοδος
	public static int getNumberOfCars() {return numberOfCars;}
}
```


## Τύπου Πεδίων και Μεθόδων (1)

* **Στιγμιοτύπου**:
	* Κάθε στιγμιότυπο έχει το δικό του 'αντίγραφο' **μεταβλητών**.
	* Οι **μέθοδοι** μπορούν να εκτελεστούν ΜΟΝΟ σε ένα στιγμιότυπο μιας κλάσης (ένα αντικείμενο).
	* Για να προσπελαστούν οι **μεταβλητές** στιγμιοτύπου και να κληθούν οι **μέθοδοι** του στιγμιοτύπου πρέπει να έχει φτιαχτεί πρώτα ένα αντικείμενο!


## Τύπου Πεδίων και Μεθόδων (2)

* **static**:
	* Οι **μεταβλητές** είναι μοιρασμένες ανάμεσα σε ΟΛΑ τα στιγμιότυπα μιας κλάσης, δηλαδή υπάρχει μόνο ένα 'αντίγραφό' τους.
	* Οι **μέθοδοι** μπορούν να χρησιμοποιηθούν χωρις να δημιουργηθεί ένα στιγμιότυπο της κλάσης και έχουν πρόσβαση ΜΟΝΟ σε στατικές μεταβλητές της κλάσης.


## this

* Με τη λέξη-κλειδί **this** ένα αντικείμενο (το στιγμιότυπο μιας κλάσης) μπορεί να αναφερθεί στον ίδιο του τον εαυτό
	* Δηλαδή το **this** όταν χρησιμοποιείται σε μια μέθοδο υπόστασης είναι μια αναφορά (ένας δείκτης) στο ίδιο το αντικείμενο
	* Το **this** μπορεί να χρησιμοποιηθεί και κατά την κατασκευή ενός αντικειμένου (μέσα στις μεθόδους – constructors)
	* Χρησιμοποιείται για την αντιμετώπιση της ασάφειας όταν μια μέθοδος έχει παραμέτρους που έχουν ίδιο όνομα με κάποια μεταβλητή υπόστασης του αντικειμένου

* Οι στατικές (**static**) μέθοδοι δε μπορούν να χρησιμοποιήσουν το **this**, αφού δεν αναφέρονται σε ένα συγκεκριμένο αντικείμενο


## Παράδειγμα 1

```java
public class Time {

	private static final int HOURS_PER_DAY = 24;
	private static final int MINUTES_PER_HOUR = 60;
	private static final int SECONDS_PER_MINUTE = 60;

	private int hour;
	private int minute;
	private int second;

	public Time() {
	}

	public Time(int hour, int minute, int second) {
		this.hour = hour;
		this.minute = minute;
		this.second = second;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int h) {
		hour = ((h >= 0 && h < HOURS_PER_DAY) ? h : 0);
	}
```


## Παράδειγμα 1 (Συνέχεια)

```java
	public int getMinute() {
		return minute;
	}

	public void setMinute(int m) {
		minute = ((m >= 0 && m < MINUTES_PER_HOUR) ? m : 0);
	}

	public int getSecond() {
		return second;
	}

	public void setSecond(int s) {
		second = ((s >= 0 && s < SECONDS_PER_MINUTEd) ? s : 0);
	}

	public void setTime(int h, int m, int s) {
		setHour(h);
		setMinute(m);
		setSecond(s);
	}
}
```


## Παράδειγμα 1 (Συνέχεια)

```java
public class TimeTest {
	public static void main(String args[]) {
		Time t1 = new Time();
		Time t2 = new Time(12, 25, 42);
		t2.setTime(3, 4, 8);
		t1.setTime(0, 3, 15);
		System.out.println(t2.getHour() + " " + t2.getMinute() + " " + t2.getSecond());
		System.out.println(t1.getHour() + " " + t1.getMinute() + " " + t1.getSecond());
	}
}
```


## Παράδειγμα 2

```java
import java.util.Date;

public class Employee {
	private String firstName;
	private String lastName;
	private Date birthDate;
	private Date hireDate;

	public Employee(String fN, String lN, Date dateOfBirth, Date dateOfHire) {
		firstName = fN;
		lastName = lN;
		birthDate = dateOfBirth;
		hireDate = dateOfHire;
	}

	public String toString() {
		return "Name of employee: " + firstName + ", "
		+ "Surname of employee: " + lastName + ", " + "Date of birth: "
		+ birthDate + ", " + "Date of hire: " + hireDate + ". ";

	}
}
```


## Παράδειγμα 2 (Συνέχεια)

```java
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class EmployeeTest {
	public static void main(String args[]) {
		try {
			Date birth = new SimpleDateFormat("MM/dd/yy").parse("05/12/95");
			Date hire = new SimpleDateFormat("MM/dd/yy").parse("10/9/05");
			Employee employee = new Employee("Tim", "Yellow", birth, hire);
			System.out.println(employee.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
```


## Παράδειγμα 2 (Συνέχεια)

```java
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class EmployeeTest {
	public static void main(String args[]) {
		try {
			Date birth = new SimpleDateFormat("MM/dd/yy").parse("05/12/95");
			Date hire = new SimpleDateFormat("MM/dd/yy").parse("10/9/05");
			Employee employee = new Employee("Tim", "Yellow", birth, hire);
			System.out.println(employee.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
```


##  Singleton

* Ένα singleton είναι μια κλάση η οποία αρχικοποιείται μια μόνο φορά.
* Το σχεδιαστικό πρότυπο (design pattern) singleton επιτρέπει τον ελεγχόμενο ορισμό ενός μοναδικού αντικειμένου μιας κλάσης.
* Τα singletons μπορεί να αναφέρονται σε κάποιο τμήμα ενός συστήματος που είναι μοναδικό, π.χ. ένα σύστημα αρχείων.


## Παράδειγμα 3

```java
public class FileSystem {
	private static final FileSystem INSTANCE = new FileSystem();

	private FileSystem() {
	// empty
	}

	public static FileSystem getInstance() {
		return INSTANCE;
	}
}
```


## Βιβλιογραφία

* Harvey M. Deitel και Paul J. Deitel. Java Προγραμματισμός, 6η έκδοση. Εκδόσεις Μ. Γκιούρδας, Αθήνα 2005. Κεφάλαια 5,8.
* Joshua Bloch. Effective Java, pages 10–12. Addison-Wesley, Reading, MA, 2001.
