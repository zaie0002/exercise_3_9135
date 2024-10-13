import 'package:exercise_3/exercise_3.dart' as exercise_3;
import 'dart:convert';

class Students {
  List<Map<String, String>> people;

  Students(this.people);

  void sort(String field) {
    people.sort((a, b) => a[field]!.compareTo(b[field]!));
  }

  void output() {
    for (var person in people) {
      print(person);
    }
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }

  void remove(String fieldValue) {
    people.removeWhere((person) => person.containsValue(fieldValue));
  }
}

void main() {
  String json = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  List<dynamic> decodedJson = jsonDecode(json);

  List<Map<String, String>> people = decodedJson
      .map<Map<String, String>>(
          (item) => Map<String, String>.from(item as Map))
      .toList();

  Students students = Students(people);

  students.sort('last');
  print('Sorted by last name:');
  students.output();

  students.plus({
    "first": "New",
    "last": "Person",
    "email": "newperson@example.com"
  });
  print('\nAfter adding a new person:');
  students.output();

  students.remove('griffis@algonquincollege.com');
  print('\nAfter removing by email:');
  students.output();
}