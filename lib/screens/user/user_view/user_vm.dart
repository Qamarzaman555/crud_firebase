import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

import '../../../model/user_model.dart';

class UserViewModel extends BaseViewModel {
  // final _client = FBClient();
  List<UserModel> users = [];

  // UserViewModel() {
  //   _getUsers();
  // }

  // Future<void> _getUsers() async {
  //   setBusy(true);
  //   final resp = await _client.get(endpoint: 'users');
  //   if (resp["status"] == 'Ok') {
  //     for (final data in resp["data"]) {
  //       users.add(UserModel.fromJson(data));
  //     }
  //   } else {
  //     print(resp['message']);
  //   }
  //   setBusy(false);
  // }

  Stream userStream() {
    final stream = FirebaseFirestore.instance.collection('users').snapshots();
    stream.listen((data) {
      users.clear();
      for (final doc in data.docs) {
        final obj = doc.data();
        obj['id'] = doc.id;
        users.add(UserModel.fromJson(obj));
      }
    });
    return stream;
  }
}
