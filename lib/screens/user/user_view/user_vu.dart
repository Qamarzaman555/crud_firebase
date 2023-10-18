import 'package:crud_firebase/widgets/chi_appbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => UserFormView(user: user)));
                    },
                    title: Text(user.name!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.email!),
                        Text(user.phoneNumber!),
                      ],
                    ),
                    trailing: Text("${user.age}"),
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
