// ignore_for_file: use_build_context_synchronously

import 'package:crud_firebase/model/user_model.dart';
import 'package:crud_firebase/services/fb_client.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UserFormViewModel extends BaseViewModel {
  final _client = FBClient();
  final formKey = GlobalKey<FormState>();
  UserModel? user;
  BuildContext context;
  String? name;
  int? age;
  String? gender;
  String? phoneNumber;
  String? doctorName;
  String? address;
  String? admitDate;
  String? dischargeDate;
  bool? check = false;

  // bool switchValue = true;

  UserFormViewModel(this.context, this.user);

  void toggleSwitch(bool? value) {
    check = value!;
    user?.check = check;
    // check = switchValue;
    notifyListeners();
  }

  void onNameSaved(String? value) {
    name = value;
    user?.name = name;
  }

  // void onEmailSaved(String? value) {
  //   email = value;
  //   user?.email = email;
  // }
  void onAgeSaved(String? value) {
    age = int.parse(value!);
    user?.age = age;
  }

  void onGenderSaved(String? value) {
    gender = value;
    user?.gender = gender;
  }

  void onPhoneNumberSaved(String? value) {
    phoneNumber = value;
    user?.phoneNumber = phoneNumber;
  }

  void onDoctorNameSaved(String? value) {
    doctorName = value;
    user?.doctorName = doctorName;
  }

  void onAddressSaved(String? value) {
    address = value;
    user?.address = address;
  }

  void onAdmitDateSaved(String? value) {
    admitDate = value;
    user?.admitDate = admitDate;
  }

  void onDischargeDateSaved(String? value) {
    dischargeDate = value;
    user?.dischargeDate = dischargeDate;
  }

  void onCheck(bool? value) {
    check = value;
    user?.check = check;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? ageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Age is required';
    }
    return null;
  }

  String? genderValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Gender is required';
    }
    return null;
  }

  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    return null;
  }

  String? doctorNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Doctor Name is required';
    }
    return null;
  }

  String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required';
    }
    return null;
  }

  String? admitDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Admit Date is required';
    }
    return null;
  }

  String? dischargeDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Discharge Date is required';
    }
    return null;
  }

  // bool? checkValidator(bool? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Check is required';
  //   }
  //   return null;
  // }

  // String? emailValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Email is required';
  //   }
  //   return null;
  // }

  Future<void> addUser() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      user = UserModel(
        name: name,
        age: age,
        phoneNumber: phoneNumber,
        gender: gender,
        doctorName: doctorName,
        address: address,
        admitDate: admitDate,
        dischargeDate: dischargeDate,
        check: check,
      );
      final resp = await _client.post(endpoint: 'users', data: user!.toJson());
      if (resp['status'] == 'Ok') {
        Navigator.pop(context);
      } else {
        print(resp['message']);
      }
    }
  }

  Future<void> updateUser() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      final resp = await _client.update(
          endpoint: 'users/${user?.id}', data: user!.toJson());
      if (resp['status'] == 'Ok') {
        Navigator.pop(context);
      } else {
        print(resp['message']);
      }
    }
  }
}
