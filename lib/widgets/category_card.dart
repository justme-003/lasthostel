import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:hostel_management/common/spacing.dart';

class CategoryCard extends StatelessWidget {
  String category;
  String image;
  VoidCallback onTap;
  CategoryCard({
    Key? key,
    required this.category,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // width: 100.w,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              topLeft: Radius.circular(30.r),
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
          ),
          shadows: const [
            BoxShadow(
              color: Color.fromARGB(218, 23, 76, 248),
              blurRadius: 4,
              offset: Offset(1, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              width: 70.w,
              height: 70.h,
              child: Image.asset(
                image,
              ),
            ),
            heightSpacer(10),
            Text(
              category,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF333333),
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            heightSpacer(9),
          ],
        ),
      ),
    );
  }
}
