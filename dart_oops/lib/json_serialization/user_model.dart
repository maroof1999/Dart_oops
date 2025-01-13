class UserModel {
  late String id;
  late String fullName;
  late String email; 
  //Default constructor
  UserModel({required this.id, required this.fullName, required this.email});
  //Named constructor
  //Map to Object
  UserModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.fullName = map['fullName'];
    this.email = map['email'];
  }
  //Named constructor
  //Object to Map
  Map<String, dynamic> toMap() {
    return {'id': this.id, 'fullName': this.fullName, 'email': this.email};
  }
}
