import 'package:crud_firebase/widgets/chi_textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../model/user_model.dart';
import '../../../widgets/chi_appbar.dart';
import 'user_form_vm.dart';

class UserFormView extends StackedView<UserFormViewModel> {
  final UserModel? user;
  const UserFormView({super.key, this.user});

  @override
  Widget builder(
      BuildContext context, UserFormViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: CHIAppBar(title: user == null ? 'Add User' : 'Update User'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            children: [
              CHITextField(
                hintText: 'Enter your name',
                initialValue: user?.name,
                onSaved: viewModel.onNameSaved,
                validator: viewModel.nameValidator,
              ),
              const SizedBox(height: 8),
              CHITextField(
                hintText: 'Enter your email',
                initialValue: user?.email,
                onSaved: viewModel.onEmailSaved,
                validator: viewModel.emailValidator,
              ),
              const SizedBox(height: 8),
              CHITextField(
                hintText: 'Enter your phoneNumber',
                initialValue: user?.phoneNumber,
                onSaved: viewModel.onPhoneNumberSaved,
                validator: viewModel.phoneNumberValidator,
              ),
              const SizedBox(height: 8),
              CHITextField(
                hintText: 'Enter your age',
                initialValue: user?.age.toString(),
                onSaved: viewModel.onAgeSaved,
                validator: viewModel.ageValidator,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              maximumSize: const Size(double.infinity, 48),
              minimumSize: const Size(double.infinity, 48),
              fixedSize: const Size(double.infinity, 48),
            ),
            onPressed: user == null ? viewModel.addUser : viewModel.updateUser,
            child: Text(user == null ? 'Save' : 'Update')),
      ),
    );
  }

  @override
  UserFormViewModel viewModelBuilder(BuildContext context) {
    return UserFormViewModel(context, user);
  }
}
