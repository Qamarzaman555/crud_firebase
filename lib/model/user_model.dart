class UserModel {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  int? age;

  UserModel({this.id, this.name, this.email, this.phoneNumber, this.age});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      age: json["age"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "age": age,
    };
  }
}
