import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_management/api_services/api_utils.dart';
import 'package:hostel_management/common/app_bar.dart';
import 'package:hostel_management/common/constants.dart';
import 'package:hostel_management/common/spacing.dart';
import 'package:provider/provider.dart';

class Ava extends StatelessWidget {
  const Ava({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        'Жатақана тақтасы',
      ),
      body: checkRoleAccess(),
    );
  }

  Widget checkRoleAccess() {
    // Проверяем роль пользователя
    if (ApiUrls.roleId == 2 || ApiUrls.roleId == 3) {
      // Если roleId 2 или 3, ограничиваем доступ
      return const Center(
        child: Text("Бұл бетті көруге рұқсатыңыз жоқ"),
      );
    } else {
      // Если roleId 1 или любой другой, предоставляем доступ
      return buildAdminContent();
    }
  }

  Widget buildAdminContent() {
    // Строим UI для администратора или разрешенной роли
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            heightSpacer(20),
            SvgPicture.asset(
              AppConstants.avaa,
              height: 200.h,
            ),
            heightSpacer(40),
            Container(
              width: double.maxFinite,
              decoration: ShapeDecoration(
                color: Color.fromARGB(147, 38, 93, 223),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 4,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color.fromARGB(255, 50, 84, 220),
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x332E8B57),
                    blurRadius: 8,
                    offset: Offset(1, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpacer(15),
                    Text(
                      'Жатақана туралы ақпарат',
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    heightSpacer(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Жалпы бөлмелер саны - 120',
                          style: TextStyle(
                            color: const Color(0xFF464646),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '',
                          style: TextStyle(
                            color: const Color(0xFF464646),
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    heightSpacer(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Бос бөлмелер саны - 72 ',
                          style: TextStyle(
                            color: const Color(0xFF464646),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '45 % ',
                          style: TextStyle(
                            color: const Color(0xFF464646),
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    heightSpacer(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Бос емес бөлмелер саны  - 88',
                          style: TextStyle(
                            color: const Color(0xFF464646),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '55 % ',
                          style: TextStyle(
                            color: const Color(0xFF464646),
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    heightSpacer(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Жатақана сыйымдылығы - 600 студент',
                          style: TextStyle(
                            color: const Color(0xFF464646),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '',
                          style: TextStyle(
                            color: const Color(0xFF464646),
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    heightSpacer(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Студенттер саны -  410 студент',
                          style: TextStyle(
                            color: const Color(0xFF464646),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '',
                          style: TextStyle(
                            color: const Color(0xFF464646),
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    heightSpacer(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ақпарат жаңартылды  ',
                          style: TextStyle(
                            color: const Color(0xFF464646),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '5 секунд бұрын',
                          style: TextStyle(
                            color: const Color(0xFF464646),
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    heightSpacer(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
