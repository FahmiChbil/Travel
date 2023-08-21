import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mylasttravelapp/Auth/presentation/pages/splash_page.dart';

import 'Auth/presentation/bloc/cubit/auth_cubit.dart';
import 'Auth/presentation/pages/sign_up_page.dart';
import 'core/const/themes.dart';
import 'ijnection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(ScreenUtilInit(
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.sl<AuthCubit>(),
          )
        ],
        child: MaterialApp(
          theme: appTheme,
          routes: {
            SignUp.id: (context) => SignUp(),
          },
          home: const SplashPage(),
        ));
  }
}
