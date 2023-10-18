import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_data_model.dart';
import '../../Utils/Reusable_TextField.dart';

class AddData extends StackedView<AddViewModel> {
  const AddData({super.key});

  @override
  Widget builder(BuildContext context, AddViewModel viewModel, Widget? child) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    late DatabaseReference dbRef;
    dbRef = FirebaseDatabase.instance.ref().child('Users');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Adding Data'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 200, 50, 50),
          child: Column(
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
                  dbRef.push().set(users);
                },
                child: const Text('Add Data'),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  AddViewModel viewModelBuilder(BuildContext context) {
    return AddViewModel();
  }
}
