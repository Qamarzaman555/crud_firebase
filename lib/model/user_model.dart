class UserModel {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  int? age;
  String? address;
  String? gender;
  String? doctorName;
  String? admitDate;
  String? dischargeDate;
  bool? check;

  UserModel({
    this.id,
    this.name,
    this.age,
    this.gender,
    this.phoneNumber,
    this.doctorName,
    this.address,
    this.admitDate,
    this.dischargeDate,
    this.check,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      age: json["age"],
      phoneNumber: json["phoneNumber"],
      address: json["address"],
      gender: json["gender"],
      doctorName: json["doctorName"],
      admitDate: json["admitDate"],
      dischargeDate: json["dischargeDate"],
      check: json["check"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phoneNumber": phoneNumber,
      "age": age,
      "address": address,
      "gender": gender,
      "doctorName": doctorName,
      "admitDate": admitDate,
      "dischargeDate": dischargeDate,
      "check": check,
    };
  }
}
