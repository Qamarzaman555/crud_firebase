import 'package:crud_firebase/widgets/chi_appbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../doctors/doctor_View/doctor_vu.dart';
import '../user_form/user_form_vu.dart';
import 'user_vm.dart';

class UserView extends StackedView<UserViewModel> {
  const UserView({super.key});

  @override
  Widget builder(BuildContext context, UserViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: const CHIAppBar(title: 'Users'),
      // body: viewModel.isBusy
      //     ? const Center(child: CircularProgressIndicator())
      // : ListView.builder(
      //     itemCount: viewModel.users.length,
      //     itemBuilder: (context, index) {
      //       final user = viewModel.users[index];
      //       return ListTile(
      //         onTap: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (_) => UserFormView(user: user)));
      //         },
      //         title: Text(user.name!),
      //         subtitle: Column(
      //           children: [
      //             Text(user.email!),
      //             Text(user.phoneNumber!),
      //           ],
      //         ),
      //         trailing: Text("${user.age}"),
      //       );
      //     },
      //   ),
      body: StreamBuilder(
          stream: viewModel.userStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: viewModel.users.length,
                itemBuilder: (context, index) {
                  final user = viewModel.users[index];
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
                                  builder: (_) => UserFormView(user: user)));
                        },
                        title: Center(child: Text(user.name!)),
                        subtitle: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Text(user.email!),
                            Text("Age:  ${user.age}"),
                            Text("Gender:  ${user.gender!}"),
                            Text("Phone Number:  ${user.phoneNumber!}"),
                            Text("Doctor Name:  ${user.doctorName!}"),
                            Text("Address:  ${user.address!}"),
                            Text("Admit Date:  ${user.admitDate!}"),
                            Text("Discharge Date:  ${user.dischargeDate!}"),
                            Text("SwtichData:  ${user.check!}"),
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

      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            maximumSize: const Size(double.infinity, 48),
            minimumSize: const Size(double.infinity, 48),
            fixedSize: const Size(double.infinity, 48),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const DoctorView()));
          },
          child: const Text('See Doctors'),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const UserFormView())),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  UserViewModel viewModelBuilder(BuildContext context) {
    return UserViewModel();
  }
}
