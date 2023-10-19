// ignore_for_file: use_build_context_synchronously

import 'package:crud_firebase/model/doctor_model.dart';
import 'package:crud_firebase/services/fb_client.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DoctorFormViewModel extends BaseViewModel {
  final _client = FBClient();
  final formKey = GlobalKey<FormState>();
  DoctorModel? doctor;
  BuildContext context;
  String? doctorName;
  int? age;
  String? phoneNumber;
  String? email;

  DoctorFormViewModel(this.context, this.doctor);

  void onDoctorNameSaved(String? value) {
    doctorName = value;
    doctor?.doctorName = doctorName;
  }

  void onAgeSaved(String? value) {
    age = int.parse(value!);
    doctor?.age = age;
  }

  void onPhoneNumberSaved(String? value) {
    phoneNumber = value;
    doctor?.phoneNumber = phoneNumber;
  }

  void onEmailSaved(String? value) {
    email = value;
    doctor?.email = email;
  }

  String? doctorNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Doctor name is required';
    }
    return null;
  }

  String? ageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Age is required';
    }
    return null;
  }

  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    return null;
  }

  Future<void> addDoctor() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      doctor = DoctorModel(
        doctorName: doctorName,
        age: age,
        phoneNumber: phoneNumber,
        email: email,
      );
      final resp =
          await _client.post(endpoint: 'doctors', data: doctor!.toJson());
      if (resp['status'] == 'Ok') {
        Navigator.pop(context);
      } else {
        print(resp['message']);
      }
    }
  }

  Future<void> updateDoctor() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      final resp = await _client.update(
          endpoint: 'doctors/${doctor?.id}', data: doctor!.toJson());
      if (resp['status'] == 'Ok') {
        Navigator.pop(context);
      } else {
        print(resp['message']);
      }
    }
  }
}
