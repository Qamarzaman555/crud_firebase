import 'package:crud_firebase/screens/doctor/doctor_form/doctor_form_vm.dart';
import 'package:crud_firebase/widgets/chi_textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../model/doctor_model.dart';
import '../../../widgets/chi_appbar.dart';

class DoctorFormView extends StackedView<DoctorFormViewModel> {
  final DoctorModel? doctor;

  const DoctorFormView({super.key, this.doctor});

  @override
  Widget builder(
      BuildContext context, DoctorFormViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: CHIAppBar(title: doctor == null ? 'Add Doctor' : 'Update'),
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
                      const SizedBox(height: 10),
                      CHITextField(
                        hintText: 'Enter patient name',
                        initialValue: doctor?.doctorName,
                        onSaved: viewModel.onDoctorNameSaved,
                        validator: viewModel.doctorNameValidator,
                      ),
                      const SizedBox(height: 8),
                      CHITextField(
                        hintText: 'Enter your age',
                        initialValue: doctor?.age.toString(),
                        onSaved: viewModel.onAgeSaved,
                        validator: viewModel.ageValidator,
                      ),
                      const SizedBox(height: 8),
                      CHITextField(
                        hintText: 'Enter your phoneNumber',
                        initialValue: doctor?.phoneNumber,
                        onSaved: viewModel.onPhoneNumberSaved,
                        validator: viewModel.phoneNumberValidator,
                      ),
                      const SizedBox(height: 8),
                      CHITextField(
                        hintText: 'Enter your Email',
                        initialValue: doctor?.email,
                        onSaved: viewModel.onEmailSaved,
                        validator: viewModel.emailValidator,
                      ),
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
            onPressed:
                doctor == null ? viewModel.addDoctor : viewModel.updateDoctor,
            child: Text(doctor == null ? 'Save' : 'Update')),
      ),
    );
  }

  @override
  DoctorFormViewModel viewModelBuilder(BuildContext context) {
    return DoctorFormViewModel(context, doctor);
  }
}
