import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/cipher_cubit.dart';
import '../../cubit/cipher_state.dart';
import '../widgets/action_buttons.dart';
import '../widgets/algorithm_selector.dart';
import '../widgets/key_field.dart';
import '../widgets/output_actions.dart';
import '../widgets/result_card.dart';

class CipherScreen extends StatelessWidget {
  const CipherScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CipherCubit>();
    final theme = Theme.of(context);
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: theme.brightness == Brightness.dark
              ? [Colors.black, Colors.grey.shade900]
              : [Colors.white, Colors.grey.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
        child: BlocConsumer<CipherCubit, CipherState>(
          listener: (context, state) {
            if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error!),
                  backgroundColor: Colors.redAccent,
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    elevation: 3,
                    shadowColor: Colors.black26,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: TextFormField(
                        key: const Key('input'),
                        maxLines: 5,
                        initialValue: state.input,
                        style: TextStyle(fontSize: 16.sp),
                        decoration: InputDecoration(
                          labelText: 'Enter your text',
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onChanged: cubit.setInput,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  AlgorithmSelector(
                    value: state.algorithm,
                    onChanged: cubit.setAlgorithm,
                  ),
                  SizedBox(height: 20.h),
                  KeyField(
                    algorithm: state.algorithm,
                    value: state.keyOrShift,
                    onChanged: cubit.setKeyOrShift,
                  ),
                  SizedBox(height: 20.h),
                  ActionButtons(
                    isBusy: state.isWorking,
                    onEncrypt: cubit.encrypt,
                    onDecrypt: cubit.decrypt,
                    onClear: cubit.clearAll,
                  ),
                  SizedBox(height: 25.h),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (child, anim) =>
                        FadeTransition(opacity: anim, child: child),
                    child: ResultCard(output: state.output),
                  ),
                  SizedBox(height: 10.h),
                  OutputActions(output: state.output),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
