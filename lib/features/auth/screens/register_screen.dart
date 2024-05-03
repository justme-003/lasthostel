import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management/api_services/api_calls.dart';
import 'package:hostel_management/common/spacing.dart';
import 'package:hostel_management/features/auth/widgets/custom_button.dart';
import 'package:hostel_management/features/auth/widgets/custom_text_field.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  ApiCall apiCall = ApiCall();
  String? validationMessage;

  String? selectedBlock;
  String? selectedRoom;

  List<String> blockOptions = ['A', 'B'];
  List<String> roomOptionsA = ['101', '102', '103'];
  List<String> roomOptionsB = ['201', '202', '203'];
  @override
  void dispose() {
    userName.dispose();
    email.dispose();
    firstName.dispose();
    lastName.dispose();
    phoneNumber.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightSpacer(80),
                Center(
                  child: Image.asset(
                    'assets/logo.jpg',
                    width: 150.w,
                    height: 150.h,
                  ),
                ),
                heightSpacer(30),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Есептік жазбаңызды тіркеңіз',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                heightSpacer(25),
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
                      borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
                      borderRadius: BorderRadius.circular(14)),
                ),
                heightSpacer(15),
                Text('Аты', style: AppTextTheme.kLabelStyle),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Аты қажет';
                    }
                    return null;
                  },
                  controller: firstName,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
                      borderRadius: BorderRadius.circular(14)),
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
                      borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
                      borderRadius: BorderRadius.circular(14)),
                ),
                heightSpacer(15),
                Text('Электрондық пошта', style: AppTextTheme.kLabelStyle),
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
                      borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
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
                      borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
                      borderRadius: BorderRadius.circular(14)),
                ),
                heightSpacer(15),
                Text('Телефон нөмірі', style: AppTextTheme.kLabelStyle),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Телефон Нөмірі қажет';
                    }
                    return null;
                  },
                  controller: phoneNumber,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
                      borderRadius: BorderRadius.circular(14)),
                ),
                heightSpacer(15),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       height: 50.h,
                //       decoration: ShapeDecoration(
                //         shape: RoundedRectangleBorder(
                //           side: const BorderSide(
                //               width: 1,
                //               color: Color.fromARGB(255, 26, 121, 230)),
                //           borderRadius: BorderRadius.circular(14),
                //         ),
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           widthSpacer(20),
                //           Text(
                //             'Блок нөмірі.',
                //             textAlign: TextAlign.center,
                //             style: TextStyle(
                //               color: const Color(0xFF333333),
                //               fontSize: 11.sp,
                //             ),
                //           ),
                //           SizedBox(width: 8.w),
                //           DropdownButton<String>(
                //             value: selectedBlock,
                //             onChanged: (String? newValue) {
                //               setState(() {
                //                 selectedBlock = newValue;
                //                 selectedRoom = null;
                //               });
                //             },
                //             items: blockOptions.map((String block) {
                //               return DropdownMenuItem<String>(
                //                 value: block,
                //                 child: Text(block),
                //               );
                //             }).toList(),
                //           ),
                //           widthSpacer(20),
                //         ],
                //       ),
                //     ),
                //     widthSpacer(20),
                //     Expanded(
                //       child: Container(
                //         height: 50.h,
                //         decoration: ShapeDecoration(
                //           shape: RoundedRectangleBorder(
                //             side: const BorderSide(
                //                 width: 1,
                //                 color: Color.fromARGB(255, 34, 89, 208)),
                //             borderRadius: BorderRadius.circular(14),
                //           ),
                //         ),
                //         // child: Row(
                //         //   mainAxisAlignment: MainAxisAlignment.center,
                //         //   children: [
                //         //     Text(
                //         //       'Бөлме нөмері.',
                //         //       textAlign: TextAlign.center,
                //         //       style: TextStyle(
                //         //         color: const Color(0xFF333333),
                //         //         fontSize: 11.sp,
                //         //       ),
                //         //     ),
                //         //     const SizedBox(width: 8),
                //         //     DropdownButton<String>(
                //         //       value: selectedRoom,
                //         //       onChanged: (String? newValue) {
                //         //         setState(() {
                //         //           selectedRoom = newValue;
                //         //         });
                //         //       },
                //         //       items: (selectedBlock == 'A'
                //         //               ? roomOptionsA
                //         //               : roomOptionsB)
                //         //           .map((String room) {
                //         //         return DropdownMenuItem<String>(
                //         //           value: room,
                //         //           child: Text(room),
                //         //         );
                //         //       }).toList(),
                //         //     ),
                //         //   ],
                //         // ),
                //       ),
                //     ),
                //   ],
                // ),
                heightSpacer(40),
                CustomButton(
                  buttonText: "Тіркелу",
                  color: Colors.blue,
                  press: () async {
                    // if (selectedBlock == null || selectedRoom == null) {
                    //   setState(() {
                    //     validationMessage =
                    //         'Please select both block and room.';
                    //   });

                    // }
                    if (_formKey.currentState!.validate()) {
                      print('validated');
                      await apiCall.registerStudent(
                        userName.text,
                        firstName.text,
                        lastName.text,
                        password.text,
                        email.text,
                        phoneNumber.text,
                        selectedBlock ?? "",
                        selectedRoom ?? "",
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
