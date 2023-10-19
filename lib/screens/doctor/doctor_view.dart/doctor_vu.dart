import 'package:crud_firebase/screens/doctor/doctor_form/doctor_form_vu.dart';
import 'package:crud_firebase/widgets/chi_appbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'doctor_vm.dart';

class DoctorView extends StackedView<DoctorViewModel> {
  const DoctorView({super.key});

  @override
  Widget builder(
      BuildContext context, DoctorViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: const CHIAppBar(title: 'Doctors'),
      body: StreamBuilder(
          stream: viewModel.doctorStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: viewModel.doctors.length,
                itemBuilder: (context, index) {
                  final doctor = viewModel.doctors[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: ListTile(
                        // titleTextStyle: TextStyle(
                        //     fontWeight: FontWeight.bold, color: Colors.black),
                        // subtitleTextStyle: TextStyle(
                        //     fontWeight: FontWeight.w500, color: Colors.black),
                        hoverColor: Colors.orange,
                        tileColor: Colors.orange.shade200,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DoctorFormView(doctor: doctor)));
                        },
                        title: Center(child: Text(doctor.doctorName!)),
                        subtitle: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Text(user.email!),
                            Text("Age:  ${doctor.age!}"),
                            Text("Phone Number:  ${doctor.phoneNumber!}"),
                            Text("Doctor Name:  ${doctor.email!}"),
                          ],
                        ),
                        // trailing: Text(user.id!),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: Text('Something went wrong'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const DoctorFormView())),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  DoctorViewModel viewModelBuilder(BuildContext context) {
    return DoctorViewModel();
  }
}
