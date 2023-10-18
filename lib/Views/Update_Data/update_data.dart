// ignore_for_file: unused_local_variable

import 'package:crud_firebase/Utils/Reusable_TextField.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'update_data_model.dart';

class UpdateData extends StackedView<UpdateDataModel> {
  const UpdateData({super.key, required this.userKey});

  final String userKey;

  @override
  Widget builder(
      BuildContext context, UpdateDataModel viewModel, Widget? child) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    void getUsersData() async {
      DataSnapshot snapshot = await dbRef.userKey.get();

      Map user = snapshot.value as Map;

      nameController.text = user['name'];
      emailController.text = user['mail'];
      phoneController.text = user['phone'];
    }

    late DatabaseReference dbRef;
    dbRef = FirebaseDatabase.instance.ref().child('Users');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Update Data'),
      ),
      body: Column(
        children: [
          CustomTextField(
            controller: nameController,
            hint: 'Enter you Name',
            borderColor: Colors.black,
            inputType: TextInputType.name,
            obscureText: false,
            prefixIcon: Icons.person,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            controller: emailController,
            hint: 'Enter you Email',
            borderColor: Colors.black,
            inputType: TextInputType.emailAddress,
            obscureText: false,
            prefixIcon: Icons.mail_lock,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            controller: phoneController,
            hint: 'Enter you Phone Number',
            borderColor: Colors.black,
            inputType: TextInputType.phone,
            obscureText: false,
            prefixIcon: Icons.phone,
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Map<String, String> users = {
                'name': nameController.text,
                'mail': emailController.text,
                'phone': phoneController.text,
              };
              dbRef
                  .child(widget.userKey)
                  .update(users)
                  .then((value) => {Navigator.pop(context)});
            },
            child: const Text('Add Data'),
          )
        ],
      ),
    );
  }

  @override
  UpdateDataModel viewModelBuilder(BuildContext context) {
    return UpdateDataModel();
  }
}
