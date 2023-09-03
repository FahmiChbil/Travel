import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mylasttravelapp/Auth/presentation/pages/sign_up_page.dart';
import 'package:mylasttravelapp/Auth/presentation/widgets/default_sncakBar.dart';
import 'package:mylasttravelapp/Auth/presentation/widgets/default_text_form_field.dart';
import 'package:mylasttravelapp/Hotel/data/datasources/hotel_remote_datasource.dart';
import 'package:mylasttravelapp/Hotel/presentation/pages/first_page.dart';

import '../bloc/cubit/auth_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isLoading = false;
  bool obs2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("018a78"),
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoadingAuthState) {
              isLoading = true;
            } else if (state is SucceesAuthState) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstPage(),
                  ));
              ScaffoldMessenger.of(context)
                  .showSnackBar(defaultSnack("register succed", Colors.black));
              isLoading = false;
            } else if (state is FailureAuthState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(defaultSnack(state.errorMessage, Colors.black));
            }
          },
          child: ListView(
            children: [
              ModalProgressHUD(
                inAsyncCall: isLoading,
                progressIndicator: const CircularProgressIndicator(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Travell App",
                        style: TextStyle(
                            fontSize: 25.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: const Text(
                          "our services is open and free for your trip you can register and contat us at any time",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      DefaultTextFomField(
                        suff: null,
                        emailcontroller: emailcontroller,
                        myHint: "Your Email",
                        myLabel: "Email",
                        obs: false,
                        myvalidator: (value) {
                          if (value == null) {
                            return "please add valid email";
                          }
                          if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value) ==
                              false) {
                            return "not valid email ";
                          }
                          return null;
                        },
                      ),
                      DefaultTextFomField(
                          suff: IconButton(
                              onPressed: () {
                                setState(() {
                                  obs2 = !obs2;
                                });
                              },
                              icon: const Icon(Icons.remove_red_eye)),
                          emailcontroller: passwordController,
                          myHint: "Your Passwod",
                          myLabel: "Password",
                          myvalidator: (value) {
                            if (value!.isEmpty) {
                              return "please enter your password";
                            }
                            return null;
                          },
                          obs: obs2),
                      ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await context.read<AuthCubit>().signIn(
                                  emailcontroller.text,
                                  passwordController.text);
                            }
                          },
                          child: const Text("Sign In")),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, SignUp.id);
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(color: Colors.orange),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
