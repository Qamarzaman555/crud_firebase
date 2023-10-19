class DoctorModel {
  String? id;
  String? doctorName;
  int? age;
  String? email;
  String? phoneNumber;

  DoctorModel({
    this.id,
    this.doctorName,
    this.age,
    this.email,
    this.phoneNumber,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json["id"],
      doctorName: json["doctorName"],
      age: json["age"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "doctorName": doctorName,
      "age": age,
      "email": email,
      "phoneNumber": phoneNumber,
    };
  }
}
