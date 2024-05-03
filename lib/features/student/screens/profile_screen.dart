import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_management/api_services/api_calls.dart';
import 'package:hostel_management/api_services/api_utils.dart';
import 'package:hostel_management/common/constants.dart';
import 'package:hostel_management/common/spacing.dart';
import 'package:hostel_management/features/auth/screens/login_screen.dart';
import 'package:hostel_management/features/auth/widgets/custom_button.dart';
import 'package:hostel_management/features/auth/widgets/custom_text_field.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController roomNumber = TextEditingController();
  TextEditingController block = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  ApiCall apiCall = ApiCall();
  @override
  void dispose() {
    super.dispose();
    roomNumber.dispose();
    phoneNumber.dispose();
    block.dispose();
    emailId.dispose();
    username.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kGreenColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Профиль",
          style: AppTextTheme.kLabelStyle.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ApiUrls.roleId == 1
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        AppConstants.profile,
                        height: 180.h,
                        width: 180.w,
                      ),
                    ),
                    heightSpacer(20),
                    const Text(
                      'Сіз админсіз',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppConstants.profile,
                      height: 180.h,
                      width: 180.w,
                    ),
                    heightSpacer(10),
                    Text(
                      'Аты Жөні',
                      style: const TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    heightSpacer(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 38, 70, 175)),
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: Text(
                              'Бөлме - 101',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF333333),
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ),
                        widthSpacer(30),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 38, 70, 175)),
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: Text(
                              'Қабат  - 1',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF333333),
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child: CustomTextField(
                        //     controller: roomNumber,
                        //     inputHint: widget.roomNumber,
                        //   ),
                        // ),
                        // widthSpacer(20),
                        // Expanded(
                        //   child: CustomTextField(
                        //     controller: block,
                        //     inputHint: widget.blockNumber,
                        //   ),
                        // ),
                      ],
                    ),
                    heightSpacer(20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 38, 70, 175)),
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: Text(
                              'mail@.com',
                              style: TextStyle(
                                color: AppColors.kSecondaryColor,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    heightSpacer(20),
                    CustomTextField(
                      controller: username,
                      inputHint: 'qwerty',
                      prefixIcon: const Icon(Icons.person_2_outlined),
                    ),
                    // CustomTextField(
                    //   controller: emailId,
                    //   inputHint: widget.emailId,
                    //   prefixIcon: const Icon(Icons.email_outlined),
                    // ),
                    heightSpacer(20),
                    CustomTextField(
                      controller: phoneNumber,
                      inputHint: '+77477870003',
                      prefixIcon: const Icon(Icons.phone_outlined),
                    ),
                    heightSpacer(20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: firstName,
                            inputHint: 'Аты',
                          ),
                        ),
                        widthSpacer(20),
                        Expanded(
                          child: CustomTextField(
                            controller: lastName,
                            inputHint: 'Фамилиясы',
                          ),
                        ),
                      ],
                    ),
                    heightSpacer(40),
                    CustomButton(
                      color: Colors.blue,
                      press: () {
                        apiCall.updateProfile(
                          context,
                          username.text,
                          firstName.text,
                          lastName.text,
                          phoneNumber.text,
                        );
                      },
                      buttonText: 'Сақтау',
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
