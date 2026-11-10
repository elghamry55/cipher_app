import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/cipher_state.dart';

class KeyField extends StatelessWidget {
  final CipherAlgo algorithm;
  final String value;
  final void Function(String) onChanged;

  const KeyField({
    super.key,
    required this.algorithm,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String label = '';
    String hint = '';
    TextInputType kb = TextInputType.text;

    if (algorithm == CipherAlgo.caesar) {
      label = 'Shift';
      hint = 'Enter shift value (default = 3)';
      kb = TextInputType.number;
    } else if (algorithm == CipherAlgo.railFence) {
      label = 'Rails';
      hint = 'Enter number of rails (default = 3)';
      kb = TextInputType.number;
    } else {
      label = 'Key';
      hint = 'Enter key (default = "KEY")';
      kb = TextInputType.text;
    }

    final controller = TextEditingController(text: value);

    return Card(
      elevation: 3,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
        child: TextFormField(
          controller: controller,
          keyboardType: kb,
          style: TextStyle(fontSize: 15.sp),
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            labelStyle: TextStyle(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
            ),
            border: InputBorder.none,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
