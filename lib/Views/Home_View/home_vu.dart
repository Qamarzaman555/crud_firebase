import 'package:crud_firebase/Views/Fetch_Data/fetch_data.dart';
import 'package:crud_firebase/Views/Home_View/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../Add_Data/add_data.dart';

class HomeVeiw extends StackedView<HomeViewModel> {
  const HomeVeiw({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CRUD'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddData(),
                    ),
                  );
                },
                child: const Text('Insert Data'),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FetchData(),
                    ),
                  );
                },
                child: const Text('Fetch Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) {
    return HomeViewModel();
  }
}
