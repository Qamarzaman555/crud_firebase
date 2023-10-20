import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

import '../../../../model/user_model.dart';

class DoctorViewModel extends BaseViewModel {
  // final _client = FBClient();
  List<UserModel> doctors = [];

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

  Stream doctorStream() {
    final stream = FirebaseFirestore.instance.collection('doctors').snapshots();
    stream.listen((data) {
      doctors.clear();
      for (final doc in data.docs) {
        final obj = doc.data();
        obj['id'] = doc.id;
        doctors.add(UserModel.fromJson(obj));
      }
    });
    return stream;
  }
}
