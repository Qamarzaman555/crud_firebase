import 'package:crud_firebase/widgets/chi_textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../model/user_model.dart';
import '../../../widgets/chi_appbar.dart';
import '../../screens/user/user_form/user_form_vm.dart';

class DoctorViewForm extends StackedView<UserFormViewModel> {
  final UserModel? user;

  const DoctorViewForm({super.key, this.user});

  @override
  Widget builder(
      BuildContext context, UserFormViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: CHIAppBar(title: user == null ? 'Add Doctor' : 'Update Doctor'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    CHITextField(
                      hintText: 'Enter doctor name',
                      initialValue: user?.doctorName,
                      onSaved: viewModel.onDoctorNameSaved,
                      validator: viewModel.doctorNameValidator,
                    ),
                    const SizedBox(height: 8),
                    CHITextField(
                      hintText: 'Enter doctor age',
                      initialValue: user?.age.toString(),
                      onSaved: viewModel.onAgeSaved,
                      validator: viewModel.ageValidator,
                    ),
                    const SizedBox(height: 10),
                    CHITextField(
                      hintText: 'Enter your phoneNumber',
                      initialValue: user?.phoneNumber,
                      onSaved: viewModel.onPhoneNumberSaved,
                      validator: viewModel.phoneNumberValidator,
                    ),
                    const SizedBox(height: 8),
                    CHITextField(
                      hintText: 'Enter your address',
                      initialValue: user?.address.toString(),
                      onSaved: viewModel.onAddressSaved,
                      validator: viewModel.addressValidator,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          maximumSize: const Size(double.infinity, 48),
                          minimumSize: const Size(double.infinity, 48),
                          fixedSize: const Size(double.infinity, 48),
                        ),
                        onPressed: user == null
                            ? viewModel.addDoctor
                            : viewModel.updateDoctor,
                        child: Text(user == null ? 'Save' : 'Update')),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomSheet: Padding(
      //   padding: const EdgeInsets.all(16),
      //   child:
      // ),
    );
  }

  @override
  UserFormViewModel viewModelBuilder(BuildContext context) {
    return UserFormViewModel(context, user);
  }
}
