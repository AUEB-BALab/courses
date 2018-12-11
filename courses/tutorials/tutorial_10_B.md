<img src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Προγραμματισμός ΙΙ
# Ροές Δεδομένων

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)
* [Κωνσταντίνος Κραββαρίτης](https://www.balab.aueb.gr/konstantinos-kravvaritis.html)


## Ροές

* Οι ροές αναπαριστούν μία ακολουθία στοιχείων και υποστηρίζουν διάφορους τύπους λειτουργιών για την επεξεργασία των στοιχείων.
* Δεν έχουν σχέση και δεν πρέπει να συγχέονται με τα I/O Streams (InputStream, OutputStream, etc).
* Οι ροές δεν αποθηκεύουν δεδομένα, οπότε δεν είναι μία δομή δεδομένων. Επίσης, δεν τροποποιούν την υποκείμενη πηγή δεδομένων.
* Υποστηρίζονται από την Java 8 και μετά.


## Δημιουργία Ροών

```java
private static CoolGuys[] array = {
    new CoolGuy(1, "Diomidis Spinellis", "dds"), 
    new CoolGuy(2, "Stefanos Georgiou", "stefanos1316"), 
    new CoolGuy(3, "Konstantinos Kravvaritis", "kravvaritisk")
};

Stream.of(array);

private static List<CoolGuy> list = Arrays.asList(array);
list.stream();
```


## Ενδιάμεσες Λειτουργίες Ροών

* __filter__

```java
List<String> myList =
    Arrays.asList("a1", "a2", "b1", "c2", "c1");

myList
    .stream()
    .filter(s -> s.startsWith("c"))
    .forEach(System.out::println);

myList
    .stream()
    .filter(s -> startsWithC().test(s))
    .forEach(System.out::println);

public static Predicate<String> startsWithC() {
        return s -> s.startsWith("c");
    }
```


## Ενδιάμεσες Λειτουργίες Ροών (2)

* __map__

```java
Arrays.stream(new int[] {1, 2, 3})
    .map(n -> 2 * n + 1)
    .forEach(System.out::println);
```


## Ενδιάμεσες Λειτουργίες Ροών (3)

* __peek__

```java
Stream.of("Department", "of", "Science", "and", "Technology")
            .peek(s -> System.out.println(s))
            .map(s -> s.toUpperCase())
            .forEach(System.out::println);
```


## Τερματικές Λειτουργίες Ροών

* __findAny__

```java
Optional<String> val = Stream.of("one", "two").findAny();

if (val.isPresent() == true)
            System.out.println("There is some values");
```


## Τερματικές Λειτουργίες Ροών (2)

* __collect__

```java
Set<String> stringSet = Stream.of("some", "one", "some", "one")
            .collect(Collectors.toSet());
```


## Τερματικές Λειτουργίες Ροών (3)

* __collect__

```java
IntBinaryOperator binaryOpt = (s1,s2)-> (s1+s2); 
        
int sum = IntStream.of(1, 2, 3, 4).reduce(0, binaryOpt);
System.out.println(sum);
```


## Επαναχρησιμοποίηση Ροών

* Οι ροές δεν είναι επαναχρησιμοποιήσιμες.
* Αν καλέσουμε σε μία ροή κάποια τερματική λειτουργία, η ροή θα κλείσει και δεν μπορούμε να την χρησιμοποιήσουμε πάλι.

```java
Stream<String> stream =
    Stream.of("d2", "a2", "b1", "b3", "c")
        .filter(s -> s.startsWith("a"));

stream.findFirst();    // ok
stream.findAny();   // exception
```

