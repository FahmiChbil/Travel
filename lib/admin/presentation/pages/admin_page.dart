import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mylasttravelapp/Auth/presentation/bloc/cubit/auth_cubit.dart';
import 'package:mylasttravelapp/Auth/presentation/pages/splash_page.dart';

import 'package:mylasttravelapp/admin/presentation/pages/add_data_page.dart';
import 'package:mylasttravelapp/admin/presentation/pages/chat_page.dart';
import 'package:mylasttravelapp/core/const/themes.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignOutSuccees) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SplashPage(),
              ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: backColor,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ChatPageAdmin.id);
                },
                icon: const Icon(Icons.chat))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // AdminRemoteDataSourcImpl().addData(oneHotelModel, placeModel);
                    Navigator.pushNamed(context, AddDataPage.id);
                  },
                  child: const Text("Add Data ")),
              SizedBox(
                height: 15.h,
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Update Data ")),
              SizedBox(
                height: 15.h,
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text("delete  Data ")),
            ],
          ),
        ),
      ),
    );
  }
}
