import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mylasttravelapp/Auth/presentation/pages/splash_page.dart';
import 'package:mylasttravelapp/Hotel/presentation/Cubit/cubit/all_hotels_cubit.dart';
import 'package:mylasttravelapp/Hotel/presentation/Cubit/cubit/pay_cubit_cubit.dart';
import 'package:mylasttravelapp/Hotel/presentation/Hotels_cubit/hotels_cubit.dart';
import 'package:mylasttravelapp/Hotel/presentation/pages/first_page.dart';
import 'package:mylasttravelapp/admin/presentation/cubit/edit_data_cubit.dart';
import 'package:mylasttravelapp/admin/presentation/pages/add_data_page.dart';
import 'package:mylasttravelapp/admin/presentation/pages/chat_page.dart';
import 'package:mylasttravelapp/core/const/stripe_keys.dart';

import 'Auth/presentation/bloc/cubit/auth_cubit.dart';
import 'Auth/presentation/pages/sign_up_page.dart';
import 'core/const/themes.dart';
import 'ijnection.dart' as di;

void main() async {
  Stripe.publishableKey = ApiKeys.publishablekey;

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
          ),
          BlocProvider(
            create: (context) => di.sl<HotelsCubit>(),
          ),
          BlocProvider(
            create: (context) => di.sl<AllHotelsCubit>(),
          ),
          BlocProvider(
            create: (context) => di.sl<PayCubitCubit>(),
          ),
          BlocProvider(
            create: (context) => di.sl<EditDataCubit>(),
          )
        ],
        child: MaterialApp(
          theme: appTheme,
          routes: {
            ChatPageAdmin.id: (context) => ChatPageAdmin(),
            AddDataPage.id: (context) => AddDataPage(),
            FirstPage.id: (context) => FirstPage(),
            SignUp.id: (context) => const SignUp(),
          },
          home: const SplashPage(),
        ));
  }
}
