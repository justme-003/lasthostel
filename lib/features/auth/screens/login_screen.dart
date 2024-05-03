import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management/api_services/api_calls.dart';
import 'package:hostel_management/common/spacing.dart';
import 'package:hostel_management/features/auth/screens/register_screen.dart';
import 'package:hostel_management/features/auth/widgets/custom_button.dart';
import 'package:hostel_management/features/auth/widgets/custom_text_field.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(child: LoginBody()),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  static final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  ApiCall apiCall = ApiCall();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/logo.jpg',
                  height: 250.h,
                ),
              ),
              heightSpacer(30.h),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Есептік жазбаңызға кіріңіз',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              heightSpacer(25.h),
              Text('Email', style: AppTextTheme.kLabelStyle),
              CustomTextField(
                controller: email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Электрондық пошта қажет';
                  }
                  // else if (!emailRegex.hasMatch(value)) {
                  //   return 'Invalid email address';
                  // }
                  return null;
                },
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
                    borderRadius: BorderRadius.circular(14)),
                inputHint: "Email",
              ),
              heightSpacer(30),
              Text('Құпиясөз', style: AppTextTheme.kLabelStyle),
              CustomTextField(
                controller: password,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Құпиясөзді енгізіңіз';
                  }
                  return null;
                },
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
                    borderRadius: BorderRadius.circular(14)),
                inputHint: "Пароль",
              ),
              heightSpacer(30),
              CustomButton(
                buttonText: "Кіру",
                color: Colors.blue,
                press: () async {
                  if (_formKey.currentState!.validate()) {
                    await apiCall.handleLogin(
                        context, email.text, password.text);
                    print('validated');
                  }
                },
              ),
              heightSpacer(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Есептік жазбаңыз жоқ па?",
                    style: AppTextTheme.kLabelStyle.copyWith(
                      color: AppColors.kGreyDk,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      " Тіркелу",
                      style: AppTextTheme.kLabelStyle.copyWith(
                        color: Color.fromARGB(255, 10, 84, 187),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> saveTokenToSharedPreferences(String token) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('token', token);
  // }

  final emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,})$');
}
