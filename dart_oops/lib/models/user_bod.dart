class UserDateOfBirth {
  final DateTime date;
  final int age;
  UserDateOfBirth({
    required this.date,
    required this.age,
  });
  factory UserDateOfBirth.fromJson(Map<String, dynamic> json) {
    return UserDateOfBirth(
      date: DateTime.parse(json['date']),
      age: json['age'],
    );
  }
}
