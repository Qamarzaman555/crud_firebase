import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

import '../../../model/doctor_model.dart';

class DoctorViewModel extends BaseViewModel {
  List<DoctorModel> doctors = [];

  Stream doctorStream() {
    final stream = FirebaseFirestore.instance.collection('doctors').snapshots();
    stream.listen((data) {
      doctors.clear();
      for (final doc in data.docs) {
        final obj1 = doc.data();
        obj1['id'] = doc.id;
        doctors.add(DoctorModel.fromJson(obj1));
      }
    });
    return stream;
  }
}
