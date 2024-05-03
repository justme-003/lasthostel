import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management/api_services/api_calls.dart';
import 'package:hostel_management/api_services/api_utils.dart';
import 'package:hostel_management/common/app_bar.dart';
import 'package:hostel_management/common/spacing.dart';
import 'package:hostel_management/features/auth/widgets/custom_button.dart';
import 'package:hostel_management/features/auth/widgets/custom_text_field.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';

class CreateStaff extends StatefulWidget {
  const CreateStaff({super.key});

  @override
  State<CreateStaff> createState() => _CreateStaffState();
}

class _CreateStaffState extends State<CreateStaff> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController jobRole = TextEditingController();
  ApiCall apiCall = ApiCall();
  @override
  void dispose() {
    userName.dispose();
    email.dispose();
    firstName.dispose();
    lastName.dispose();
    jobRole.dispose();
    phoneNumber.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(context, "Жаңа қызметкер қосу"),
      backgroundColor: AppColors.kBackgroundColor,
      body: ApiUrls.roleId == 2 || ApiUrls.roleId == 3
          ? const Center(
              child: Text("Бұл бетті көруге рұқсатыңыз жоқ"),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Пайдаланушы аты', style: AppTextTheme.kLabelStyle),
                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Пайдаланушы аты қажет';
                          }
                          return null;
                        },
                        controller: userName,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFD1D8FF)),
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      heightSpacer(15),
                      Text('Аты-Жөні', style: AppTextTheme.kLabelStyle),
                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Аты қажет';
                          }
                          return null;
                        },
                        controller: firstName,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFD1D8FF)),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      heightSpacer(15),
                      Text('Тегі', style: AppTextTheme.kLabelStyle),
                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Тегі қажет';
                          }
                          return null;
                        },
                        controller: lastName,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFD1D8FF)),
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      heightSpacer(15),
                      Text('Лауазымдық рөлі', style: AppTextTheme.kLabelStyle),
                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Лауазымдық рөл қажет';
                          }
                          return null;
                        },
                        controller: jobRole,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFD1D8FF)),
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      heightSpacer(15),
                      Text('Email', style: AppTextTheme.kLabelStyle),
                      CustomTextField(
                        controller: email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Электрондық пошта қажет';
                          } else if (!emailRegex.hasMatch(value)) {
                            return 'Электрондық пошта мекенжайы жарамсыз';
                          }
                          return null;
                        },
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFD1D8FF)),
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      heightSpacer(15),
                      Text('Құпиясөз', style: AppTextTheme.kLabelStyle),
                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Құпиясөз қажет';
                          }
                          return null;
                        },
                        controller: password,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFD1D8FF)),
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      heightSpacer(15),
                      Text('Телефон нөмірі', style: AppTextTheme.kLabelStyle),
                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Телефон нөмірі қажет';
                          }
                          return null;
                        },
                        controller: phoneNumber,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFD1D8FF)),
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      heightSpacer(40),
                      CustomButton(
                        buttonText: "Қосу",
                        color: Colors.blue,
                        press: () async {
                          if (_formKey.currentState!.validate()) {
                            print('validated');
                            await apiCall.createStaff(
                              userName.text,
                              firstName.text,
                              lastName.text,
                              password.text,
                              email.text,
                              phoneNumber.text,
                              jobRole.text,
                              context,
                            );
                          }
                        },
                      ),
                      heightSpacer(20),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  final emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,})$');
}
