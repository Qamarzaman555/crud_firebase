import 'package:crud_firebase/screens/doctor/doctor_view.dart/doctor_vu.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      CHITextField(
                        hintText: 'Enter patient name',
                        initialValue: user?.name,
                        onSaved: viewModel.onNameSaved,
                        validator: viewModel.nameValidator,
                      ),
                      const SizedBox(height: 8),
                      CHITextField(
                        hintText: 'Enter your age',
                        initialValue: user?.age.toString(),
                        onSaved: viewModel.onAgeSaved,
                        validator: viewModel.ageValidator,
                      ),
                      const SizedBox(height: 8),
                      CHITextField(
                        hintText: 'Enter your gender',
                        initialValue: user?.gender.toString(),
                        onSaved: viewModel.onGenderSaved,
                        validator: viewModel.genderValidator,
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {},
                        child: CHITextField(
                          hintText: 'Enter your doctor name',
                          initialValue: user?.doctorName.toString(),
                          onSaved: viewModel.onDoctorNameSaved,
                          validator: viewModel.doctorNameValidator,
                        ),
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
                        hintText: 'Enter your address',
                        initialValue: user?.address.toString(),
                        onSaved: viewModel.onAddressSaved,
                        validator: viewModel.addressValidator,
                      ),
                      const SizedBox(height: 8),
                      CHITextField(
                        hintText: 'Enter admit date',
                        initialValue: user?.admitDate.toString(),
                        onSaved: viewModel.onAdmitDateSaved,
                        validator: viewModel.admitDateValidator,
                      ),
                      const SizedBox(height: 8),
                      CHITextField(
                        hintText: 'Enter discharge date',
                        initialValue: user?.dischargeDate.toString(),
                        onSaved: viewModel.onDischargeDateSaved,
                        validator: viewModel.dischargeDateValidator,
                      ),
                      const SizedBox(height: 10),
                      Switch(
                        activeColor: Colors.orange,
                        activeTrackColor: Colors.orange.shade200,
                        value: viewModel.check!,
                        onChanged: viewModel.toggleSwitch,
                      ),
                      const SizedBox(height: 10),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     showModalBottomSheet<void>(
                      //       backgroundColor: Colors.orange.shade200,
                      //       context: context,
                      //       builder: (BuildContext context) {
                      //         return SizedBox(
                      //           height: 500,
                      //           child: Center(
                      //             child: Padding(
                      //               padding: const EdgeInsets.all(16.0),
                      //               child: Column(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 mainAxisSize: MainAxisSize.min,
                      //                 children: <Widget>[
                      //                   ElevatedButton(
                      //                       style: ElevatedButton.styleFrom(
                      //                         backgroundColor:
                      //                             Colors.grey.shade100,
                      //                         maximumSize: const Size(
                      //                             double.infinity, 48),
                      //                         minimumSize: const Size(
                      //                             double.infinity, 48),
                      //                         fixedSize: const Size(
                      //                             double.infinity, 48),
                      //                       ),
                      //                       onPressed: () {
                      //                         Navigator.push(
                      //                             context,
                      //                             MaterialPageRoute(
                      //                                 builder: (_) =>
                      //                                     const DoctorView()));
                      //                       },
                      //                       child: const Text(
                      //                           "See Doctor Details")),
                      //                   const SizedBox(height: 10),
                      //                   ElevatedButton(
                      //                     style: ElevatedButton.styleFrom(
                      //                       backgroundColor:
                      //                           Colors.grey.shade100,
                      //                       maximumSize:
                      //                           const Size(double.infinity, 48),
                      //                       minimumSize:
                      //                           const Size(double.infinity, 48),
                      //                       fixedSize:
                      //                           const Size(double.infinity, 48),
                      //                     ),
                      //                     onPressed: user == null
                      //                         ? viewModel.addUser
                      //                         : viewModel.updateUser,
                      //                     child: Text(
                      //                         user == null ? 'Save' : 'Update'),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //     );
                      //   },
                      //   child: const Text('View Doctor Details'),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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

  // dynamic get toggleSwitch => UserModel.check;

  @override
  UserFormViewModel viewModelBuilder(BuildContext context) {
    return UserFormViewModel(context, user);
  }
}
