class Person {
  final String uid;
  final String email;
  final String password;
  final String name;
  final int age;
  final String pin;
  final int readingTime;
  final List restrictions;
  final String proficiency;
  final List favorites;

  Person({
    this.uid,
    this.email,
    this.password,
    this.name,
    this.pin,
    this.age,
    this.readingTime,
    this.proficiency,
    this.restrictions,
    this.favorites,
  });
}
