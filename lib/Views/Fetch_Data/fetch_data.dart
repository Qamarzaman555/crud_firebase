// ignore_for_file: must_be_immutable, avoid_web_libraries_in_flutter

// import 'dart:js';

import 'package:crud_firebase/Views/Update_Data/update_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'fetch_data_model.dart';

class FetchData extends StackedView<FetchDataModel> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Users');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child("Users");

  FetchData({super.key});
  Widget listItem(BuildContext context, {required Map user}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 140,
      color: Colors.amberAccent,
      child: Column(
        children: [
          Text(
            user['name'],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 5),
          Text(
            user['mail'],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 5),
          Text(
            user['phone'],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateData(
                                userKey: user['Key'],
                              )));
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  reference.child(user['key']).remove();
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget builder(
      BuildContext context, FetchDataModel viewModel, Widget? child) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Fetching Data'),
        ),
        body: SizedBox(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map user = snapshot.value as Map;
              user['key'] = snapshot.key;

              return listItem(context, user: user);
            },
          ),
        ));
  }

  @override
  FetchDataModel viewModelBuilder(BuildContext context) {
    return FetchDataModel();
  }
}
