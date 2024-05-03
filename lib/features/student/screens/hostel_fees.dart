import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_management/api_services/api_utils.dart';
import 'package:hostel_management/common/app_bar.dart';
import 'package:hostel_management/common/constants.dart';
import 'package:hostel_management/common/spacing.dart';

class HostelFee extends StatelessWidget {
  const HostelFee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        'Жатақана ақысы',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              heightSpacer(20),
              SvgPicture.asset(
                AppConstants.hostel,
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
                      heightSpacer(20),
                      Text(
                        'Жатақана туралы ақпарат',
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      heightSpacer(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Қабат - 1',
                                style: TextStyle(
                                  color: const Color(0xFF464646),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Бөлме - 101',
                                style: TextStyle(
                                  color: const Color(0xFF464646),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      heightSpacer(20),
                      const Text(
                        'Төлем деректемелері ',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      heightSpacer(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Техникалық қызмет -',
                            style: TextStyle(
                              color: const Color(0xFF464646),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '0 тг',
                            style: TextStyle(
                              color: const Color(0xFF464646),
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      heightSpacer(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Көлік тұрағы - ',
                            style: TextStyle(
                              color: const Color(0xFF464646),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '5 000 тг',
                            style: TextStyle(
                              color: const Color(0xFF464646),
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      heightSpacer(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Су шығыны - ',
                            style: TextStyle(
                              color: const Color(0xFF464646),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '3 000 тг',
                            style: TextStyle(
                              color: const Color(0xFF464646),
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      heightSpacer(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Бөлме ақысы - ',
                            style: TextStyle(
                              color: const Color(0xFF464646),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '50 000 тг',
                            style: TextStyle(
                              color: const Color(0xFF464646),
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      heightSpacer(20),
                      const Divider(
                        color: Colors.black,
                      ),
                      heightSpacer(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Жалпы cомасы - ',
                            style: TextStyle(
                              color: const Color(0xFF464646),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '58 000 тг',
                            style: TextStyle(
                              color: const Color(0xFF464646),
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      heightSpacer(30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
