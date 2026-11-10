import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultCard extends StatelessWidget {
  final String output;

  const ResultCard({super.key, required this.output});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isEmpty = output.trim().isEmpty;

    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      color: theme.brightness == Brightness.dark
          ? Colors.grey.shade900
          : Colors.grey.shade50,
      child: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Output',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.brightness == Brightness.dark
                    ? Colors.grey.shade800
                    : Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 0.8,
                ),
              ),
              padding: EdgeInsets.all(12.w),
              child: SelectableText(
                isEmpty ? 'Result will appear here' : output,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: isEmpty
                      ? Colors.grey.shade500
                      : theme.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}