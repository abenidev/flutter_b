import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../constants/colors.dart';

class IncomeOutcomeCard extends StatelessWidget {
  IncomeOutcomeCard({super.key, required this.title, required this.percentage, required this.amount, required this.onDetailTap, required this.isIncome});
  final String title;
  final int percentage;
  final int amount;
  final bool isIncome;
  final Function() onDetailTap;
  final formatter = NumberFormat('###,000');

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
        height: 18.h,
        decoration: BoxDecoration(
          color: kbgLightColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0.6.w, vertical: 0.25.h),
                    decoration: BoxDecoration(color: kbgUlLightColor, borderRadius: BorderRadius.circular(3.0)),
                    child: Text(
                      isIncome ? '+$percentage%' : '-$percentage%',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
            ),

            //
            SizedBox(
              child: Text(
                isIncome ? '${formatter.format(amount)} Br.' : '${formatter.format(amount)} Br.',
                style: TextStyle(color: Colors.white, fontSize: 19.sp, fontWeight: FontWeight.w600),
              ),
            ),

            GestureDetector(
              onTap: onDetailTap,
              child: SizedBox(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: kbgUlLightColor, width: 1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'View details',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.white, size: 3.w),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
