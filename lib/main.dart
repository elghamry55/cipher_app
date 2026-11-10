import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cubit/cipher_cubit.dart';
import 'presentation/screens/cipher_screen.dart';

void main() {
  runApp(const CipherApp());
}

class CipherApp extends StatefulWidget {
  const CipherApp({super.key});

  @override
  State<CipherApp> createState() => _CipherAppState();
}

class _CipherAppState extends State<CipherApp> {
  bool _dark = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CipherCubit(),
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Cipher Box',
            themeMode: _dark ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: Colors.indigo,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.indigo,
                brightness: Brightness.dark,
              ),
            ),
            home: Builder(
              builder: (ctx) => Scaffold(
                appBar: AppBar(
                  title: const Text(
                    'Cipher Box',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(_dark ? Icons.dark_mode : Icons.light_mode),
                      onPressed: () => setState(() => _dark = !_dark),
                      tooltip: _dark ? 'Switch to Light' : 'Switch to Dark',
                    ),
                  ],
                ),
                body: const SafeArea(child: CipherScreen()),
              ),
            ),
          );
        },
      ),
    );
  }
}
