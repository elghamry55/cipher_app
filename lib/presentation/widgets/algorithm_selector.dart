import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/cipher_state.dart';

class AlgorithmSelector extends StatelessWidget {
  final CipherAlgo value;
  final void Function(CipherAlgo) onChanged;

  const AlgorithmSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 3,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        child: DropdownButtonFormField<CipherAlgo>(
          dropdownColor: theme.cardColor,
          value: value,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Select Algorithm',
            labelStyle: TextStyle(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
            prefixIcon: Icon(
              Icons.code_rounded,
              color: theme.colorScheme.primary,
            ),
          ),
          items: const [
            DropdownMenuItem(
              value: CipherAlgo.caesar,
              child: Text('Caesar Cipher'),
            ),
            DropdownMenuItem(
              value: CipherAlgo.railFence,
              child: Text('Rail Fence Cipher'),
            ),
            DropdownMenuItem(
              value: CipherAlgo.vigenere,
              child: Text('Vigenère Cipher'),
            ),
          ],
          onChanged: (v) {
            if (v != null) onChanged(v);
          },
        ),
      ),
    );
  }
}
