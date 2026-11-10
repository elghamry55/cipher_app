import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButtons extends StatelessWidget {
  final bool isBusy;
  final VoidCallback onEncrypt;
  final VoidCallback onDecrypt;
  final VoidCallback onClear;

  const ActionButtons({
    super.key,
    required this.isBusy,
    required this.onEncrypt,
    required this.onDecrypt,
    required this.onClear,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: isBusy ? null : onEncrypt,
                icon: const Icon(Icons.lock, size: 20),
                label: Text(
                  'Encrypt',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 3,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: isBusy ? null : onDecrypt,
                icon: const Icon(Icons.lock_open, size: 20),
                label: Text(
                  'Decrypt',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.secondary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 3,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Ink(
              decoration: ShapeDecoration(
                color: theme.colorScheme.errorContainer.withOpacity(0.3),
                shape: const CircleBorder(),
              ),
              child: IconButton(
                tooltip: 'Clear all',
                onPressed: onClear,
                icon: const Icon(Icons.clear_rounded),
                iconSize: 24.r,
                color: theme.colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}