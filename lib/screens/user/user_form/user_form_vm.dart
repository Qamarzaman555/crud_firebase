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
  String? email;
  String? phoneNumber;
  int? age;

  UserFormViewModel(this.context, this.user);

  void onNameSaved(String? value) {
    name = value;
    user?.name = name;
  }

  void onEmailSaved(String? value) {
    email = value;
    user?.email = email;
  }

  void onPhoneNumberSaved(String? value) {
    phoneNumber = value;
    user?.phoneNumber = phoneNumber;
  }

  void onAgeSaved(String? value) {
    age = int.parse(value!);
    user?.age = age;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    return null;
  }

  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    return null;
  }

  String? ageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Age is required';
    }
    return null;
  }

  Future<void> addUser() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      user = UserModel(
          name: name, email: email, age: age, phoneNumber: phoneNumber);
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
